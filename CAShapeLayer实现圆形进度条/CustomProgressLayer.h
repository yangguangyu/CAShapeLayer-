//
//  CustomProgressLayer.h
//  CAShapeLayer实现圆形进度条
//
//  Created by yangguangyu on 16/8/31.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomProgressLayer : CAShapeLayer
@property (nonatomic, assign) CGFloat progressValue;

-(void)addProgressLayerOnView:(UIView *)view;
-(void)reveal;
@end
