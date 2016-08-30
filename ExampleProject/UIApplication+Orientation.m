//
//  UIApplication+Orientation.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "UIApplication+Orientation.h"

@implementation UIApplication (Orientation)

- (UIDeviceOrientation)deviceOrientationFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	switch (interfaceOrientation) {
		case UIInterfaceOrientationPortrait:
			return UIDeviceOrientationPortrait;
		case UIInterfaceOrientationLandscapeLeft:
			return UIDeviceOrientationLandscapeRight;
		case UIInterfaceOrientationLandscapeRight:
			return UIDeviceOrientationLandscapeLeft;
		case UIInterfaceOrientationPortraitUpsideDown:
			return UIDeviceOrientationPortraitUpsideDown;
		case UIInterfaceOrientationUnknown:
			return UIDeviceOrientationPortrait;
	}
}

- (UIInterfaceOrientation)interfaceOrientationFromDeviceOrientation:(UIDeviceOrientation)deviceOrientation
{
	switch (deviceOrientation) {
		case UIDeviceOrientationPortrait:
			return UIInterfaceOrientationPortrait;
		case UIDeviceOrientationLandscapeLeft:
			return UIInterfaceOrientationLandscapeRight;
		case UIDeviceOrientationLandscapeRight:
			return UIInterfaceOrientationLandscapeLeft;
		case UIDeviceOrientationPortraitUpsideDown:
			return UIInterfaceOrientationPortraitUpsideDown;
		case UIDeviceOrientationFaceUp:
			return UIInterfaceOrientationUnknown;
		case UIDeviceOrientationFaceDown:
			return UIInterfaceOrientationUnknown;
		case UIDeviceOrientationUnknown:
			return UIInterfaceOrientationUnknown;
	}
}

- (BOOL)interfaceMask:(UIInterfaceOrientationMask)mask containsInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	switch (mask) {
		case UIInterfaceOrientationMaskAll:
			return YES;
		case UIInterfaceOrientationMaskPortrait:
			return interfaceOrientation == UIInterfaceOrientationPortrait;
		case UIInterfaceOrientationMaskLandscapeLeft:
			return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
		case UIInterfaceOrientationMaskLandscapeRight:
			return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
		case UIInterfaceOrientationMaskPortraitUpsideDown:
			return interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown;
		case UIInterfaceOrientationMaskLandscape:
			return interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight;
		case UIInterfaceOrientationMaskAllButUpsideDown:
			return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
}

@end
