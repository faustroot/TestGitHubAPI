//
//  TGPhotoView.h
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/5/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGPhotoView : UIView

typedef void (^LoadingPhotoBlock)(UIImageView*);


- (id)initWithImageView:(UIImageView*)aParentImageView loadingBlock:(LoadingPhotoBlock)aLoadingBlock;
@end
