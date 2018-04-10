//
//  SONetWorkClient.h
//  BasicFramework
//
//  Created by li wang on 2018/4/10.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
// 请求成功回调
typedef void (^success)(id dataObject);
// 请求失败回调
typedef void (^failure)(id resultDict);
// 请求方法枚举
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD,
    DOWNLOAD,
    UPLOAD
}SOHTTPMethod;

@interface SONetWorkClient : AFHTTPSessionManager
+ (instancetype)sharedInstance;
- (void)requestWithMethod:(SOHTTPMethod)method
                 path:(NSString *)path
               params:(NSDictionary*)params
                needPrompt:(BOOL) needPrompt
         success:(void (^)(id dataObject))success
          failure:(void (^)(id resultDict))failure;
+ (void)getRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure;
+ (void)postRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure;
+ (void)putRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure;
+ (void)headRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure;
+ (void)deleteRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure;
@end
