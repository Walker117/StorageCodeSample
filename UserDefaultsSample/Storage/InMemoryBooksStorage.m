//
//  InMemoryBooksStorage.m
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import "InMemoryBooksStorage.h"

@interface InMemoryBooksStorage ()

@property (nonatomic, strong) NSMutableDictionary<NSString *,Book *> *booksDict;

@end

@implementation InMemoryBooksStorage

- (instancetype)init{
    self = [super init];
    
    if (self){
        self.booksDict = [NSMutableDictionary new];
    }
    
    return self;
}

- (void)saveBookWithBook:(Book *)newBook{
    self.booksDict[newBook.bookId] = newBook;
}

- (NSArray<Book *> *)getAllBooks{
    return self.booksDict.allValues;
}

- (Book * _Nullable)findBookById:(NSString *)bookId{
    return self.booksDict[bookId];
}

@end
