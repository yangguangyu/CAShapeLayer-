//
//  ViewController.m
//  CAShapeLayer实现圆形进度条
//
//  Created by yangguangyu on 16/8/31.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import "ViewController.h"
#import "CustomProgressLayer.h"
#import "UIImageView+ProgressView.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *centerView;
@property (nonatomic, strong) CustomProgressLayer *progressLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressLayer = [CustomProgressLayer layer];
    [self.progressLayer addProgressLayerOnView:self.centerView];
    [self.centerView addProgressViewWithImageName:@"http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg" andPlacehlder:nil];
}

- (IBAction)slide:(UISlider *)sender {
    self.progressLayer.progressValue = sender.value;
}

@end
