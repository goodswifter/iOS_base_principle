//
//  main.m
//  01-isa和superclass
//
//  Created by zhongaidong on 2020/6/11.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Test.h"

@interface MJPerson : NSObject

+ (void)test;

@end

@implementation MJPerson

//+ (void)test
//{
//    NSLog(@"+[MJPerson test] - %p", self);
//}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"[MJPerson class] - %p", [MJPerson class]);
        NSLog(@"[NSObject class] - %p", [NSObject class]);
        
        [MJPerson test];
//        objc_msgSend([MJPerson class], @selector(test))
        
        // isa -> superclass -> suerpclass -> superclass -> .... superclass == nil
        
//        [NSObject test];
//        objc_msgSend([NSObject class], @selector(test))
    }
    return 0;
}
