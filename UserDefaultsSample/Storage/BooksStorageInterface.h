//
//  BooksStorage.h
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@protocol BooksStorageProtocol

- (void)saveBookWithBook:(Book * _Nonnull)newBook;
- (NSArray<Book *> * _Nonnull)getAllBooks;
- (Book * _Nullable)findBookById:(NSString *_Nonnull)bookId;

@end

@interface BooksStorageInterface : NSObject <BooksStorageProtocol>

- (instancetype _Nullable)initWithStorage:(id<BooksStorageProtocol> _Nonnull)storage;

@end
