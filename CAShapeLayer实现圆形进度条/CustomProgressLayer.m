//
//  CustomProgressLayer.m
//  CAShapeLayer实现圆形进度条
//
//  Created by yangguangyu on 16/8/31.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import "CustomProgressLayer.h"

@implementation CustomProgressLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    self.strokeColor = [UIColor redColor].CGColor;
    self.fillColor = [UIColor clearColor].CGColor;
    self.lineWidth = 5;
    self.strokeStart = 0;
    self.strokeEnd = 0;
}


-(void)addProgressLayerOnView:(UIView *)view {
    self.frame = view.bounds;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5) radius:self.frame.size.width * 0.1 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    self.path = path.CGPath;
    
    [view.layer addSublayer:self];
}

-(void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    
    if (progressValue < 0) {
        progressValue = 0;
    }else if (progressValue > 1) {
        progressValue = 1;
    }
    
    self.strokeEnd = progressValue;
}

-(void)reveal {
    self.superlayer.mask = self;

    //动画
    CABasicAnimation *lineAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
//    lineAnimation.toValue = @(300);//这里决定了中间最后状态时中心圆环的大小
    lineAnimation.toValue = @(self.bounds.size.width);
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    pathAnimation.toValue = toPath;//这里决定了最外层

    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[lineAnimation,pathAnimation];
    group.duration = 2;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.delegate = self;//不需要也可以
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [self addAnimation:group forKey:nil];

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.superlayer.mask = nil;
}

@end
