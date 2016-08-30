//
//  DetailsViewController.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (strong, nonatomic) IBOutlet UILabel* contentLabel;
@property (strong, nonatomic) NSString* content;

@end

@implementation DetailsViewController

#pragma mark - NSObject

- (instancetype)initWithContent:(NSString*)content
{
	if (self = [super init]) {
		_content = content;
	}
	return self;
}

#pragma mark - UIViewController

- (BOOL)shouldAutorotate
{
	return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationPortrait;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.contentLabel.text = self.content;
}

@end
