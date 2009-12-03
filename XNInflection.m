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
	
	original = [inflectionArray objectAtIndex: 0];
	
	nominative		= [inflectionArray objectAtIndex: 1];
	genitive		= [inflectionArray objectAtIndex: 2];
	dative			= [inflectionArray objectAtIndex: 3];
	accusative		= [inflectionArray objectAtIndex: 4];
	instrumental	= [inflectionArray objectAtIndex: 5];
	prepositional	= [inflectionArray objectAtIndex: 6];
	
	return self;
}

@end
