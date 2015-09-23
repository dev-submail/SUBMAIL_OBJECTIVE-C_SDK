//
//  AddressbookMailUnsubscribeDemo.m
//  SubmailTest
//
//  Created by zcl on 14/12/7.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "AddressbookMailUnsubscribeDemo.h"

@implementation AddressbookMailUnsubscribeDemo

+ (void)demo {
    SMAddressBookMail *addressbook = [[SMAddressBookMail alloc] init];
    [addressbook setAddress:@"leo@apple.cn" name:@"leo"];
    [addressbook unSubscribe:^(BOOL success, id responseObject) {
        // your code
    }];
}

@end
