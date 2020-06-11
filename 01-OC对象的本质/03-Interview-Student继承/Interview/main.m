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

struct NSObject_IMPL {
    Class isa;
};

struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
};

struct Student_IMPL { // 24
    struct Person_IMPL Person_IVARS;
    int _no;
    int _height;
};

// Person
@interface Person : NSObject {
    @public
    int _age;
}
@end

@implementation Person
@end

// Student
@interface Student : Person {
    int _no;
}
@property (nonatomic, assign) int height;
@end

@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)(stu)));
        
        NSLog(@"%zd", sizeof(struct Student_IMPL));
        
        Person *p = [[Person alloc] init];
        NSLog(@"%zd", class_getInstanceSize([Person class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)(p)));
    }
    return 0;
}
