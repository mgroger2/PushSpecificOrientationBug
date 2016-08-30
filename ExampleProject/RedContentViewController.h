//
//  RedContentViewController.h
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"

@interface RedContentViewController : UIViewController

@property (weak, nonatomic) DataService* dataService;
@property (copy, nonatomic) void(^onContentSelected)(NSString* content);

- (void)reload;

@end
