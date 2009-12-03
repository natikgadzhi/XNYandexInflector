//
//  XNInflection.h
//  XNYandexInflect
//
//  Created by Нат Гаджибалаев on 03.12.09.
//  Copyright 2009 Нат Гаджибалаев. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface XNInflection : NSObject {
	NSString *original, *nominative, *genitive, *dative, *accusative, *instrumental, *prepositional;
}

@property(readonly) NSString *original, *nominative, *genitive, *dative, *accusative, *instrumental, *prepositional;

+ (XNInflection *) inflectionWithOriginal: (NSString *) originalString; 
+ (XNInflection *) inflectionWithArray: (NSArray *) inflectionArray;

- (XNInflection *) initWithOriginal: (NSString *) originalString;
- (XNInflection *) initWithArray: (NSArray *) inflectionArray;

@end
