//
//  UIImageView+ProgressView.m
//  CAShapeLayer实现圆形进度条
//
//  Created by yangguangyu on 16/9/1.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import "UIImageView+ProgressView.h"
#import "UIImageView+WebCache.h"
#import "CustomProgressLayer.h"

@implementation UIImageView (ProgressView)

-(void)addProgressViewWithImageName:(NSString *)imageName andPlacehlder:(UIImage *)placeholder{
    CustomProgressLayer *layer = [CustomProgressLayer layer];
    [layer addProgressLayerOnView:self];
    [self sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:placeholder options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        layer.progressValue = (CGFloat)receivedSize/(CGFloat)expectedSize;
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        [layer removeFromSuperlayer];
        [layer reveal];
    }];
}
@end
