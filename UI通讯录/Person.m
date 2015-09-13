//
//  Person.m
//  UI通讯录
//
//  Created by 邢家赫 on 15/9/10.
//  Copyright (c) 2015年 邢家赫. All rights reserved.
//

#import "Person.h"

@implementation Person



-(id) initWithName:(NSString *)name number:(NSString *)number image:(NSString *)image age:(NSInteger)age group:(NSString *)group
{
    _name = name;
    _number = number;
    _image = image;
    _age = age;
    _group = group;
    return self;
}

//-(void)name:(NSString *)name
//{
//    _name = name;
//}
//
//-(void)age:(NSInteger)age
//{
//    _age = age;
//}
//
//-(void)number:(NSString *)number
//{
//    _number = number;
//}
//
//
//-(void)image:(NSString *)image
//{
//    _image = image;
//}


@end
