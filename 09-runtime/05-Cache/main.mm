//
//  main.m
//  05-Cache
//
//  Created by zhongaidong on 2020/8/18.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJClassInfo.h"
#import "MJPerson.h"
#import "MJStudent.h"
#import "MJGoodStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        MJPerson *p = [[MJPerson alloc] init];
//
//        mj_objc_class *pCls = (__bridge mj_objc_class *)[MJPerson class];
//
//        [p personTest];
        
        
        MJGoodStudent *goodStudent = [[MJGoodStudent alloc] init];
        mj_objc_class *goodStudentClass = (__bridge mj_objc_class *)[MJGoodStudent class];
        
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        [goodStudent personTest];
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        
        NSLog(@"--------------------------");
        
        // 遍历所有的缓存方法
        cache_t cache = goodStudentClass->cache;
        
        NSLog(@"%s %p", @selector(personTest), cache.imp(@selector(personTest)));
        NSLog(@"%s %p", @selector(studentTest), cache.imp(@selector(studentTest)));
        NSLog(@"%s %p", @selector(goodStudentTest), cache.imp(@selector(goodStudentTest)));
        
        bucket_t *buckets = cache._buckets;
        
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%lu %p", bucket._key, bucket._imp);
        }
        
        NSLog(@"111");
    }
    return 0;
}
