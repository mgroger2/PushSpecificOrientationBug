//
//  UIApplication+Orientation.h
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Orientation)

- (UIDeviceOrientation)deviceOrientationFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (UIInterfaceOrientation)interfaceOrientationFromDeviceOrientation:(UIDeviceOrientation)deviceOrientation;
- (BOOL)interfaceMask:(UIInterfaceOrientationMask)mask containsInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
