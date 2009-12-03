//
//  Inflector.m
//  XNYandexInflect
//
//  Created by Нат Гаджибалаев on 03.12.09.
//  Copyright 2009 Нат Гаджибалаев. All rights reserved.
//

#import "XNInflector.h"
#import "XNInflection.h"

//
// Singletone 

static XNInflector *sharedInflector = nil;

//
// XNInflector implementation

@implementation XNInflector

#pragma mark -
#pragma mark Singleton Methods

+ (XNInflector *) sharedInflector {
	@synchronized(self) {
		if(sharedInflector == nil){
			[[self alloc] init];
		}
	}
	return sharedInflector;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if(sharedInflector == nil)  {
			sharedInflector = [super allocWithZone:zone];
			return sharedInflector;
		}
	}
	return nil;
}
- (id)copyWithZone:(NSZone *)zone {
	return self;
}
- (id)retain {
	return self;
}
- (unsigned)retainCount {
	return UINT_MAX; //denotes an object that cannot be released
}
- (void)release {
	// never release
}
- (id)autorelease {
	return self;
}

// 
// Inflection method

- (XNInflection *) incflectString: (NSString *) aExpression
{
	// nil error object
	NSError *error = nil;
	
	// request routine
	NSString *encodedUrl = [[NSString stringWithFormat:@"http://export.yandex.ru/inflect.xml?name=%@", aExpression] stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSURL *requestUrl = [NSURL URLWithString: encodedUrl];
	
	// fetching xml
	NSXMLDocument *responseXML = [[NSXMLDocument alloc] initWithContentsOfURL: requestUrl options: NSXMLDocumentTidyHTML error:&error];
	
	// array object with the original expression form. Should always be ok. 
	NSArray *originalNode = [[responseXML rootElement] nodesForXPath:@"//original" error:&error ];

    if (error)
    {
		[NSException raise: @"Yandex.Inflect exception." format:  @"Yandex.Inflect coudn't inflect expression «%@». The error message was: %@", aExpression, error];
    }
	
	// create an output array and insert original form. 
	NSMutableArray *stringInflections = [NSMutableArray arrayWithCapacity: 7];
	[stringInflections addObject:[[originalNode objectAtIndex:0] stringValue]];
	
	// parse XML for inflected forms
	NSArray *inflectionNodes = [[responseXML rootElement] nodesForXPath:@"//inflection" error:&error ];

	if( inflectionNodes.count > 0 ){
		for( NSXMLNode *node in inflectionNodes ){
			[stringInflections addObject:[node stringValue]];
		}
	}
	
	return [XNInflection inflectionWithArray: [stringInflections copy]];
	
}

@end
