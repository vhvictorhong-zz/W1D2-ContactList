//
//  ContactList.h
//  ContactList
//
//  Created by Victor Hong on 01/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contactList;

-(instancetype)init;

-(void)addContact:(Contact *)newContact;

@end
