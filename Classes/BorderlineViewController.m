//
//  BorderlineViewController.m
//  Borderline
//
//  Created by Steve Baker on 5/3/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import "BorderlineViewController.h"
#import "DrawingView.h"

@implementation BorderlineViewController

#pragma mark properties
@synthesize drawingView;



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.drawingView = nil;
}


- (void)dealloc {
    [drawingView release], drawingView = nil;
    [super dealloc];
}

-(IBAction)handleCornerRadiusSlider:(UISlider*)sender {
    // [self cornerRadius] = [sender value];
    [self.drawingView setNeedsDisplay];
}


-(IBAction)handleBorderWidthSlider:(UISlider*)sender {
    // [self borderWidth] = [sender value];
    [self.drawingView setNeedsDisplay];
}

@end
