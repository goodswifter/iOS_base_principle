//
//  MJPerson+Test.m
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson+Test.h"

#define MJKey [NSString stringWithFormat:@"%p", self]

@implementation MJPerson (Test)

NSMutableDictionary *weights_;

+ (void)load {
    weights_ = [NSMutableDictionary dictionary];
}

- (void)setWeight:(int)weight {
    weights_[MJKey] = @(weight);
}

- (int)weight {
    return [weights_[MJKey] intValue];
}

@end
