//
//  SMAddressBookMessage.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMAddressBookMessage.h"
#import "SMMessage.h"

@implementation SMAddressBookMessage

- (void)subscribe:(void (^)(BOOL success, id responseObject))completion {
    SMMessage *message = [[SMMessage alloc] init];
    return [message subscribe:[super buildRequest] completion:completion];
}

- (void)unSubscribe:(void (^)(BOOL success, id responseObject))completion {
    SMMessage *message = [[SMMessage alloc] init];
    return [message unSubscribe:[super buildRequest] completion:completion];
}

@end
