//
//  XNInflection.m
//  XNYandexInflect
//
//  Created by Нат Гаджибалаев on 03.12.09.
//  Copyright 2009 Нат Гаджибалаев. All rights reserved.
//

#import "XNInflection.h"


@implementation XNInflection

@synthesize original, nominative, genitive, dative, accusative, instrumental, prepositional;
@synthesize isFullInflection;

+ (XNInflection *) inflectionWithOriginal: (NSString *) originalString
{
	return [[XNInflection alloc] initWithOriginal: originalString];
}

+ (XNInflection *) inflectionWithArray: (NSArray *) inflectionArray
{
	return [[XNInflection alloc] initWithArray: inflectionArray];
}



- (XNInflection *) initWithOriginal: (NSString *) originalString
{
	self = [super init];
	
	original = [originalString retain];
	
	return self;
}

- (XNInflection *) initWithArray: (NSArray *) inflectionArray
{
	self = [super init];
	
	isFullInflection = NO;
	
	original = [[inflectionArray objectAtIndex: 0] retain];
	
	if( inflectionArray.count > 1 ){
		
		isFullInflection = YES;
		
		nominative		= [[inflectionArray objectAtIndex: 1] retain];
		genitive		= [[inflectionArray objectAtIndex: 2] retain];
		dative			= [[inflectionArray objectAtIndex: 3] retain];
		accusative		= [[inflectionArray objectAtIndex: 4] retain];
		instrumental	= [[inflectionArray objectAtIndex: 5] retain];
		prepositional	= [[inflectionArray objectAtIndex: 6] retain];
	}
	
	return self;
}

- (void) dealloc
{
	[original release];
	
	if( isFullInflection ){
		[nominative release];
		[genitive release];
		[dative release];
		[accusative release];
		[instrumental release];
		[prepositional release];
	}
	
	[super dealloc];
}

@end
