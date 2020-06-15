//
//  main.m
//  01-Category本质
//
//  Created by zhongaidong on 2020/6/15.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MJPerson+Eat.h"
//#import "MJPerson+Test.h"
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 通过runtime动态将分类的方法合并到类对象、元类对象中
        MJPerson *person = [[MJPerson alloc] init];
        [person run];
    }
    return 0;
}
