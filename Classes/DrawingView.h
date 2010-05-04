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
    NSNumber *borderWidth;

}
#pragma mark properties
@property(nonatomic,retain)NSNumber *borderWidth;

@end
