//
//  main.m
//  02-KVC设置值原理
//
//  Created by zhongaidong on 2020/6/15.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *p = [[MJPerson alloc] init];
        
        [p setValue:@20 forKey:@"age"];
//        NSLog(@"_age : %d", p->_age);
//        NSLog(@"_isAge : %d", p->_isAge);
//        NSLog(@"age : %d", p->age);
        NSLog(@"isAge : %d", p->isAge);
    }
    return 0;
}
