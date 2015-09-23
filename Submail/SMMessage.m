//
//  SMMessage.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMMessage.h"

@implementation SMMessage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.appId = SUBMAIL_MESSAGE_APPID;
        self.appKey = SUBMAIL_MESSAGE_APPKEY;
        self.signType = SUBMAIL_MESSAGE_SIGNTYPE;
    }
    return self;
}

- (void)send:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/message/send.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

- (void)xSend:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/message/xsend.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

- (void)subscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/addressbook/message/subscribe.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

- (void)unSubscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSString *api = [NSString stringWithFormat:@"%@/addressbook/message/unsubscribe.json", BASEURLSTRING, nil];
    return [super baseSend:api request:request completion:completion];
}

@end
