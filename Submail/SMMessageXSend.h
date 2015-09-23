//
//  SMMessageXSend.h
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMMessageXSend : NSObject

@property (nonatomic, strong) NSMutableArray *aryTo;
@property (nonatomic, strong) NSMutableArray *aryAddressBook;
@property (nonatomic, strong) NSString *project;
@property (nonatomic, strong) NSMutableDictionary *dictVar;

- (void)xSend:(void (^)(BOOL success, id responseObject))completion;

@end
