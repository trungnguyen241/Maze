//
//  ViewController.h
//  Maze
//
//  Created by Alex on 4/25/15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAAnimation.h>

@interface ViewController : UIViewController {
    
//    @private
//        @private
//    IBOutlet UIView *pacman;
//    IBOutlet UIView *ghost1;
//    IBOutlet UIView *ghost2;
//    IBOutlet UIView *ghost3;
//    IBOutletCollection(UIView) NSArray *wall;
    IBOutlet UIView *pacman;
    
    IBOutlet UIView *ghost1;
    IBOutlet UIView *ghost2;
    IBOutlet UIView *ghost3;
    
    IBOutletCollection(UIView) NSArray *wall;
}

//@property (strong, nonatomic) IBOutlet UIView *pacman;
//
//@property (strong, nonatomic) IBOutlet UIView *ghost1;
//@property (strong, nonatomic) IBOutlet UIView *ghost2;
//@property (strong, nonatomic) IBOutlet UIView *ghost3;
//
//@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *wall;

@end

