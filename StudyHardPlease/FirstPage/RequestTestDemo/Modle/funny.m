//
//  funny.m
//  Test
//
//  Created by 张德强 on 16/1/27.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "funny.h"

@implementation funny

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arr = [NSMutableArray new];
    }
    return self;
}

+(instancetype)parse:(NSDictionary *)responsObj{
    
    funny *fun = [funny new];
    
    for (NSDictionary *dic in [[responsObj objectForKey:@"data"] objectForKey:@"list"]) {
        
        [fun.arr addObject:[Info parse:dic]];
    }
    
    return fun;
}

@end


@implementation Info

+(instancetype)parse:(NSDictionary *)dic{
    
    Info *io = [Info new];
    
    [io setValuesForKeysWithDictionary:dic];
    
    return io;
}

-(void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key{
    
}

-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}

@end


