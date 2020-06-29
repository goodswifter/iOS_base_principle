//
//  main.m
//  07-__block修饰符
//
//  Created by zhongaidong on 2020/6/25.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>

struct __Block_byref_age_0 {
    void *__isa;
    __Block_byref_age_0 *__forwarding;
    int __flags;
    int __size;
    int age;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    __Block_byref_age_0 *age; // by ref
};

static struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
  void (*dispose)(struct __main_block_impl_0*);
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // __block变量并没有改变auto变量的本质, 只是把__block变量封装成一个对象
        __block int age = 10;
        ^{
            NSLog(@"%d", age);
        }();
    }
    return 0;
}
