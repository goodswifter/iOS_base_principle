//
//  MJPerson+Test.h
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"

@interface MJPerson (Test)

// 分类中的属性, 只做一件事情就是
// 生成setter和getter方法的声明
//- (void)setWeight:(int)weight;
//- (int)weight;

@property (assign, nonatomic) int weight;

@end
