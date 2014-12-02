//
//  SimpleVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/2/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "SimpleVC.h"

@interface SimpleVC ()

@end

@implementation SimpleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self myRotate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)myRotate
{
    
    CALayer *myLayer = [[CALayer alloc]init];
    myLayer.backgroundColor = [[UIColor whiteColor]CGColor];
    myLayer.frame = CGRectMake(80, 100, 80, 80);
    myLayer.cornerRadius = 3;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myLayer];
    
    // 以z轴进行旋转
    CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.duration = 8;
    rotateAnimation.repeatCount = NSNotFound;
    [myLayer addAnimation:rotateAnimation forKey:@"animationRotate"];
    
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
