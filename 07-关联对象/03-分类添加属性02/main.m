//
//  main.m
//  03-分类添加属性02
//
//  Created by zhongaidong on 2020/6/18.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJPerson+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 方式二: 通过添加全局的字典, 设置对应的属性
        // 缺点:
        // 1. 每一个属性都需要个全局的字典来维护, 维护麻烦
        // 2. 多个线程同时访问, 可能导致线程安全问题
        // 3. 字典是全局的, 一直存在内存中, 浪费内存
        MJPerson *person = [[MJPerson alloc] init];
        person.age = 10;
        person.weight = 40;

        MJPerson *person2 = [[MJPerson alloc] init];
        person2.age = 20; // 20是存储在peron2对象内部
        person2.weight = 50; // 50是存放在全局的字典对象里面

        NSLog(@"person - age is %d, weight is %d", person.age, person.weight);
        NSLog(@"person2 - age is %d, weight is %d", person2.age, person2.weight);
    }
    return 0;
}
