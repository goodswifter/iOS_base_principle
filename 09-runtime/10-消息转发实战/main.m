//
//  main.m
//  10-消息转发实战
//
//  Created by zhongaidong on 2020/9/28.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

/*
 实战: 可以用来降低unrecognized selector崩溃率
 消息转发框架: NSProxy
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *p = [[MJPerson alloc] init];
        [p run];
        [p test];
        [p other];
    }
    return 0;
}
