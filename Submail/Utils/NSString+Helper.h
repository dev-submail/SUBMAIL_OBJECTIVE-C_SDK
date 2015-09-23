//
//  NSString+Helper.h
//  Submail
//
//  Created by zcl on 14/11/24.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

- (NSString *)md5;
- (NSString *)sha1;
- (NSDictionary *)jsonStringToDictionary;

@end
