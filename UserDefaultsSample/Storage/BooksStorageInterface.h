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

- (void)saveBook:(Book * _Nonnull)newBook;
- (NSArray<Book *> * _Nonnull)getAllBooks;
- (Book * _Nullable)findBookById:(NSString *_Nonnull)bookId;

@end

@interface BooksStorageInterface : NSObject <BooksStorageProtocol>

- (instancetype _Nullable)initWithStorageManager:(id<BooksStorageProtocol> _Nonnull)storageManager;

@end
