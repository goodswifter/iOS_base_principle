//
//  ViewController.m
//  01-KVO的基本使用
//
//  Created by zhongaidong on 2020/6/12.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ViewController.h"
#import "MJPerson.h"
#import <objc/runtime.h>

@interface ViewController ()
/// Person
@property (nonatomic, strong) MJPerson *person1;
@property (nonatomic, strong) MJPerson *person2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person1 = [[MJPerson alloc] init];
    self.person1.age = 1;
    self.person1.height = 11;
    
    self.person2 = [[MJPerson alloc] init];
    self.person2.age = 2;
    self.person2.height = 22;
    
    NSLog(@"person1添加KVO监听之前 - %p %p",
    [self.person1 methodForSelector:@selector(setAge:)],
    [self.person2 methodForSelector:@selector(setAge:)]);
    
    // 1. 给person1对象的age和height属性添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    [self.person1 addObserver:self forKeyPath:@"height" options:options context:@"456"];
}

// 2. 移除KVO监听
- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
    [self.person1 removeObserver:self forKeyPath:@"height"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person1.age = 21;
    self.person2.age = 22;
    
    self.person1.height = 31;
    self.person2.height = 32;
}

@end
