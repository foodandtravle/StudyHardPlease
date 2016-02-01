//
//  RequestTestDemo.m
//  StudyHardPlease
//
//  Created by 张德强 on 16/1/28.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import "RequestTestDemo.h"

@implementation RequestTestDemo

//建立单例方法
+(instancetype)sharedRequest{
    
    static RequestTestDemo *request = nil;
    
    @synchronized(self) {
        
        if (!request) {
            
            request = [[RequestTestDemo alloc]init];
        }
    }
    return request;
}

//网络请求方法   需要传递参数进去
-(void)postInformationSuccess:(successBlock)success failure:(failureBlock)failure parameters:(NSDictionary *)parameters{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:REQUEST_PATH parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        success([funny parse:responseObject]);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        failure(error.localizedDescription);
    }];
    
}





@end
