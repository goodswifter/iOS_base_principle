//
//  main.m
//  07-消息转发
//
//  Created by zhongaidong on 2020/9/28.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPerson.h"

// 消息转发: 将消息转发给别人

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ADPerson *p = [[ADPerson alloc] init];
        [p test2:15];
        
        [ADPerson test3];
    }
    return 0;
}
