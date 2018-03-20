//
//  BooksStorage.m
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import "BooksStorageInterface.h"

@interface BooksStorageInterface ()

@property (nonatomic, strong) id<BooksStorageProtocol> storage;

@end

@implementation BooksStorageInterface

- (instancetype _Nullable)initWithStorage:(id<BooksStorageProtocol> _Nonnull)storage {
    self = [super init];
    
    if (self){
        self.storage = storage;
    }
    
    return self;
}

- (void)saveBookWithBook:(Book *)newBook{
    [self.storage saveBookWithBook:newBook];
}

- (NSArray<Book *> *)getAllBooks{
    return [self.storage getAllBooks];
}

- (Book * _Nullable)findBookById:(NSString *)bookId{
    return [self.storage findBookById:bookId];
}

@end
