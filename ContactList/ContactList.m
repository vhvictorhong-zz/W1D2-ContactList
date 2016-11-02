//
//  ContactList.m
//  ContactList
//
//  Created by Victor Hong on 01/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

-(instancetype)init {
    if (self = [super init]) {
        _contactList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact {
    
    [self.contactList addObject:newContact];
    
}

@end
