//
//  main.m
//  01-分类的属性
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

        NSLog(@"person - age is %d, weight is %d", person.age, person.weight);
    }
    return 0;
}
