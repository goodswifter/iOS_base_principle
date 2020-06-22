//
//  MJPerson.h
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJPerson : NSObject
// 1. 生成对应_key的成员变量
//{
//    int _age;
//}

// 2. 生成对应的setter和getter方法的声明
//- (void)setAge:(int)age;
//- (int)age;

@property (assign, nonatomic) int age;

@end
