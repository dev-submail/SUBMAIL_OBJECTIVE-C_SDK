//
//  SMMailXSend.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMMailXSend.h"

@implementation SMMailXSend

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.project = @"";
    }
    return self;
}

- (NSDictionary *)buildRequest {
    NSMutableDictionary *request = [NSMutableDictionary dictionaryWithDictionary:[super buildRequest]];
    if (self.project && ![@"" isEqualToString:self.project]) {
        [request setValue:self.project forKey:@"project"];
    }
    return request;
}

- (void)xSend:(void (^)(BOOL success, id responseObject))completion {
    SMMail *mail = [[SMMail alloc] init];
    [mail xSend:[self buildRequest] completion:completion];
}

@end
