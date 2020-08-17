//
//  main.m
//  03-共用体union
//
//  Created by zhongaidong on 2020/7/27.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

/*
 共用体的特点:
 共用体内部所有的成员变量公用一块内存
 */
union Date {
    int year;
    char month;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        person.thin = YES;
        person.rich = YES;
        person.handsome = NO;
        
        NSLog(@"thin:%d rich:%d handsome:%d", person.isThin, person.isRich, person.isHandsome);
    }
    return 0;
}
