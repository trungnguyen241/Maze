//
//  ViewController.h
//  Maze
//
//  Created by Alex on 4/25/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAAnimation.h>
#import <CoreMotion/CoreMotion.h>

#define updateInterval (1.0f / 60.0f)

@interface ViewController : UIViewController
    
@property (strong, nonatomic) IBOutlet UIView *pacman;
@property (strong, nonatomic) IBOutlet UIView *ghost1;
@property (strong, nonatomic) IBOutlet UIView *ghost2;
@property (strong, nonatomic) IBOutlet UIView *ghost3;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *wall;

@property (assign, nonatomic) CGPoint currentPoint;
@property (assign, nonatomic) CGPoint prevPoint;
@property (assign, nonatomic) CGFloat pacmanVelocityX;
@property (assign, nonatomic) CGFloat pacmanVelocityY;
@property (assign, nonatomic) CGFloat angle;
@property (assign, nonatomic) CMAcceleration acceleration;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSDate *lastUpdateTime;


- (void) initAccelerometer;
- (void) updatePacmanData;
- (void) movePacman;
- (void) rotatePacman;

@end

