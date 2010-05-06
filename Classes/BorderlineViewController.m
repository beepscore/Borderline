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
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* myPath = [[NSBundle mainBundle] pathForResource:@"sun" ofType:@"jpg"];
    self.drawingView.myImage = [UIImage imageWithContentsOfFile:myPath];

    self.drawingView.borderWidth = 10.0;
    self.drawingView.cornerRadius = 50.0;
        
    [self.drawingView setNeedsDisplay];
}


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

    self.drawingView.cornerRadius = [sender value];
    [self.drawingView setNeedsDisplay];
}


-(IBAction)handleBorderWidthSlider:(UISlider*)sender {    

    // need outlet to drawingView to access its properties (e.g. borderWidth)
    self.drawingView.borderWidth = [sender value];
    [self.drawingView setNeedsDisplay];
}

@end
