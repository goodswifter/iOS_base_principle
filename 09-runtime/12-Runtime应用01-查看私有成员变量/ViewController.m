//
//  ViewController.m
//  12-Runtime应用01-查看私有成员变量
//
//  Created by zhongaidong on 2020/10/21.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int count;
    // 找到对应的属性_placeholderLabel
    Ivar *ivars =  class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSLog(@"%s - %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    // 释放变量
    free(ivars);
    
    // 查看属性的类型以及其父类的类型
    /*
     禁止访问苹果内部私有属性
     Terminating app due to uncaught exception 'NSGenericException', reason: 'Access to UITextField's _placeholderLabel ivar is prohibited. This is an application bug'
     */
//    id placeholderLabel = [self.textField2 valueForKeyPath:@"_placeholderLabel"];
//    NSLog(@"%@ - %@", [placeholderLabel class], [placeholderLabel superclass]);
    
    // iOS 13之后不能再使用这种方式
//    [self.textField2 setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    self.textField2.placeholder = @"哈哈哈";
    
    Ivar ivar = class_getInstanceVariable([UITextField class], "_placeholderLabel");
    
    // 找到placeholderLabel的父类
//    id placeholderLabel = object_getIvar(self.textField2, ivar);
//    NSLog(@"%@ - %@", [placeholderLabel class], [placeholderLabel superclass]);
    
    UILabel *placeholderLabel = object_getIvar(self.textField2, ivar);
    placeholderLabel.textColor = [UIColor redColor];
    
    self.textField2.placeholder = @"qwerqwer";
}

@end
