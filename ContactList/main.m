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
#import "History.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL contineApp = true;
        
        ContactList *contactList = [[ContactList alloc] init];
        History *history = [[History alloc] init];
        Contact *firstContact = [[Contact alloc] init];
        firstContact.fullName = @"Victor";
        firstContact.email = @"victorhong1988@gmail.com";
        
        [contactList addContact:firstContact];
        
        while (contineApp) {
            
            NSLog(@"new - Create a new contact\nlist - List all contacts\nshow(#) - Show contact details\nfind - Find contact\nhistory - Show history\nquit - Exit Application");
            
            InputCollector *input = [[InputCollector alloc] init];
            
            NSString *showFilter = [[NSString alloc] init];
            NSString *findFilter = [[NSString alloc] init];
            NSString *lastChar = [[NSString alloc] init];
            
            NSString *inputTask = [input inputForPrompt:@"Input a task:"];
            [history addHistory:inputTask];
            
            if ([inputTask length] > 5) {
                showFilter = [inputTask substringToIndex:5];
            }
            
            if ([inputTask length] > 4) {
                findFilter = [inputTask substringToIndex:4];
            }
            
            if ([inputTask length] > 0) {
                lastChar = [inputTask substringFromIndex:[inputTask length] - 1];
            }
            
            if ([inputTask isEqualToString:@"quit"]) {
                NSLog(@"Have a great day");
                break;
            } else if ([inputTask isEqualToString:@"new"]) {
                BOOL isDuplicate = false;
                NSString *fullName = [input inputForPrompt:@"Enter full name:"];
                for (int i = 0; i < [contactList.contactList count]; i ++) {
                    Contact *person = [contactList.contactList objectAtIndex:i];
                    
                    NSString *printName = [NSString stringWithFormat:@"%@", person.fullName];
                    
                    
                    if ([printName isEqualToString:fullName]) {
                        isDuplicate = true;
                    }
                    
                }
                
                if (isDuplicate) {
                    NSLog(@"This contact is already on the list");
                } else {
                    NSString *email = [input inputForPrompt:@"Enter e-mail:"];
                    
                    Contact *newContact = [[Contact alloc] init];
                    newContact.fullName = fullName;
                    newContact.email = email;
                    
                    [contactList addContact:newContact];
                }
                
            } else if ([inputTask isEqualToString:@"list"]) {

                
                for (int i = 0; i < [contactList.contactList count]; i ++) {
                    Contact *person = [contactList.contactList objectAtIndex:i];
                    
                    NSString *printName = [NSString stringWithFormat:@"%d: %@", i, person.fullName];
                    NSString *printEmail = [NSString stringWithFormat:@"%d: %@", i, person.email];
                    
                    NSLog(@"%@\n%@",printName, printEmail);
                    
                }
                
            } else if (([showFilter isEqualToString:@"show("]) && ([lastChar isEqualToString:@")"])) {
                
                NSString *index = [[inputTask componentsSeparatedByCharactersInSet:
                                        [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                                       componentsJoinedByString:@""];
                if ([index intValue] <= ([contactList.contactList count] +1)) {
                    Contact *person = [contactList.contactList objectAtIndex:[index intValue]];
                    NSString *printName = [NSString stringWithFormat:@"%@: %@", index, person.fullName];
                    NSString *printEmail = [NSString stringWithFormat:@"%@: %@", index, person.email];
                    
                    NSLog(@"%@\n%@",printName, printEmail);
                } else {
                    NSLog(@"Not found");
                }
                NSLog(@"show");
            } else if ([findFilter isEqualToString:@"find"]) {
                int trimSearch = [inputTask length] - 5;
                NSString *search = [inputTask substringFromIndex:[inputTask length] - trimSearch];
                
                for (int i = 0; i < [contactList.contactList count]; i ++) {
                    Contact *person = [contactList.contactList objectAtIndex:i];
                    
                    NSString *printName = [NSString stringWithFormat:@"%@", person.fullName];
                    NSString *printEmail = [NSString stringWithFormat:@"%@", person.email];
                    
                    if ([printName containsString:search]) {
                        NSLog(@"%@\n%@",printName, printEmail);
                    } else {
                        NSLog(@"Can't be found");
                    }
                    
                }
                
            } else if ([inputTask isEqualToString:@"history"]) {
                
                NSString *lastHistory = [history.historyList objectAtIndex:([history.historyList count] - 1)];
                if ([history.historyList count] > 2) {
                    NSString *thirdLastHistory = [history.historyList objectAtIndex:([history.historyList count] - 3)];
                    NSString *secondLastHistory = [history.historyList objectAtIndex:([history.historyList count] - 2)];
                    NSLog(@"Last history: %@\nSecond last history: %@\nThird last history: %@", lastHistory, secondLastHistory, thirdLastHistory);
                } else if ([history.historyList count] > 1) {
                    NSString *secondLastHistory = [history.historyList objectAtIndex:([history.historyList count] - 2)];
                    NSLog(@"Last history: %@\nSecond last history: %@", lastHistory, secondLastHistory);
                } else {
                    NSLog(@"Last history: %@", lastHistory);
                }
            }
            
        }
            
    }
    return 0;
}
