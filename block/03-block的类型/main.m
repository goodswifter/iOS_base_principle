//
//  main.m
//  03-block的类型
//
//  Created by zhongaidong on 2020/6/22.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>

void test() {
    // __NSGlobalBlock__ : __NSGlobalBlock : NSBlock : NSObject
    void (^block)(void) = ^{
        NSLog(@"Hello");
    };
    
    NSLog(@"%@", [block class]);
    NSLog(@"%@", [[block class] superclass]);
    NSLog(@"%@", [[[block class] superclass] superclass]);
    NSLog(@"%@", [[[[block class] superclass] superclass] superclass]);
}

int a = 1;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
        
        static int b = 2;
        // 1. 全局block: 没有访问auto变量
        void (^block1)(void) = ^{
            NSLog(@"Hello - %d", b);
        };

        // 2. 堆block: 访问了auto变量或者栈block调用一次copy操作就会变成堆block
        // 堆：动态分配内存, 需要程序员自己申请, 也需要程序员自己管理内存
        int age = 10;
        void (^block2)(void) = ^{
            NSLog(@"Hello - %d", age);
        };

        
        NSLog(@"%@ %@ %@ %@", [block1 class], [block2 class],
              // 3. 栈block:
              [^{
                    NSLog(@"%d", age);
                } class],
              // 栈block copy之后会变为栈block
              [[^{
                    NSLog(@"%d", age);
                } copy] class]);
    }
    return 0;
}
