//
//  MJPerson+Test.m
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson+Test.h"

@implementation MJPerson (Test)

//int weight_;
static int weight_;

- (void)setWeight:(int)weight {
    weight_ = weight;
}

- (int)weight {
    return weight_;
}

@end
