//
//  main.m
//  ContactList
//
//  Created by Victor Hong on 01/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"new - Create a new contact\nlist - List all contacts\nquit - Exit Application ");
        
        InputCollector *input = [[InputCollector alloc] init];
        
        NSString *print = [input inputForPrompt:@"Input a task"];
        
        NSLog(@"%@", print);
        
    }
    return 0;
}
