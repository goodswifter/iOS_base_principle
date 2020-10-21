//
//  NSMutableDictionary+Swizzing.m
//  14-Runtime应用03-方法交换
//
//  Created by zhongaidong on 2020/10/21.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "NSMutableDictionary+Swizzing.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Swizzing)

+ (void)load {
    // -[__NSDictionaryM setObject:forKeyedSubscript:]: key cannot be nil
    Method method1 = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKeyedSubscript:));
    Method method2 = class_getInstanceMethod(self, @selector(ad_setObject:forKeyedSubscript:));
    method_exchangeImplementations(method1, method2);
}

- (void)ad_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!key) return;
    [self ad_setObject:obj forKeyedSubscript:key];
}

@end
