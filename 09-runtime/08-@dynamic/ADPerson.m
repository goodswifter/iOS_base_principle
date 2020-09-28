//
//  ADPerson.m
//  08-@dynamic
//
//  Created by zhongaidong on 2020/9/28.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADPerson.h"
#import <objc/runtime.h>

@implementation ADPerson

#pragma mark - synthesize
/*
 
 */
/*
//@synthesize age; // == @synthesize age = age;
// 系统默认生成
@synthesize age = _age;

- (void)setAge:(NSInteger)age {
    _age = age;
}
 */

#pragma mark - dynamic
/*
 dynamic: 做了两件事
 1. 提醒编译器不要自动生成setter和getter的实现
 2. 不要自动生成成员变量
 */
@dynamic age;

#pragma mark - 添加setter和getter方法的实现
void setAge(id self, SEL _cmd, int age) {
    NSLog(@"age is %d", age);
}

int age(id self, SEL _cmd) {
    return 100;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(setAge:)) {
        class_addMethod(self, sel, (IMP)setAge, "v@:i");
        return YES;
    } else if (sel == @selector(age)) {
        class_addMethod(self, sel, (IMP)age, "i@:");
    }
    return [super resolveInstanceMethod:sel];
}

@end
