//
//  Book.h
//  UserDefaultsSample
//
//  Created by Mokretsov, Oleksandr on 3/20/18.
//  Copyright © 2018 Smart Logic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject <NSCoding>

@property (nonatomic, copy) NSString *bookId;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithId:(NSString *)bookId andName:(NSString *)name;

@end
