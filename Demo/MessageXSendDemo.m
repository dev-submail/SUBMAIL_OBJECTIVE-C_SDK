//
//  MessageXSendDemo.m
//  SubmailTest
//
//  Created by zcl on 14/12/7.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "MessageXSendDemo.h"

@implementation MessageXSendDemo

+ (void)demo {
    SMMessageXSend * submail = [[SMMessageXSend alloc] init];
    
    [submail.aryTo addObject:@"18616761881"];
    submail.project = @"kZ9Ky3";
    [submail.dictVar setValue:@"198276" forKey:@"code"];
    
    [submail xSend:^(BOOL success, id responseObject) {
        // your code
    }];
}

@end
