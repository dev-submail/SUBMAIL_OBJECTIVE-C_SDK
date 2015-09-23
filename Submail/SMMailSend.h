//
//  SMMailSend.h
//  Submail
//
//  Created by zcl on 14/11/24.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMBaseMailSend.h"

@interface SMMailSend : SMBaseMailSend

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSMutableArray *aryAttachments;

- (void)addAttachment:(NSString *)attachment;
- (void)send:(void (^)(BOOL success, id responseObject))completion;

@end
