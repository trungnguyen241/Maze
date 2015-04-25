//
//  ViewController.m
//  Maze
//
//  Created by Alex on 4/25/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGPoint firstPosition1 = ghost1.center;
    CGPoint lastPosition1 = CGPointMake(firstPosition1.x, firstPosition1.y -124);
    CABasicAnimation *bounce1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce1.fromValue = [NSNumber numberWithInt:firstPosition1.y];
    bounce1.toValue = [NSNumber numberWithInt:lastPosition1.y];
    bounce1.duration = 2;
    bounce1.autoreverses = TRUE;
    bounce1.repeatCount = HUGE_VALF;
    [ghost1.layer addAnimation: bounce1 forKey:@"position"];
    
    CGPoint firstPosition2 = ghost2.center;
    CGPoint lastPosition2 = CGPointMake(firstPosition2.x, firstPosition2.y -224);
    CABasicAnimation *bounce2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce2.fromValue = [NSNumber numberWithInt:firstPosition2.y];
    bounce2.toValue = [NSNumber numberWithInt:lastPosition2.y];
    bounce2.duration = 2;
    bounce2.autoreverses = TRUE;
    bounce2.repeatCount = HUGE_VALF;
    [ghost2.layer addAnimation: bounce2 forKey:@"position"];
    
    CGPoint firstPosition3 = ghost3.center;
    CGPoint lastPosition3 = CGPointMake(firstPosition3.x, firstPosition3.y + 300);
    CABasicAnimation *bounce3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce3.fromValue = [NSNumber numberWithInt:firstPosition3.y];
    bounce3.toValue = [NSNumber numberWithInt:lastPosition3.y];
    bounce3.duration = 2;
    bounce3.autoreverses = TRUE;
    bounce3.repeatCount = HUGE_VALF;
    [ghost3.layer addAnimation: bounce3 forKey:@"position"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
