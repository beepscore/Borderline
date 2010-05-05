//
//  DrawingView.h
//  Borderline
//
//  Created by Steve Baker on 5/4/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawingView : UIView {
#pragma mark instance variables
    CGFloat borderWidth;
    CGFloat cornerRadius;
    UIImage *myImage;
}

#pragma mark properties
@property(nonatomic,assign)CGFloat borderWidth;
@property(nonatomic,assign)CGFloat cornerRadius;
@property(nonatomic,retain)UIImage *myImage;

@end
