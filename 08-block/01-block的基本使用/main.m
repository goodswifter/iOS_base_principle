//
//  main.m
//  01-block的基本使用
//
//  Created by zhongaidong on 2020/6/22.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>

struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};

struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
};

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  int age;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int age = 20;
        
        void (^block)(int, int) = ^(int a, int b) {
            NSLog(@"this is a block! -- %d", age);
        };
        
        struct __main_block_impl_0 *block0 = (__bridge struct __main_block_impl_0 *)block;
        
        block(10, 10);
    }
    return 0;
}
