//
//  SMAddressBookMail.m
//  Submail
//
//  Created by zcl on 14/11/24.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMAddressBookMail.h"
#import "SMMail.h"

@implementation SMAddressBookMail

- (void)subscribe:(void (^)(BOOL success, id responseObject))completion {
    SMMail *mail = [[SMMail alloc] init];
    return [mail subscribe:[super buildRequest] completion:completion];
}

- (void)unSubscribe:(void (^)(BOOL success, id responseObject))completion {
    SMMail *mail = [[SMMail alloc] init];
    return [mail unSubscribe:[super buildRequest] completion:completion];
}

@end
