//
//  main.m
//  02-分类添加属性01
//
//  Created by zhongaidong on 2020/6/18.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJPerson+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 方式一: 通过全局变量/静态全局变量给属性赋值
        // 缺点: 因为全局变量/静态全局变量存放在数据段中, 所有的人都可以修改, 后面修改完, 前面的数据也会跟着变
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
