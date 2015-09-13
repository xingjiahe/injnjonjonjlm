//
//  Person.h
//  UI通讯录
//
//  Created by 邢家赫 on 15/9/10.
//  Copyright (c) 2015年 邢家赫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,copy) NSString *number;
@property(nonatomic,copy) NSString *image;
@property(nonatomic,copy) NSString *group;

-(id) initWithName:(NSString *)name number:(NSString *)number image:(NSString *)image age:(NSInteger)age group:(NSString *)group;


//-(void)name:(NSString *)name;
//
//-(void)age:(NSInteger)age;
//
//-(void)number:(NSString *)number;
//
//-(void)image:(NSString *)image;

@end
