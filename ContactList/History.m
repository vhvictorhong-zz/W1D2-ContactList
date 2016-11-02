//
//  History.m
//  ContactList
//
//  Created by Victor Hong on 01/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "History.h"

@implementation History

-(instancetype)init {
    if (self = [super init]) {
        _historyList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addHistory:(NSString *)history {
    [self.historyList addObject:history];
}

@end
