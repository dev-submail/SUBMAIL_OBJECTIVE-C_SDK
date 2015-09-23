//
//  SMBaseTransfer.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMBaseTransfer.h"

@implementation SMBaseTransfer

- (NSString *)createSignature:(NSMutableDictionary *)request {
    if ([@"normal" isEqualToString:self.signType]) {
        return self.appKey;
    }
    if (self.signType) {
        [request setValue:self.signType forKey:@"sign_type"];
    } else {
        return self.appKey;
    }
    NSString *signStr = @"";
    NSArray *aryKeys = request.allKeys;
    aryKeys = [aryKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 caseInsensitiveCompare:obj2];
    }];
    for (NSString *key in aryKeys) {
        if ([key isEqualToString:@"attachments"]) {
            continue;
        }
        signStr = [signStr stringByAppendingFormat:@"%@=%@&", key, request[key], nil];
    }
    signStr = [signStr substringToIndex:(signStr.length - 1)];
    signStr = [NSString stringWithFormat:@"%@%@%@%@%@", self.appId, self.appKey, signStr, self.appId, self.appKey, nil];
    NSString *sign = @"";
    if ([@"md5" isEqualToString:self.signType]) {
        sign = [signStr md5];
    } else if ([@"sha1" isEqualToString:self.signType]) {
        sign = [signStr sha1];
    }
    return sign;
}

- (void)httpGet:(NSString *)url completion:(void (^)(id responseObject))completion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion([NSDictionary dictionary]);
    }];
}

- (void)httpPost:(NSString *)url postdata:(NSDictionary *)postdata success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    __block NSArray *aryAttachments = postdata[@"attachments"];
    NSMutableDictionary *filteredPostData = [NSMutableDictionary dictionaryWithDictionary:postdata];
    [filteredPostData setValue:nil forKey:@"attachments"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:filteredPostData constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if ([aryAttachments count] == 1) {
            NSURL *url = [NSURL fileURLWithPath:aryAttachments[0] isDirectory:NO];
            [formData appendPartWithFileURL:url name:@"attachments" error:nil];
        } else {
            for (NSString *filePath in aryAttachments) {
                NSURL *url = [NSURL fileURLWithPath:filePath isDirectory:NO];
                [formData appendPartWithFileURL:url name:@"attachments[]" error:nil];
            }
        }
    } success:success failure:failure];
}

- (void)getTimeStamp:(void (^)(NSString *timeStamp))completion {
    NSString *api = [NSString stringWithFormat:@"%@/service/timestamp.json", BASEURLSTRING, nil];
    [self httpGet:api completion:^(id responseObject) {
        NSString *timestamp = nil;
        NSDictionary *htmlAttributes = responseObject;
        if ([[htmlAttributes allKeys] containsObject:@"timestamp"]) {
            timestamp = htmlAttributes[@"timestamp"];
        } else {
            timestamp = @"";
        }
        completion(timestamp);
    }];
}

- (void)baseSend:(NSString *)api request:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:request];
    [dict setValue:self.appId forKey:@"appid"];
    [self getTimeStamp:^(NSString *timeStamp) {
        [dict setValue:timeStamp forKey:@"timestamp"];
        [dict setValue:[self createSignature:dict] forKey:@"signature"];
        [self httpPost:api postdata:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            completion(YES, responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            completion(NO, error);
        }];
    }];
}

- (void)send:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
}

- (void)xSend:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
}

- (void)subscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
}

- (void)unSubscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion {
}

@end
