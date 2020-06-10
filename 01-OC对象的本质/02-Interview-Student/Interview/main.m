//
//  main.m
//  Interview
//
//  Created by zhongaidong on 2020/6/10.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

//struct NSObject_IMPL {
//    Class isa;
//};

// 内存对齐, Student_IMPL应该占24字节, 为啥实际内存是16呢?
struct Student_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;
    Class isa;
    int _no;
    int _age;
};

// Student
@interface Student : NSObject {
    @public
    int _no;
    int _age;
}

@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        stu->_no = 4;
        stu->_age = 5;
        
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)(stu)));
        
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)(stu);
        NSLog(@"no is %d, age is %d", stuImpl->_no, stuImpl->_age);
    }
    return 0;
}
