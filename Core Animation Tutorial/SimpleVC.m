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
    [self myScale];
    [self myMove];
    [self myCombine];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)myRotate
{
    
    CALayer *myLayer = [[CALayer alloc]init];
   // myLayer.backgroundColor = [[UIColor whiteColor]CGColor];
    myLayer.frame = CGRectMake(50, 110, 80, 80);
    myLayer.cornerRadius = 2;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myLayer];
    // Rotate over Z axis
    CABasicAnimation *myRotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    myRotateAnimation .fromValue = [NSNumber numberWithFloat:0.0];
    myRotateAnimation .toValue = [NSNumber numberWithFloat:2.0 * M_PI];
    myRotateAnimation .duration = 5;
    myRotateAnimation .repeatCount = NSNotFound;
    [myLayer addAnimation:myRotateAnimation  forKey:@"myRotate"];
    
}


- (void)myScale

{
    CALayer *myScaleLayer = [CALayer layer];
    myScaleLayer.frame = CGRectMake(190, 110, 80, 80);
    myScaleLayer.cornerRadius = 2;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myScaleLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myScaleLayer];
 
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 3;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = NSNotFound;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [myScaleLayer addAnimation:scaleAnimation forKey:@"myScale"];
}




- (void)myMove
{
    
    CALayer *myMoveLayer = [[CALayer alloc]init];
    myMoveLayer.frame = CGRectMake(50, 255, 80, 80);
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myMoveLayer.contents = (id)image.CGImage;
    myMoveLayer.cornerRadius = 2;
    [self.view.layer addSublayer:myMoveLayer];
    // move Animation
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = myMoveLayer.position;
    fromPoint.x-=50;
    fromPoint.y-=40;
    animation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    CGPoint toPoint = myMoveLayer.position;
    toPoint.x += 180;
    toPoint.y += 40;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    animation.duration = 3;
    animation.repeatCount = NSNotFound;
    [myMoveLayer addAnimation:animation forKey:@"myMove"];
    
}


- (void)myCombine{
    
    CALayer *myCombineLayer = [CALayer layer];
    myCombineLayer.frame = CGRectMake(50, 420, 80, 80);
    myCombineLayer.cornerRadius = 2;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myCombineLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myCombineLayer];
    
    // move position
    CABasicAnimation *moveAnimation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = myCombineLayer.position;
    fromPoint.x-=80;
    fromPoint.y-=10;
    moveAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    CGPoint toPoint = myCombineLayer.position;
    toPoint.x += 110;
    toPoint.y += 10;
    moveAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    moveAnimation.autoreverses = YES;
    moveAnimation.duration = 2;
    moveAnimation.repeatCount = NSNotFound;
    // Rotate animation
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:7 * M_PI];
    rotationAnimation.duration = 2;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // scale animation
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.duration = 2;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // combine all animations
    CAAnimationGroup *animationCombine = [CAAnimationGroup animation];
    animationCombine.duration = 2;
    animationCombine.autoreverses = YES;
    animationCombine.repeatCount = NSNotFound;
    [animationCombine setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation,moveAnimation, nil]];
    [myCombineLayer addAnimation:animationCombine forKey:@"animationCombine"];
}


@end
