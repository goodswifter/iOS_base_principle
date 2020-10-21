//
//  UIControl+Extension.m
//  14-Runtime应用03-方法交换
//
//  Created by zhongaidong on 2020/10/21.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load {
    // hook: 钩子函数
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(ad_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)ad_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"%@ - %@", target, NSStringFromSelector(action));
    
    [self ad_sendAction:action to:target forEvent:event];
}

@end
