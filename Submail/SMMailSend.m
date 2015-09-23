//
//  SMMailSend.m
//  Submail
//
//  Created by zcl on 14/11/24.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMMailSend.h"

@implementation SMMailSend

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.text = @"";
        self.html = @"";
        self.aryAttachments = [NSMutableArray array];
    }
    return self;
}

- (NSDictionary *)buildRequest {
    NSMutableDictionary *request = [NSMutableDictionary dictionaryWithDictionary:[super buildRequest]];
    if (self.text && ![@"" isEqualToString:self.text]) {
        [request setValue:self.text forKey:@"text"];
    }
    if (self.html && ![@"" isEqualToString:self.html]) {
        [request setValue:self.html forKey:@"html"];
    }
    if (self.aryAttachments.count != 0)
    {
        [request setValue:self.aryAttachments forKey:@"attachments"];
    }
    return request;
}

- (void)addAttachment:(NSString *)attachment {
    if (attachment) {
        [self.aryAttachments addObject:attachment];
    }
}

- (void)send:(void (^)(BOOL success, id responseObject))completion {
    SMMail *mail = [[SMMail alloc] init];
    [mail send:[self buildRequest] completion:completion];
}

@end
