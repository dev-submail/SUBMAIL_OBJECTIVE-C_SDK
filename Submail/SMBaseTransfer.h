//
//  SMBaseTransfer.h
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMConfig.h"
#import "NSString+Helper.h"
#import <AFNetworking/AFNetworking.h>

@interface SMBaseTransfer : NSObject

@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *appKey;
@property (nonatomic, strong) NSString *signType;

- (void)getTimeStamp:(void (^)(NSString *timeStamp))completion;
- (void)baseSend:(NSString *)api request:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion;
- (void)send:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion;
- (void)xSend:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion;
- (void)subscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion;
- (void)unSubscribe:(NSDictionary *)request completion:(void (^)(BOOL success, id responseObject))completion;

@end
