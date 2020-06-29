//
//  main.m
//  09-循环引用
//
//  Created by zhongaidong on 2020/6/29.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 循环引用1
//        MJPerson *person = [[MJPerson alloc] init];
//        person.age = 10;
//        person.block = ^{
//            NSLog(@"age is %d", person.age);
//        };
        
        // 解决循环引用
        MJPerson *person = [[MJPerson alloc] init];
//         __weak和__unsafe_unretained的区别
//         __weak：不会产生强引用, 指向的对象销毁时, 会自动让指针置为nil
//         __unsafe_unretained：不会产生强引用, 不安全, 指向的对象销毁时, 指针存储的地址值不变, 再次访问该变量就会造成野指针错误
        // 方式一: __weak
//        __weak MJPerson *weakPerson = person;
        // 方式二: __unsafe_unretained
//        __unsafe_unretained MJPerson *weakPerson = person;
//        person.age = 10;
//        person.block = ^{
//            NSLog(@"age is %d", weakPerson.age);
//        };
        // 方式三: __block, 必须做完以下两步才能保证不能造成循环引用
        // 1. 对象指针使用完成置空
        // 2. 调用block
        __block MJPerson *blockPerson = person;
        blockPerson.age = 10;
        blockPerson.block = ^{
            NSLog(@"age is %d", blockPerson.age);
            // 1
            blockPerson = nil;
        };
        // 2
        blockPerson.block();
    }
    return 0;
}
