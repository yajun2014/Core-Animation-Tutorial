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
    [self myMove];
    [self myScale];
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
    myLayer.frame = CGRectMake(80, 100, 80, 80);
    myLayer.cornerRadius = 7;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myLayer];
    
    // Rotate over Z axis
    CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:2.0 * M_PI];
    rotateAnimation.duration = 5;
    rotateAnimation.repeatCount = NSNotFound;
    [myLayer addAnimation:rotateAnimation forKey:@"myRotate"];
    
}



- (void)myMove
{
    
    CALayer *myMoveLayer = [[CALayer alloc]init];
  //  myMoveLayer.backgroundColor = [[UIColor blueColor]CGColor];
    myMoveLayer.frame = CGRectMake(50, 205, 80, 80);
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myMoveLayer.contents = (id)image.CGImage;
    myMoveLayer.cornerRadius = 5;
    [self.view.layer addSublayer:myMoveLayer];
    
    // 移动kkLayer的position
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:myMoveLayer.position];
    CGPoint toPoint = myMoveLayer.position;
    toPoint.x += 180;
    toPoint.y += 80;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    animation.duration = 3;
    animation.repeatCount = NSNotFound;
    
    [myMoveLayer addAnimation:animation forKey:@"myMove"];
    
}

- (void)myScale

{
    CALayer *myScaleLayer = [CALayer layer];
    
    myScaleLayer.frame = CGRectMake(80, 300, 80, 80);
    myScaleLayer.cornerRadius = 7;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myScaleLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myScaleLayer];
    
    
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 2.0f;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = NSNotFound;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [myScaleLayer addAnimation:scaleAnimation forKey:@"myScale"];
}



- (void)myCombine{
    
    
    CALayer *myCombineLayer = [CALayer layer];
    
    myCombineLayer.frame = CGRectMake(80, 350, 80, 80);
   myCombineLayer.cornerRadius = 7;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    myCombineLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:myCombineLayer];
    
    

    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3]; // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    rotationAnimation.duration = 1.9f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 2.0f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.0f;
    animationGroup.autoreverses = YES;
    animationGroup.repeatCount = HUGE_VALF;
    [animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil]];
    
    [myCombineLayer addAnimation:animationGroup forKey:@"animationGroup"];
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
