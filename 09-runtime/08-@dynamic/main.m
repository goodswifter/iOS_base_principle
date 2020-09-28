//
//  main.m
//  08-@dynamic
//
//  Created by zhongaidong on 2020/9/28.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ADPerson *p = [[ADPerson alloc] init];
        p.age = 20;
        NSLog(@"%zd", p.age);
    }
    return 0;
}
