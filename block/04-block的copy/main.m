//
//  main.m
//  04-block的copy
//
//  Created by zhongaidong on 2020/6/25.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MJBlock)(void);

// 1
MJBlock myblock() {
    int age1 = 10;
    return ^{
        NSLog(@"age1 = %d", age1);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1. block作为函数返回值时
//        MJBlock block1 = myblock();
//        NSLog(@"%@", [block1 class]);
//        myblock();
        
        // 2. 将block赋值给__strong指针时
//        int age2 = 10;
//        MJBlock block2 = ^{
//            NSLog(@"age2 = %d", age2);
//        };
//        block2();
//        NSLog(@"%@", [block2 class]);
        
        // 3. block作为Cocoa API中方法名含有usingBlock的方法参数时
        NSArray *arr;
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
        }];
        
        // 4. block作为GCD API的方法参数时
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
    }
    return 0;
}
