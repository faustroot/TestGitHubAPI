//
//  TGPhotoView.m
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/5/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import "TGPhotoView.h"

#define TIME_ANIMATION_SHOW 0.5f
#define TIME_ANIMATION_DISMISS 0.3f

@interface TGPhotoView ()

@property (nonatomic, strong) UIImageView *imageViewPhoto;
@property (nonatomic, strong) UIImageView *imageViewFade;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizerShow;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizerDismiss;

@property (nonatomic, weak) UIImageView *parentImageView;
@property (nonatomic, strong) LoadingPhotoBlock loadPhotoBlock;
@property (nonatomic) BOOL isAnimationRun;
@end

@implementation TGPhotoView

- (id)initWithImageView:(UIImageView *)aParentImageView loadingBlock:(LoadingPhotoBlock)aLoadingBlock
{
	if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
	{
		self.loadPhotoBlock = aLoadingBlock;
		self.parentImageView = aParentImageView;
		self.parentImageView.userInteractionEnabled = YES;
		self.parentImageView.multipleTouchEnabled = YES;

		self.tapGestureRecognizerShow = [[UITapGestureRecognizer alloc] initWithTarget:self
																				action:@selector(showPhoto:)];
		[self.tapGestureRecognizerShow setNumberOfTapsRequired:1];
		[self.tapGestureRecognizerShow setNumberOfTouchesRequired:1];
		[self.parentImageView addGestureRecognizer:self.tapGestureRecognizerShow];

		self.isAnimationRun = NO;
		self.backgroundColor = [UIColor clearColor];

		
		self.tapGestureRecognizerDismiss = [[UITapGestureRecognizer alloc] initWithTarget:self
																				   action:@selector(dismissPhoto)];
		[self.tapGestureRecognizerDismiss setNumberOfTapsRequired:1];
		[self.tapGestureRecognizerDismiss setNumberOfTouchesRequired:1];
		[self addGestureRecognizer:self.tapGestureRecognizerDismiss];
		

		
		self.imageViewFade = [[UIImageView alloc] initWithFrame:self.frame];
		self.imageViewFade.backgroundColor = [UIColor blackColor];
		self.imageViewFade.alpha = 0.f;
		[self addSubview:self.imageViewFade];
		
		self.imageViewPhoto = [UIImageView new];
		self.imageViewPhoto.clipsToBounds = YES;
		[self addSubview:self.imageViewPhoto];
	}
	return self;
}

- (void)showPhoto:(UIGestureRecognizer*)aTap
{
	if (!self.isAnimationRun)
	{
		self.isAnimationRun = YES;

		self.loadPhotoBlock(self.imageViewPhoto);
		
		[[[UIApplication sharedApplication] keyWindow] addSubview:self];
		
		self.alpha = 1.0;
		self.imageViewFade.alpha = 0.0;
		self.imageViewPhoto.alpha = 1.0;

		self.imageViewPhoto.layer.cornerRadius = self.parentImageView.layer.cornerRadius;
		CGRect startFrame = self.imageViewPhoto.frame;
		startFrame.size = self.parentImageView.frame.size;
		startFrame.origin = [self.parentImageView convertPoint:self.parentImageView.frame.origin toView:nil];
		startFrame.origin.x -= self.parentImageView.frame.origin.x;
		startFrame.origin.y -= self.parentImageView.frame.origin.y;
		self.imageViewPhoto.frame = startFrame;

		
		float minSideScreen = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
		CGPoint centerScreen = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5f,
										   [UIScreen mainScreen].bounds.size.height * 0.5f);
		
		
		[UIView animateWithDuration:TIME_ANIMATION_SHOW
							  delay:0
							options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut
						 animations:^{
							 
							 self.imageViewFade.alpha = 1.0;

							 CGRect finishFrame = self.imageViewPhoto.frame;
							 finishFrame.size = CGSizeMake(minSideScreen, minSideScreen);
							 self.imageViewPhoto.frame = finishFrame;
							 self.imageViewPhoto.center = centerScreen;
							 
							 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
							 animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
							 animation.fromValue = [NSNumber numberWithFloat:self.imageViewPhoto.layer.cornerRadius];
							 animation.toValue = [NSNumber numberWithFloat:0.0f];
							 animation.duration = TIME_ANIMATION_SHOW;
							 [self.imageViewPhoto.layer addAnimation:animation forKey:@"cornerRadius"];

							 self.imageViewPhoto.layer.cornerRadius = 0.f;

						 }
						 completion:^(BOOL finished){
							 self.isAnimationRun = NO;
						 }];
		
		[self setNeedsDisplay];
	}
}

- (void)dismissPhoto
{
	if (!self.isAnimationRun)
	{
		self.isAnimationRun = YES;
		
		[UIView animateWithDuration:TIME_ANIMATION_DISMISS
							  delay:0
							options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
						 animations:^{
							 self.alpha = 0.f;
							 self.imageViewPhoto.alpha = 0.f;
						 }
						 completion:^(BOOL finished){
							 self.isAnimationRun = NO;
							 [self removeFromSuperview];
						 }];
		
		[self setNeedsDisplay];

	}
}

@end
