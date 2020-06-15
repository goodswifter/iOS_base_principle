//
//  main.m
//  03-KVC获取值原理
//
//  Created by zhongaidong on 2020/6/15.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
//        person->_age = 15;
//        person->_isAge = 16;
//        person->age = 17;
        person->isAge = 18;
//        [person setValue:@15 forKey:@"age"];
        
        
        NSLog(@"%d", [[person valueForKeyPath:@"age"] intValue]);
    }
    return 0;
}
