//
//  AddressbookMessageSubscribeDemo.m
//  SubmailTest
//
//  Created by zcl on 14/12/7.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "AddressbookMessageSubscribeDemo.h"

@implementation AddressbookMessageSubscribeDemo

+ (void)demo {
    SMAddressBookMessage *addressbook = [[SMAddressBookMessage alloc] init];
    [addressbook setAddress:@"18616761889"];
    [addressbook subscribe:^(BOOL success, id responseObject) {
        // your code
    }];
}

@end
