//
//  DataService.h
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject

- (NSArray*)getFirstNames;
- (NSArray*)getFullNames;
- (NSDictionary*)getKeyValuePairs;

@end
