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

/*
 BooksStorageInterface is used as abstracted storage layer where we can swap underlying persistence mechanics when needed. So if we switch from in memory storage to user defaults storage, for our application nothing really changes - it accesses the data the same way as before because we clearly defined interface for that.
 */
@interface BooksStorageInterface : NSObject <BooksStorageProtocol>

- (instancetype _Nonnull)initWithStorageManager:(id<BooksStorageProtocol> _Nonnull)storageManager;

@end
