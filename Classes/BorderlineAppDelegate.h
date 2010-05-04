//
//  BorderlineAppDelegate.h
//  Borderline
//
//  Created by Steve Baker on 5/3/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BorderlineViewController;

@interface BorderlineAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BorderlineViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BorderlineViewController *viewController;

@end

