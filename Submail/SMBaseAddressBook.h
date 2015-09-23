//
//  SMBaseAddressBook.h
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMBaseAddressBook : NSObject

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *target;

- (void)setAddress:(NSString *)address name:(NSString *)name;
- (void)setAddressBook:(NSString *)target;
- (NSDictionary *)buildRequest;
- (void)subscribe:(void (^)(BOOL success, id responseObject))completion;
- (void)unSubscribe:(void (^)(BOOL success, id responseObject))completion;

@end
