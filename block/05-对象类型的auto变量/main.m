//
//  main.m
//  05-对象类型的auto变量
//
//  Created by zhongaidong on 2020/6/25.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

typedef void (^MJBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJBlock block;
        {
            MJPerson *person = [[MJPerson alloc] init];
            person.age = 10;

            __weak MJPerson *weakPerson = person;
            block = ^{
                NSLog(@"---------%d", weakPerson.age);
            };
        }

        NSLog(@"------");
    }
    return 0;
}
