//
//  SMMailXSend.h
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMBaseMailSend.h"

@interface SMMailXSend : SMBaseMailSend

@property (nonatomic, strong) NSString *project;

- (void)xSend:(void (^)(BOOL success, id responseObject))completion;

@end
