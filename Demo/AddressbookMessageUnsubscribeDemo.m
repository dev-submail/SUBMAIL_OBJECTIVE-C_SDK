//
//  AddressbookMessageUnsubscribeDemo.m
//  SubmailTest
//
//  Created by zcl on 14/12/7.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "AddressbookMessageUnsubscribeDemo.h"

@implementation AddressbookMessageUnsubscribeDemo

+ (void)demo {
    SMAddressBookMessage *addressbook = [[SMAddressBookMessage alloc] init];
    [addressbook setAddress:@"18616761889"];
    [addressbook unSubscribe:^(BOOL success, id responseObject) {
        // your code
    }];
}

@end
