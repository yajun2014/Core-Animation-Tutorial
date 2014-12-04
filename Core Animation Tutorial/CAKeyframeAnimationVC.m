//
//  CAKeyframeAnimationVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/3/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "CAKeyframeAnimationVC.h"

@interface CAKeyframeAnimationVC ()

@end

@implementation CAKeyframeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 20.0, 40.0);
    for (NSUInteger i = 0; i < 10; i++) {
        CGFloat x = (i % 2) ? 20.0 : 30;
        CGFloat y = 40.0 + 30.0 * (i + 1);
        //		CGPathAddLineToPoint(path, NULL, x, y);
        CGPathAddArcToPoint(path, NULL, x, y, x, y + 20.0, 10.0);
    }
    spot = [[ZBLayoutLayer alloc] init];
    spot.bounds = CGRectMake(0.0, 0.0, 30.0, 30.0);
    spot.color = [UIColor redColor];
    [self.view.layer addSublayer:spot];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5.0;
    animation.path = path;
    animation.repeatCount = NSUIntegerMax;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [spot addAnimation:animation forKey:@"move"];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
