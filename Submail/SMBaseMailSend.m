//
//  SMBaseMailSend.m
//  Submail
//
//  Created by zcl on 14/11/25.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "SMBaseMailSend.h"

@implementation SMBaseMailSend

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.aryTo = [NSMutableArray array];
        self.aryAddressBook = [NSMutableArray array];
        self.from = @"";
        self.fromName = @"";
        self.reply = @"";
        self.aryCc = [NSMutableArray array];
        self.aryBcc = [NSMutableArray array];
        self.subject = @"";
        self.dictVar = [NSMutableDictionary dictionary];
        self.dictLink = [NSMutableDictionary dictionary];
        self.dictHeader = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addTo:(NSString *)address name:(NSString *)name {
    if (address && name) {
        [self.aryTo addObject:@{@"address": address, @"name": name}];
    }
}

- (void)addAddressBook:(NSString *)addressBook {
    if (addressBook) {
        [self.aryAddressBook addObject:addressBook];
    }
}

- (void)setSender:(NSString *)from name:(NSString *)fromName {
    self.from = from;
    self.fromName = fromName;
}

- (void)addCc:(NSString *)address name:(NSString *)name {
    if (address && name) {
        [self.aryCc addObject:@{@"address": address, @"name": name}];
    }
}

- (void)addBcc:(NSString *)address name:(NSString *)name {
    if (address && name) {
        [self.aryBcc addObject:@{@"address": address, @"name": name}];
    }
}

- (NSDictionary *)buildRequest {
    NSMutableDictionary *request = [NSMutableDictionary dictionary];
    if (self.aryTo.count != 0)
    {
        [request setValue:@"" forKey:@"to"];
        for (NSDictionary *to in self.aryTo) {
            [request setValue:[request[@"to"] stringByAppendingFormat:@"%@<%@>,", to[@"name"], to[@"address"], nil] forKey:@"to"];
        }
        NSString *toStr = request[@"to"];
        [request setValue:[toStr substringToIndex:(toStr.length - 1)] forKey:@"to"];
    }
    if (self.aryAddressBook.count != 0)
    {
        [request setValue:@"" forKey:@"addressbook"];
        for (NSString *key in self.aryAddressBook) {
            [request setValue:[request[@"addressbook"] stringByAppendingFormat:@"%@,", key, nil] forKey:@"addressbook"];
        }
        NSString *keyStr = request[@"addressbook"];
        [request setValue:[keyStr substringToIndex:(keyStr.length - 1)] forKey:@"addressbook"];
    }
    if (self.from && ![@"" isEqualToString:self.from]) {
        [request setValue:self.from forKey:@"from"];
    }
    if (self.fromName && ![@"" isEqualToString:self.fromName]) {
        [request setValue:self.fromName forKey:@"from_name"];
    }
    if (self.reply && ![@"" isEqualToString:self.reply]) {
        [request setValue:self.reply forKey:@"reply"];
    }
    if (self.aryCc.count != 0) {
        [request setValue:@"" forKey:@"cc"];
        for (NSDictionary *cc in self.aryCc) {
            [request setValue:[request[@"cc"] stringByAppendingFormat:@"%@<%@>,", cc[@"name"], cc[@"address"], nil] forKey:@"cc"];
        }
        NSString *ccStr = request[@"cc"];
        [request setValue:[ccStr substringToIndex:(ccStr.length - 1)] forKey:@"cc"];
    }
    if (self.aryBcc.count != 0) {
        [request setValue:@"" forKey:@"bcc"];
        for (NSDictionary *bcc in self.aryBcc) {
            [request setValue:[request[@"bcc"] stringByAppendingFormat:@"%@<%@>,", bcc[@"name"], bcc[@"address"], nil] forKey:@"bcc"];
        }
        NSString *bccStr = request[@"bcc"];
        [request setValue:[bccStr substringToIndex:(bccStr.length - 1)] forKey:@"bcc"];
    }
    if (self.subject && ![@"" isEqualToString:self.subject]) {
        [request setValue:self.subject forKey:@"subject"];
    }
    if (self.dictVar.count != 0) {
        NSString *jsonStr = [self.dictVar jsonString];
        if (jsonStr) {
            [request setValue:jsonStr forKey:@"vars"];
        }
    }
    if (self.dictLink.count != 0) {
        NSString *jsonStr = [self.dictLink jsonString];
        if (jsonStr) {
            [request setValue:jsonStr forKey:@"links"];
        }
    }
    if (self.dictHeader.count != 0) {
        NSString *jsonStr = [self.dictHeader jsonString];
        if (jsonStr) {
            [request setValue:jsonStr forKey:@"headers"];
        }
    }
    return request;
}

@end
