//
//  funny.h
//  Test
//
//  Created by 张德强 on 16/1/27.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface funny : NSObject

@property(nonatomic,strong)NSMutableArray *arr;

+(instancetype)parse:(NSDictionary *)responsObj;


@end


@interface Info : NSObject

@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *pic;


+(instancetype)parse:(NSDictionary *)dic;

@end