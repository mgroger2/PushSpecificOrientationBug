//
//  ContainerViewController.h
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"

extern const struct ContainerViewControllerMode {
	__unsafe_unretained NSString *red;
	__unsafe_unretained NSString *green;
} ContainerViewControllerMode;

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel* leftTitleLable;
@property (weak, nonatomic) IBOutlet UILabel* rightTitleLable;
@property (weak, nonatomic) IBOutlet UIView* containerView;
@property (weak, nonatomic) UIDevice* currentDevice;
@property (strong, nonatomic) DataService* dataService;
@property (copy, nonatomic) NSString* mode;
@property (copy, nonatomic) void(^onModeChanged)(NSString* mode);
@property (copy, nonatomic) void(^onContentSelected)(NSString* content);

- (void)showMode:(NSString*)mode;

@end
