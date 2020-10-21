//
//  NSMutableArray+Swizzing.m
//  14-Runtime应用03-方法交换
//
//  Created by zhongaidong on 2020/10/21.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "NSMutableArray+Swizzing.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Swizzing)

+ (void)load {
    // -[__NSArrayM insertObject:atIndex:]: object cannot be nil
    Method method1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method method2 = class_getInstanceMethod(self, @selector(ad_insertObject:atIndex:));
    method_exchangeImplementations(method1, method2);
}

- (void)ad_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        anObject = @"";
    }
    [self ad_insertObject:anObject atIndex:index];
}

@end
