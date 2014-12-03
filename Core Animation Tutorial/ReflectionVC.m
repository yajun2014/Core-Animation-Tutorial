//
//  ReflectionVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/3/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "ReflectionVC.h"

@interface ReflectionVC ()

@end

@implementation ReflectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"Great Wall.png"];
    
    // Image Layer
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (id)image.CGImage;
    imageLayer.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    imageLayer.position = CGPointMake(160, 130);
    imageLayer.borderColor = [UIColor darkGrayColor].CGColor;
    imageLayer.borderWidth = 1.0;
    [self.view.layer addSublayer:imageLayer];
    
    // Reflection Layer
    CALayer *reflectionLayer = [CALayer layer];
    reflectionLayer.contents = imageLayer.contents;
    reflectionLayer.bounds = imageLayer.bounds;
    reflectionLayer.position = CGPointMake(160, 330);
    reflectionLayer.borderColor = imageLayer.borderColor;
    reflectionLayer.borderWidth = imageLayer.borderWidth;
    reflectionLayer.opacity = 0.7;
    // Transform X by 180 degrees
    [reflectionLayer setValue:[NSNumber numberWithFloat:M_PI] forKeyPath:@"transform.rotation.x"];
    
    // Gradient Layer - Use as mask
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = reflectionLayer.bounds;
    gradientLayer.position = CGPointMake(reflectionLayer.bounds.size.width / 2, reflectionLayer.bounds.size.height * 0.65);
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor],(id)[[UIColor whiteColor] CGColor], nil];
    gradientLayer.startPoint = CGPointMake(0.5, 0.5);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    
    // Add gradient layer as a mask
    reflectionLayer.mask = gradientLayer;
    [self.view.layer addSublayer:reflectionLayer];

    
    
    
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
