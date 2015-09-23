//
//  NSDictionary+Helper.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (NSString *)jsonString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    
    if (jsonData) {
        return [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}

@end
