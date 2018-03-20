//
//  BooksStorageInterfaceTests.m
//  UserDefaultsSampleTests
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InMemoryBooksStorage.h"

@interface BooksStorageInterfaceTests : XCTestCase

@end

@implementation BooksStorageInterfaceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInterface {
    InMemoryBooksStorage *storage = [[InMemoryBooksStorage alloc]init];
    Book *book = [[Book alloc]initWithId:@"id" andName:@"name"];
    [storage saveBook:book];
    
    BooksStorageInterface *interface = [[BooksStorageInterface alloc]initWithStorageManager:storage];
    
    Book *loadedBook = [interface findBookById:book.bookId];
    XCTAssertNotNil(loadedBook, @"Book shouldn't be nil");
    XCTAssertTrue([book.bookId isEqualToString:loadedBook.bookId],@"BookIds should match");
    XCTAssertTrue([book.name isEqualToString:loadedBook.name],@"Book names should match");
    
    NSArray *allBooks = [interface getAllBooks];
    XCTAssertEqual(allBooks.count, 1, "Books count doesn't match");
    
    Book *bookToSave = [[Book alloc]initWithId:@"testId" andName:@"testName"];
    [interface saveBook:bookToSave];
    Book *storageBook = [storage findBookById:bookToSave.bookId];
    XCTAssertNotNil(storageBook, "Book should not be nil");
    XCTAssertTrue([bookToSave.bookId isEqualToString:storageBook.bookId],@"BookIds should match");
}

@end
