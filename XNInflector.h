//
//  Inflector.h
//  XNYandexInflect
//
//  Inflector class. 
//
//  Created by Нат Гаджибалаев on 03.12.09.
//  Copyright 2009 Нат Гаджибалаев. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class XNInflection;

@interface XNInflector : NSObject {
	
}

+ (XNInflector *) sharedInflector;

- (XNInflection *) incflectString: (NSString*) aExpression;

@end
