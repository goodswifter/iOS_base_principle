//
//  MJPerson+Test.m
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson+Test.h"
#import <objc/runtime.h>

@implementation MJPerson (Test)

static const char MJNameKey;
static const char MJWeightKey;
- (void)setName:(NSString *)name {
    /*
     id object,
     const void * key,
     id value,
     objc_AssociationPolicy policy
     */
    objc_setAssociatedObject(self, &MJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, &MJNameKey);
}

- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, &MJWeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)weight {
    return [objc_getAssociatedObject(self, &MJWeightKey) intValue];
}

@end
