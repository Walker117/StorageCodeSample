//
//  UserDefaultsBooksStorage.m
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import "UserDefaultsBooksStorage.h"

@interface UserDefaultsBooksStorage ()

@property (strong, nonatomic) NSUserDefaults *userDefaults;
@property (copy, nonatomic) NSString *storageNameSpacePrefix;

@end

@implementation UserDefaultsBooksStorage

- (instancetype)init{
    self = [super init];
    
    if (self){
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        self.storageNameSpacePrefix = @"my_books_";
    }
    
    return self;
}

- (void)saveBook:(Book * _Nonnull)newBook {
    NSData *newBookData = [self endcodeBook:newBook];
    [self.userDefaults setObject:newBookData forKey:[self bookKeyWithId:newBook.bookId]];
}

- (NSArray<Book *> * _Nonnull)getAllBooks {
    NSMutableArray *allBooks = [NSMutableArray new];
    
    for (NSString *key in [self allBookKeys]){
        NSData *bookData = [self.userDefaults objectForKey:key];
        Book *book = [self decodeToBook:bookData];
        if (book){
            [allBooks addObject:book];
        }
    }
    
    return  allBooks;
}

- (Book * _Nullable)findBookById:(NSString * _Nonnull)bookId {
    NSData *bookData = [self.userDefaults objectForKey:[self bookKeyWithId:bookId]];
    Book *book = [self decodeToBook:bookData];
    
    return book;
}

- (NSData *)endcodeBook:(Book *)book {
    return  [NSKeyedArchiver archivedDataWithRootObject:book];
}

- (Book *)decodeToBook:(NSData *)data {
    return  [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

- (NSString *)bookKeyWithId:(NSString *)bookId {
    return [NSString stringWithFormat:@"%@%@",self.storageNameSpacePrefix,bookId];
}

- (NSArray<NSString *> *)allBookKeys {
    NSArray *keys = self.userDefaults.dictionaryRepresentation.allKeys;
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", self.storageNameSpacePrefix];
    NSArray* filteredKeys = [keys filteredArrayUsingPredicate:predicate];
    
    return  filteredKeys;
}

@end
