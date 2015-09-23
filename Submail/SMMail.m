//
//  SMMail.m
//  Submail
//
//  Created by zcl on 14/11/24.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMMail.h"

@implementation SMMail

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.appId = SUBMAIL_MAIL_APPID;
        self.appKey = SUBMAIL_MAIL_APPKEY;
        self.signType = SUBMAIL_MAIL_SIGNTYPE;
    }
    return self;
}

- (void)send:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/mail/send.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

- (void)xSend:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/mail/xsend.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

- (void)subscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/addressbook/mail/subscribe.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

- (void)unSubscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/addressbook/mail/unsubscribe.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

@end
