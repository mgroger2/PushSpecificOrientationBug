//
//  DataService.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "DataService.h"

@interface DataService ()

@property (strong, nonatomic) NSArray* firstNames;
@property (strong, nonatomic) NSArray* fullNames;

@end

@implementation DataService

- (instancetype)init
{
	if (self = [super init]) {
		[self setupInitialData];
	}
	return self;
}

#pragma mark - Public

- (NSArray*)getFirstNames
{
	return [self.firstNames copy];
}

- (NSArray*)getFullNames
{
	return [self.fullNames copy];
}

- (NSDictionary*)getKeyValuePairs
{
	NSArray* keys = [self getFirstNames];
	NSArray* values = [self getFullNames];
	NSDictionary* pairs = [NSDictionary dictionaryWithObjects:values forKeys:keys];
	return [pairs copy];
}

#pragma mark - Private

- (void)setupInitialData
{
	self.fullNames = @[
		@"Leonardo di ser Piero da Vinci",
		@"Donatello di Niccolò di Betto Bardi",
		@"Michelangelo di Lodovico Buonarroti Simoni",
		@"Raffaello Sanzio da Urbino"
	];
	self.firstNames = @[
		@"Leonardo",
		@"Donatello",
		@"Michelangelo",
		@"Raphael"
	];
}

@end
