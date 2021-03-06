//
//  main.m
//  02-位域
//
//  Created by zhongaidong on 2020/7/27.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        person.rich = YES;
        person.tall = YES;
        person.handsome = YES;
        
        NSLog(@"tall:%d rich:%d handsome:%d", person.isTall, person.isRich, person.isHandsome);
    }
    return 0;
}
