//
//  InMemoryBooksStorageTests.m
//  UserDefaultsSampleTests
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InMemoryBooksStorage.h"

@interface InMemoryBooksStorageTests : XCTestCase

@property(strong, nonatomic) InMemoryBooksStorage *storage;

@end

@implementation InMemoryBooksStorageTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.storage = [[InMemoryBooksStorage alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSaveAndLoadBooks {
    Book *book = [[Book alloc]initWithId:@"id" andName:@"name"];
    Book *book1 = [[Book alloc]initWithId:@"id1" andName:@"name1"];
    [self.storage saveBook:book];
    [self.storage saveBook:book1];
    
    Book *loadedBook = [self.storage findBookById:book.bookId];
    XCTAssertNotNil(loadedBook, @"Book shouldn't be nil");
    XCTAssertTrue([book.bookId isEqualToString: loadedBook.bookId], @"BookId should match");
    XCTAssertTrue([book.name isEqualToString: loadedBook.name], @"Book name should match");
}

- (void)testAllBooks {
    NSArray *allBooks = [self.storage getAllBooks];
    XCTAssertEqual(allBooks.count, 0, "Books storage should be empty");
    
    Book *book = [[Book alloc]initWithId:@"id" andName:@"name"];
    [self.storage saveBook:book];
    allBooks = [self.storage getAllBooks];
    XCTAssertEqual(allBooks.count, 1, "Books count doesn't match");
    
    Book *book1 = [[Book alloc]initWithId:@"id1" andName:@"name1"];
    [self.storage saveBook:book1];
    allBooks = [self.storage getAllBooks];
    XCTAssertEqual(allBooks.count, 2, "Books count doesn't match");
}

@end
