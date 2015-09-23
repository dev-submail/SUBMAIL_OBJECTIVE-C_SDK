//
//  SMMessageXSend.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMMessageXSend.h"
#import "NSDictionary+Helper.h"
#import "SMMessage.h"

@implementation SMMessageXSend

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.aryTo = [NSMutableArray array];
        self.aryAddressBook = [NSMutableArray array];
        self.project = @"";
        self.dictVar = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSDictionary *)buildRequest {
    NSMutableDictionary *request = [NSMutableDictionary dictionary];
    
    if (self.aryTo.count != 0)
    {
        [request setValue:@"" forKey:@"to"];
        for (NSString *to in self.aryTo) {
            [request setValue:[request[@"to"] stringByAppendingFormat:@"%@,", to, nil] forKey:@"to"];
        }
        NSString *toStr = request[@"to"];
        [request setValue:[toStr substringToIndex:(toStr.length - 1)] forKey:@"to"];
    }
    if (self.aryAddressBook.count != 0)
    {
        [request setValue:@"" forKey:@"addressbook"];
        for (NSString *key in self.aryAddressBook) {
            [request setValue:[request[@"addressbook"] stringByAppendingFormat:@"%@,", key, nil] forKey:@"addressbook"];
        }
        NSString *keyStr = request[@"addressbook"];
        [request setValue:[keyStr substringToIndex:(keyStr.length - 1)] forKey:@"addressbook"];
    }
    if (self.project && ![@"" isEqualToString:self.project]) {
        [request setValue:self.project forKey:@"project"];
    }
    if (self.dictVar.count != 0) {
        NSString *jsonStr = [self.dictVar jsonString];
        if (jsonStr) {
            [request setValue:jsonStr forKey:@"vars"];
        }
    }
    return request;
}

- (void)xSend:(void (^)(BOOL success, id responseObject))completion {
    SMMessage *message = [[SMMessage alloc] init];
    [message xSend:[self buildRequest] completion:completion];
}

@end
