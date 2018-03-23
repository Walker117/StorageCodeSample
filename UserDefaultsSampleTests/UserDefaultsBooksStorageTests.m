//
//  UserDefaultsBooksStorageTests.m
//  UserDefaultsSampleTests
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserDefaultsBooksStorage.h"

@interface UserDefaultsBooksStorage (Testing)

@property (copy, nonatomic) NSString *storageNameSpacePrefix;

- (Book *)decodeToBook:(NSData *)data;
- (NSData *)endcodeBook:(Book *)book;
- (NSString *)bookKeyWithId:(NSString *)bookId;

@end

@interface UserDefaultsBooksStorageTests : XCTestCase

@property(strong, nonatomic) UserDefaultsBooksStorage *storage;

@end

@implementation UserDefaultsBooksStorageTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [self resetDefaults];
    
    self.storage = [[UserDefaultsBooksStorage alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    [self resetDefaults];
    
    [super tearDown];
}

- (void)testSaveAndLoadBooks {
    Book *book = [[Book alloc]initWithId:@"id" andName:@"name"];
    Book *book1 = [[Book alloc]initWithId:@"id1" andName:@"name1"];
    [self.storage saveBook:book];
    [self.storage saveBook:book1];
    
    Book *loadedBook = [self.storage findBookById:book.bookId];
    XCTAssertNotNil(loadedBook, @"Book shouldn't be nil");
    XCTAssertTrue([book.bookId isEqualToString:loadedBook.bookId],@"BookIds should match");
    XCTAssertTrue([book.name isEqualToString:loadedBook.name],@"Book names should match");
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

- (void)testEncodeBook {
    Book *book = [[Book alloc]initWithId:@"id" andName:@"name"];
    NSData *data = [self.storage endcodeBook:book];
    XCTAssertNotNil(data);
}

- (void)testDecodeBook {
    NSData *data = [NSData data];
    Book *decodedBook = [self.storage decodeToBook:data];
    XCTAssertNil(decodedBook);
    
    Book *book = [[Book alloc]initWithId:@"id" andName:@"name"];
    data = [self.storage endcodeBook:book];
    decodedBook = [self.storage decodeToBook:data];
    XCTAssertNotNil(decodedBook);
    XCTAssertTrue([decodedBook isKindOfClass:[Book class]]);
}

- (void)testBookKeyWithId {
    NSString *bookId = @"id";
    NSString *key = [self.storage bookKeyWithId:bookId];
    XCTAssertTrue([key hasSuffix:bookId]);
    NSString *fullStr = [NSString stringWithFormat:@"%@%@", self.storage.storageNameSpacePrefix,bookId];
    XCTAssertTrue([key isEqualToString: fullStr]);
}

#pragma mark - Helpers

- (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    UserDefaultsBooksStorage *storage = [[UserDefaultsBooksStorage alloc]init];
    for (NSString *key in dict) {
        if ([key hasPrefix: storage.storageNameSpacePrefix]){
            [defs removeObjectForKey:key];
        }
    }
    [defs synchronize];
}

@end
