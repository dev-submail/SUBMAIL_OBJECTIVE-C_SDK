//
//  SMBaseAddressBook.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMBaseAddressBook.h"

@implementation SMBaseAddressBook

- (void)setAddress:(NSString *)address name:(NSString *)name {
    if (![@"" isEqualToString: address]) {
        self.address = [NSString stringWithFormat:@"%@<%@>", name, address, nil];
    }
}

- (void)setAddressBook:(NSString *)target {
    self.target = target;
}

- (NSDictionary *)buildRequest {
    NSMutableDictionary *request = [NSMutableDictionary dictionary];
    if (self.address && ![@"" isEqualToString:self.address]) {
        [request setValue:self.address forKey:@"address"];
    }
    if (self.target && ![@"" isEqualToString:self.target]) {
        [request setValue:self.target forKey:@"target"];
    }
    return request;
}

- (void)subscribe:(void (^)(BOOL success, id responseObject))completion {
    
}

- (void)unSubscribe:(void (^)(BOOL success, id responseObject))completion {
    
}

@end
