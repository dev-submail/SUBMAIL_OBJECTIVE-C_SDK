//
//  SMBaseMailSend.h
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Helper.h"
#import "SMMail.h"

@interface SMBaseMailSend : NSObject

@property (nonatomic, strong) NSMutableArray *aryTo;
@property (nonatomic, strong) NSMutableArray *aryAddressBook;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *reply;
@property (nonatomic, strong) NSMutableArray *aryCc;
@property (nonatomic, strong) NSMutableArray *aryBcc;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSMutableDictionary *dictVar;
@property (nonatomic, strong) NSMutableDictionary *dictLink;
@property (nonatomic, strong) NSMutableDictionary *dictHeader;

- (void)addTo:(NSString *)address name:(NSString *)name;
- (void)addAddressBook:(NSString *)addressBook;
- (void)setSender:(NSString *)from name:(NSString *)fromName;
- (void)addCc:(NSString *)address name:(NSString *)name;
- (void)addBcc:(NSString *)address name:(NSString *)name;
- (NSDictionary *)buildRequest;

@end
