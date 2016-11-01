//
//  main.m
//  ContactList
//
//  Created by Victor Hong on 01/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"new - Create a new contact\nlist - List all contacts\nquit - Exit Application ");
        
        InputCollector *input = [[InputCollector alloc] init];
        
        NSString *inputTask = [input inputForPrompt:@"Input a task:"];
        
        if ([inputTask isEqualToString:@"quit"]) {
            NSLog(@"Have a great day");
        } else if ([inputTask isEqualToString:@"new"]) {
            NSString *fullName = [input inputForPrompt:@"Enter full name:"];
            NSString *email = [input inputForPrompt:@"Enter e-mail:"];
            
            Contact *contact = [[Contact alloc] init];
            contact.fullName = fullName;
            contact.email = email;
            
        } else if ([inputTask isEqualToString:@"list"]) {
            NSLog(@"list");
        }
        
    }
    return 0;
}
