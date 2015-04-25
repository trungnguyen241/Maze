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
    
    CGPoint curPosition1 = self.ghost1.center;
    CGPoint nextPosition1 = CGPointMake(curPosition1.x, curPosition1.y -124);
    CABasicAnimation *bounce1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce1.fromValue = [NSNumber numberWithInt:curPosition1.y];
    bounce1.toValue = [NSNumber numberWithInt:nextPosition1.y];
    bounce1.duration = 2;
    bounce1.autoreverses = TRUE;
    bounce1.repeatCount = HUGE_VALF;
    [self.ghost1.layer addAnimation: bounce1 forKey:@"position"];
    
    CGPoint curPosition2 = self.ghost2.center;
    CGPoint nextPosition2 = CGPointMake(curPosition2.x, curPosition2.y -224);
    CABasicAnimation *bounce2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce2.fromValue = [NSNumber numberWithInt:curPosition2.y];
    bounce2.toValue = [NSNumber numberWithInt:nextPosition2.y];
    bounce2.duration = 2;
    bounce2.autoreverses = TRUE;
    bounce2.repeatCount = HUGE_VALF;
    [self.ghost2.layer addAnimation: bounce2 forKey:@"position"];
    
    CGPoint curPosition3 = self.ghost3.center;
    CGPoint nextPosition3 = CGPointMake(curPosition3.x, curPosition3.y + 300);
    CABasicAnimation *bounce3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce3.fromValue = [NSNumber numberWithInt:curPosition3.y];
    bounce3.toValue = [NSNumber numberWithInt:nextPosition3.y];
    bounce3.duration = 2;
    bounce3.autoreverses = TRUE;
    bounce3.repeatCount = HUGE_VALF;
    [self.ghost3.layer addAnimation: bounce3 forKey:@"position"];
    
    [self initAccelerometer];
}

- (void)initAccelerometer
{
    self.lastUpdateTime = [[NSDate alloc] init];
    self.currentPoint = CGPointMake(0, 144);
    self.motionManager = [[CMMotionManager alloc] init];
    self.queue = [[NSOperationQueue alloc] init];
    self.motionManager.accelerometerUpdateInterval = updateInterval;
    
    [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error) {
         [(id) self setAcceleration:accelerometerData.acceleration];
         [self performSelectorOnMainThread:@selector(updatePacmanData) withObject:nil waitUntilDone:NO];
     }];
    
    NSLog(@"x: %f  y: %f", self.acceleration.x, self.acceleration.y);
}

- (void)updatePacmanData
{
    NSTimeInterval timeSinceLastUpdate = [self.lastUpdateTime timeIntervalSinceNow];
    
    self.pacmanVelocityX += self.acceleration.x * timeSinceLastUpdate;
    self.pacmanVelocityY += self.acceleration.y * timeSinceLastUpdate;
    
    CGFloat xDelta = self.pacmanVelocityX * timeSinceLastUpdate * 500;
    CGFloat yDelta = self.pacmanVelocityY * timeSinceLastUpdate * 500;
    
    self.currentPoint = CGPointMake(self.currentPoint.x + xDelta,
                                    self.currentPoint.y + yDelta);
    self.lastUpdateTime = [NSDate date];
    
    [self movePacman];
    [self rotatePacman];
    
}

- (void) movePacman
{
    self.prevPoint = self.currentPoint;
    
    CGRect updateFrame = self.pacman.frame;
    updateFrame.origin.x = self.currentPoint.x;
    updateFrame.origin.y = self.currentPoint.y;
    
    self.pacman.frame = updateFrame;
}

- (void) rotatePacman
{
    CGFloat newAngle = (self.pacmanVelocityX + self.pacmanVelocityY) * M_PI * 4;
    self.angle += newAngle * updateInterval;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = [NSNumber numberWithFloat:0.0];
    rotate.toValue = [NSNumber numberWithFloat:self.angle];
    rotate.duration = updateInterval;
    rotate.repeatCount = 1;
    rotate.removedOnCompletion = NO;
    //leave graphic in its final state upon completion
    rotate.fillMode = kCAFillModeForwards;
    
    [self.pacman.layer addAnimation:rotate forKey:@"10"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
