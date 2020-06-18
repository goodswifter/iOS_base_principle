//
//  main.m
//  04-分类添加属性03-关联对象
//
//  Created by zhongaidong on 2020/6/18.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJPerson+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        person.age = 10;
        person.weight = 40;

        MJPerson *person2 = [[MJPerson alloc] init];
        person2.age = 20;
        person2.weight = 50;

        NSLog(@"person - age is %d, weight is %d", person.age, person.weight);
        NSLog(@"person2 - age is %d, weight is %d", person2.age, person2.weight);
    }
    return 0;
}
