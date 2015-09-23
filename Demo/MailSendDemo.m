//
//  MailSendDemo.m
//  SubmailTest
//
//  Created by zcl on 14/12/7.
//  Copyright (c) 2014年 zcl. All rights reserved.
//

#import "MailSendDemo.h"

@implementation MailSendDemo

+ (void)demo {
    // init MailSend class
    SMMailSend *submail = [[SMMailSend alloc] init];
    
    // add email recipient address and name
    [submail addTo:@"leo@submail.cn" name:@"leo"];
    [submail addCc:@"mailer@submail.cn" name:@"mailer"];
    [submail addBcc:@"leo@drinkfans.com" name:@"leo"];
    
    // set addressbook sign
    [submail addAddressBook:@"subscribe"];
    
    // set email sender address and name
    [submail setSender:@"no-reply@submail.cn" name:@"leo"];
    
    // set email reply address
    submail.reply = @"service@submail.cn";
    
    // Optional
    // set email text content
    submail.text = @"test SDK text";
    
    // set email html content
    submail.html = @"test SDK html";
    
    // set email subject
    submail.subject = @"testSDK";
    
    // email text content filter
    [submail.dictVar setValue:@"leo" forKey:@"name"];
    [submail.dictVar setValue:@"32" forKey:@"age"];
    
    // email link content filter
    [submail.dictLink setValue:@"http://submail.cn/chs/developer" forKey:@"developer"];
    [submail.dictLink setValue:@"http://submail.cn/chs/store" forKey:@"store"];
    
    // email headers
    [submail.dictHeader setValue:@"zh-cn" forKey:@"X-Accept"];
    [submail.dictHeader setValue:@"leo App" forKey:@"X-Mailer"];
    
    // email attachment
    /*[mailSend addAttachment:[[NSBundle mainBundle] pathForResource:@"screenshot" ofType:@"png"]];
     [mailSend addAttachment:[[NSBundle mainBundle] pathForResource:@"setting" ofType:@"png"]];*/
    
    [submail send:^(BOOL success, id responseObject) {
        // your code
    }];
}

@end
