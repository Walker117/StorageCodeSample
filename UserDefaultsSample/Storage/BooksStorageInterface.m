//
//  BooksStorage.m
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import "BooksStorageInterface.h"
#import "InMemoryBooksStorage.h"

@interface BooksStorageInterface ()

@property (nonatomic, strong) id<BooksStorageProtocol> storageManager;

@end

@implementation BooksStorageInterface

- (instancetype)init {
    self = [super init];
    
    if (self){
        self.storageManager = [[InMemoryBooksStorage alloc]init];
    }
    
    return self;
}

- (instancetype _Nonnull)initWithStorageManager:(id<BooksStorageProtocol> _Nonnull)storageManager {
    self = [super init];
    
    if (self){
        self.storageManager = storageManager;
    }
    
    return self;
}

- (void)saveBook:(Book *)newBook{
    [self.storageManager saveBook:newBook];
}

- (NSArray<Book *> *)getAllBooks{
    return [self.storageManager getAllBooks];
}

- (Book * _Nullable)findBookById:(NSString *)bookId{
    return [self.storageManager findBookById:bookId];
}

@end
