//
//  SONetWorkClient.m
//  BasicFramework
//
//  Created by li wang on 2018/4/10.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import "SONetWorkClient.h"

@implementation SONetWorkClient
+ (instancetype)sharedInstance{
    static SONetWorkClient *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:SOBaseURL]];
    });
    return manager;
}
-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 5;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}
- (void)requestWithMethod:(SOHTTPMethod)method
                     path:(NSString *)path
                   params:(NSDictionary*)params
               needPrompt:(BOOL) needPrompt
                  success:(void (^)(id dataObject))success
                  failure:(void (^)(id resultDict))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",SOBaseURL,path];
    
    switch (method) {
        case GET:{
            [self GET:requestUrl parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                DLog(@"Error: %@", error);
                failure(error);
            }];
            break;
        }
        case POST:{
            [self POST:requestUrl parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                DLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                DLog(@"Error: %@", error);
                failure(error);
            }];
            break;
        }
        case PUT:{
            [self PUT:requestUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                DLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"Error: %@", error);
                failure(error);
            }];
            break;
        }
        case HEAD:{
            [self HEAD:requestUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task) {
                DLog(@"JSON: %@", task);
                success(task);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"Error: %@", error);
                failure(error);
            }];
            break;
        }
        case DELETE:{
            [self DELETE:requestUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                DLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"JSON: %@", error);
                success(error);
            }];
            break;
        }
        case DOWNLOAD:{
            NSURLSessionDownloadTask *downloadTask = [self downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requestUrl]] progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
                return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                DLog(@"File downloaded to: %@", filePath);
            }];
            [downloadTask resume];
            break;
        }
        case UPLOAD:{
//            [self uploadTaskWithStreamedRequest:<#(nonnull NSURLRequest *)#> progress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgressBlock#> completionHandler:<#^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)completionHandler#>]
            
//            [self uploadTaskWithRequest:<#(nonnull NSURLRequest *)#> fromData:<#(nullable NSData *)#> progress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgressBlock#> completionHandler:<#^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)completionHandler#>]
            
//            [self uploadTaskWithRequest:<#(nonnull NSURLRequest *)#> fromFile:<#(nonnull NSURL *)#> progress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgressBlock#> completionHandler:<#^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)completionHandler#>]
            break;
        }
        default:
            break;
    }
}
+ (void)getRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure{
    [[SONetWorkClient sharedInstance] requestWithMethod:GET path:path params:parameters needPrompt:needPrompt success:^(id dataObject) {
        success(dataObject);
    } failure:^(id resultDict) {
        failure(resultDict);
    }];
}
+ (void) postRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure{
    [[SONetWorkClient sharedInstance] requestWithMethod:POST path:path params:parameters needPrompt:needPrompt success:^(id dataObject) {
        success(dataObject);
    } failure:^(id resultDict) {
        failure(resultDict);
    }];
}
+ (void)putRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure{
    [[SONetWorkClient sharedInstance] requestWithMethod:PUT path:path params:parameters needPrompt:needPrompt success:^(id dataObject) {
        success(dataObject);
    } failure:^(id resultDict) {
        failure(resultDict);
    }];
}
+ (void)headRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure{
    [[SONetWorkClient sharedInstance] requestWithMethod:HEAD path:path params:parameters needPrompt:needPrompt success:^(id dataObject) {
        success(dataObject);
    } failure:^(id resultDict) {
        failure(resultDict);
    }];
}
+ (void)deleteRequest:(NSString *) path parameters:(NSDictionary *)parameters needPrompt:(BOOL) needPrompt success:(void (^)(id dataObject))success failure:(void (^)(id resultDict))failure{
    [[SONetWorkClient sharedInstance] requestWithMethod:DELETE path:path params:parameters needPrompt:needPrompt success:^(id dataObject) {
        success(dataObject);
    } failure:^(id resultDict) {
        failure(resultDict);
    }];
}
@end
