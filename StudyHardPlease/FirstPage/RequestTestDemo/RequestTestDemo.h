//
//  RequestTestDemo.h
//  StudyHardPlease
//
//  Created by 张德强 on 16/1/28.
//  Copyright © 2016年 张德强. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "HTTPRequestPath.h"
#import "AFNetworking.h"
#import "funny.h"

//定义block  成功后用自己写的数模解析
typedef void(^successBlock)(funny *fun);

//定义block  失败后传回失败字符串
typedef void(^failureBlock)(NSString *errorMessage);


@interface RequestTestDemo : NSObject

//单例
+(instancetype)sharedRequest;

//post网络请求
-(void)postInformationSuccess:(successBlock)success failure:(failureBlock)failure parameters:(NSDictionary *)parameters;







@end
