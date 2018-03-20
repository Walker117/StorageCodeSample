//
//  Book.m
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import "Book.h"

static NSString *kBookIdKey = @"bookId";
static NSString *kNameKey = @"name";

@implementation Book

- (instancetype)initWithId:(NSString *)bookId andName:(NSString *)name{
    self = [super init];
    
    if (self){
        self.bookId = bookId;
        self.name = name;
    }
    
    return self;
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    NSString *bookId = [aDecoder decodeObjectForKey:kBookIdKey];
    NSString *name = [aDecoder decodeObjectForKey:kNameKey];
    
    return [[Book alloc] initWithId:bookId andName:name];
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.bookId forKey:kBookIdKey];
    [aCoder encodeObject:self.name forKey:kNameKey];
}

@end
