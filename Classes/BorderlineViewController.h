//
//  BorderlineViewController.h
//  Borderline
//
//  Created by Steve Baker on 5/3/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DrawingView;

@interface BorderlineViewController : UIViewController {
#pragma mark instance variables
    DrawingView *drawingView;
}
#pragma mark properties
@property(nonatomic,retain)DrawingView *drawingView;


-(IBAction)handleCornerRadiusSlider:(UISlider*)sender; 

-(IBAction)handleBorderWidthSlider:(UISlider*)sender; 

@end

