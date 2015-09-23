//
//  MailXSendDemo.m
//  SubmailTest
//
//  Created by zcl on 14/12/7.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "MailXSendDemo.h"

@implementation MailXSendDemo

+ (void)demo {
    SMMailXSend *submail = [[SMMailXSend alloc] init];
    
    [submail addTo:@"leo@submail.cn" name:@"leo"];
    [submail setSender:@"no-reply@submail.cn" name:@"SUBMAIL"];
    submail.project = @"wAWzY4";
    [submail.dictVar setValue:@"leo" forKey:@"name"];
    [submail.dictVar setValue:@"32" forKey:@"age"];
    [submail.dictLink setValue:@"http://submail.cn/chs/developer" forKey:@"developer"];
    [submail.dictLink setValue:@"http://submail.cn/chs/store" forKey:@"store"];
    [submail.dictHeader setValue:@"zh-cn" forKey:@"X-Accept"];
    [submail.dictHeader setValue:@"leo App" forKey:@"X-Mailer"];
    
    [submail xSend:^(BOOL success, id responseObject) {
        // your code
    }];
}

@end
