//
//  XNInflectorTest.m
//  XNYandexInflect
//
//  Created by Нат Гаджибалаев on 03.12.09.
//  Copyright 2009 Нат Гаджибалаев. All rights reserved.
//

#import "XNInflectorTest.h"


@implementation XNInflectorTest

- (void) testInflects {
	XNInflector *inflector = [XNInflector sharedInflector];
	
	NSString *originalString = [[inflector incflectString:@"Нат"] prepositional];
	
	STAssertEqualObjects( @"Нате", originalString, @"Inflection failed to return the prepositional expression. Returned %@ for expression «Нат»", originalString);
}

@end
