//
//  RedContentViewController.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "RedContentViewController.h"

@interface RedContentViewController ()

@property (weak, nonatomic) IBOutlet UIButton* turtleOne;
@property (weak, nonatomic) IBOutlet UIButton* turtleTwo;
@property (weak, nonatomic) IBOutlet UIButton* turtleThree;
@property (weak, nonatomic) IBOutlet UIButton* turtleFour;
@property (strong, nonatomic) NSDictionary* turtleKeyValuePairs;

@end

@implementation RedContentViewController

#pragma mark - UIViewController

- (BOOL)shouldAutorotate
{
	return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationLandscapeLeft;
	
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self setupTheFourNinjaTurtles];
}

#pragma mark - Public

- (void)reload
{
	
}

#pragma mark - Private

- (void)setupTheFourNinjaTurtles
{
	self.turtleKeyValuePairs = [self.dataService getKeyValuePairs];
	NSArray* firstNames = [self.dataService getFirstNames];
	[self.turtleOne setTitle:firstNames[0] forState:UIControlStateNormal];
	[self.turtleTwo setTitle:firstNames[1] forState:UIControlStateNormal];
	[self.turtleThree setTitle:firstNames[2] forState:UIControlStateNormal];
	[self.turtleFour setTitle:firstNames[3] forState:UIControlStateNormal];
}

- (IBAction)buttonPressed:(UIButton*)sender
{
	NSString* fullName = self.turtleKeyValuePairs[sender.titleLabel.text];
	if (self.onContentSelected) {
		self.onContentSelected(fullName);
	}
}

@end
