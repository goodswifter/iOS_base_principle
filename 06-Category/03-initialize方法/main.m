//
//  main.m
//  03-initialize方法
//
//  Created by 钟爱东 on 2020/6/15.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJStudent.h"
#import "MJTeacher.h"
#import "MJCat.h"
#import "MJDog.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [MJPerson alloc];
        [MJStudent alloc];
        [MJTeacher alloc];
        
        // 内部实现逻辑
        // 在子类中, 会判断父类是否已经初始化过, 没有会调用一次父类的初始化
//        objc_msgSend([MJPerson class], @selector(initialize));
//        objc_msgSend([MJStudent class], @selector(initialize));
        
        
        // MJPerson (Test2) +initialize
//        objc_msgSend([MJPerson class], @selector(initialize));
//        // MJPerson (Test2) +initialize
//        objc_msgSend([MJStudent class], @selector(initialize));
//        // MJPerson (Test2) +initialize
//        objc_msgSend([MJTeacher class], @selector(initialize));
        
//        [MJCat alloc];
//        [MJDog alloc];
    }
    return 0;
}
