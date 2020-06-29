//
//  main.m
//  08-__block修饰的对象类型
//
//  Created by zhongaidong on 2020/6/29.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

typedef void(^MJBlock)(void);

struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};

struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(void);
  void (*dispose)(void);
};

struct __Block_byref_person_0 {
    void *__isa;
    struct __Block_byref_person_0 *__forwarding;
    int __flags;
    int __size;
    void (*__Block_byref_id_object_copy)(void*, void*);
    void (*__Block_byref_id_object_dispose)(void*);
    MJPerson *__strong person; // 强指针
    MJPerson *__weak weakPerson; // 弱指针
};

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  struct __Block_byref_person_0 *person;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ARC
        // 强指针
//        __block MJPerson *person = [[MJPerson alloc] init];
        
        // 弱指针
//        MJPerson *person = [[MJPerson alloc] init];
//        __block __weak MJPerson *weakPerson = person;
//
//        MJBlock block = ^{
//           NSLog(@"%p", weakPerson);
//        };
//
//        block();
        //
        MJBlock block;
        {
            MJPerson *person = [[MJPerson alloc] init];
            __block __weak MJPerson *weakPerson = person;
            block = ^{
                weakPerson = [[MJPerson alloc] init];
                NSLog(@"%p", weakPerson);
            };
        }
        block();
    }
    return 0;
}
