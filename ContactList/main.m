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
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL contineApp = true;
        
        ContactList *contactList = [[ContactList alloc] init];
        Contact *firstContact = [[Contact alloc] init];
        firstContact.fullName = @"Victor";
        firstContact.email = @"victorhong1988@gmail.com";
        
        [contactList addContact:firstContact];
        
        while (contineApp) {
            
            NSLog(@"new - Create a new contact\nlist - List all contacts\nshow(#) - Show contact details\nfind - Find contact\nquit - Exit Application");
            
            InputCollector *input = [[InputCollector alloc] init];
            
            NSString *inputTask = [input inputForPrompt:@"Input a task:"];
            NSString *firstFourChar = [inputTask substringToIndex:5];
            NSString *lastChar = [inputTask substringFromIndex:[inputTask length] - 1];
            
            if ([inputTask isEqualToString:@"quit"]) {
                NSLog(@"Have a great day");
                break;
            } else if ([inputTask isEqualToString:@"new"]) {
                NSString *fullName = [input inputForPrompt:@"Enter full name:"];
                NSString *email = [input inputForPrompt:@"Enter e-mail:"];
                
                Contact *newContact = [[Contact alloc] init];
                newContact.fullName = fullName;
                newContact.email = email;
                
                [contactList addContact:newContact];
                
            } else if ([inputTask isEqualToString:@"list"]) {

                
                for (int i = 0; i < [contactList.contactList count]; i ++) {
                    Contact *person = [contactList.contactList objectAtIndex:i];
                    
                    NSLog(@"person: %@", person.fullName);
                    NSLog(@"email: %@", person.email);
                    
                    NSString *printName = [NSString stringWithFormat:@"%d: %@", i, person.fullName];
                    NSString *printEmail = [NSString stringWithFormat:@"%d: %@", i, person.email];
                    
                    NSLog(@"%@\n%@",printName, printEmail);
                    
                }
                
                NSLog(@"list");
            } else if ([firstFourChar isEqualToString:@"show("]) {
                NSLog(@"show");
            } else if ([inputTask isEqualToString:@"find"]) {
                
            }
            
        }
            
    }
    return 0;
}
