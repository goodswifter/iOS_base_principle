//
//  main.m
//  02-isa的真实地址
//
//  Created by zhongaidong on 2020/6/11.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

// MJPerson
@interface MJPerson : NSObject <NSCopying> {
@public
    int _age;
}
@end

@implementation MJPerson
@end

struct mj_objc_class {
    Class isa;
    Class superclass;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MJPerson
        // 实例对象的isa地址: 0x001d8001000014e9
        // ISA_MASK(x86_64)：0x00007ffffffffff8
        // isa & ISA_MASK：0x00000001000014c8
        // 所以: 类对象的地址: 0x1000014e8
        
        // 类对象的isa地址: 0x00000001000014c0
        // ISA_MASK(x86_64)：0x00007ffffffffff8
        // isa & ISA_MASK：0x00000001000014c0
        // 所以: 元类对象的地址为: 0x1000014c0
        
        MJPerson *person = [[MJPerson alloc] init];
        
        Class personClass = [MJPerson class];
        
        struct mj_objc_class *personClass2 = (__bridge struct mj_objc_class *)(personClass);

        Class personMetaClass = object_getClass(personClass);

        NSLog(@"%p %p %p", person, personClass, personMetaClass);
        
        struct mj_objc_class *personClass1 = (__bridge struct mj_objc_class *)([MJPerson class]);
        NSLog(@"1111");
    }
    return 0;
}
