//
//  main.m
//  02-block的本质
//
//  Created by zhongaidong on 2020/6/22.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>

void (^block)(int, int);

int weight = 10;

/*
 1. auto局部变量: 值捕获
 2. static静态变量: 地址捕获
 3. 全局变量: 不捕获, 直接访问
 4. 参数: 属于auto局部变量, 值捕获
 */

void test() {
    // auto：自动变量，离开作用域就销毁
    int age = 10; // == auto int age = 10;
    static int height = 10;
    
    block = ^(int a, int b) {
        // age的值捕获进来（capture）
        NSLog(@"age is %d, height is %d, weight is %d", age, height, weight);
    };
    
    age = 20;
    height = 20;
    weight = 20;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();
        block(10, 20);
    }
    return 0;
}
