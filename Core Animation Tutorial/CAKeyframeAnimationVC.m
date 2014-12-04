//
//  CAKeyframeAnimationVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/3/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "CAKeyframeAnimationVC.h"
#import <QuartzCore/QuartzCore.h>

#define degreesToRadians(x) (M_PI * x / 180.0)
#define P(x,y) CGPointMake(x, y)

@interface CAKeyframeAnimationVC ()

@end

@implementation CAKeyframeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    [trackPath moveToPoint:P(160, 25)];
    [trackPath addCurveToPoint:P(300, 120)
                 controlPoint1:P(320, 0)
                 controlPoint2:P(300, 80)];
    [trackPath addCurveToPoint:P(80, 380)
                 controlPoint1:P(300, 200)
                 controlPoint2:P(200, 480)];
    [trackPath addCurveToPoint:P(140, 300)
                 controlPoint1:P(0, 300)
                 controlPoint2:P(200, 220)];
    [trackPath addCurveToPoint:P(210, 200)
                 controlPoint1:P(30, 420)
                 controlPoint2:P(280, 300)];
    [trackPath addCurveToPoint:P(70, 110)
                 controlPoint1:P(110, 80)
                 controlPoint2:P(110, 80)];
    [trackPath addCurveToPoint:P(160, 25)
                 controlPoint1:P(0, 160)
                 controlPoint2:P(0, 40)];
    
    CAShapeLayer *racetrack = [CAShapeLayer layer];
    racetrack.path = trackPath.CGPath;
    racetrack.strokeColor = [UIColor blackColor].CGColor;
    racetrack.fillColor = [UIColor clearColor].CGColor;
    racetrack.lineWidth = 30.0;
    [self.view.layer addSublayer:racetrack];
    
    CAShapeLayer *centerline = [CAShapeLayer layer];
    centerline.path = trackPath.CGPath;
    centerline.strokeColor = [UIColor whiteColor].CGColor;
    centerline.fillColor = [UIColor clearColor].CGColor;
    centerline.lineWidth = 2.0;
    centerline.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:2], nil];
    [self.view.layer addSublayer:centerline];
    
    CALayer *car = [CALayer layer];
    car.bounds = CGRectMake(0, 0, 44.0, 20.0);
    car.position = P(160, 25);
    car.contents = (id)([UIImage imageNamed:@"OSU-logo.png"].CGImage);
    [self.view.layer addSublayer:car];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = trackPath.CGPath;
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.repeatCount = HUGE_VALF;
    anim.duration = 8.0;
    [car addAnimation:anim forKey:@"race"];
    
    
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 20.0, 40.0);
//    for (NSUInteger i = 0; i < 10; i++) {
//        CGFloat x = (i % 2) ? 20.0 : self.view.bounds.size.width - 20.0;
//        CGFloat y = 40.0 + 30.0 * (i + 1);
//        //		CGPathAddLineToPoint(path, NULL, x, y);
//        CGPathAddArcToPoint(path, NULL, x, y, x, y + 20.0, 10.0);
//    }
//    
//    
//    
//    CGPathMoveToPoint(_path, NULL, 15.0, 15.0);
//    CGPathAddLineToPoint(_path, NULL, 100.0, 100.0);
//    CGPathAddArc(_path, NULL, 100.0, 100.0, 75.0, 0.0, (CGFloat) M_PI, 1);
//    CGPathAddLineToPoint(_path, NULL, 200.0, 150.0);
//    CGPathAddCurveToPoint(_path, NULL, 150.0, 150.0, 50.0, 350.0, 300, 300);
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    spot = [[ZBLayoutLayer alloc] init];
//    spot.bounds = CGRectMake(0.0, 0.0, 30.0, 30.0);
//    spot.color = [UIColor redColor];
//    [self.view.layer addSublayer:spot];
//    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    animation.duration = 5.0;
//    animation.path = path;
//    animation.repeatCount = NSUIntegerMax;
//    animation.autoreverses = YES;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [spot addAnimation:animation forKey:@"move"];
//    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorSpaceRef rgbColor = CGColorSpaceCreateDeviceRGB();
    CGFloat black[4] = {0.0, 0.0, 0.0, 1.0};
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorSpace(ctx, rgbColor);
    CGContextSetStrokeColor(ctx, black);
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
    CGColorSpaceRelease(rgbColor);
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
