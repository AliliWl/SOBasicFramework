//
//  SONetworking.h
//  SONetworking
//
//  Created by wangli on 2018/12/30.
//  Copyright © 2018年 wangli. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  请求任务
 */
typedef NSURLSessionTask SOURLSessionTask;

/**
 *  成功回调
 *
 *  @param response 成功后返回的数据
 */
typedef void(^SOResponseSuccessBlock)(id response);

/**
 *  失败回调
 *
 *  @param error 失败后返回的错误信息
 */
typedef void(^SOResponseFailBlock)(NSError *error);

/**
 *  下载进度
 *
 *  @param bytesRead              已下载的大小
 *  @param totalBytes                总下载大小
 */
typedef void (^SODownloadProgress)(int64_t bytesRead, int64_t totalBytes);

/**
 *  下载成功回调
 *
 *  @param url                       下载存放的路径
 */
typedef void(^SODownloadSuccessBlock)(NSURL *url);

/**
 *  上传进度
 *  @param bytesWritten              已上传的大小
 *  @param totalBytes                总上传大小
 */
typedef void(^SOUploadProgressBlock)(int64_t bytesWritten, int64_t totalBytes);

/**
 *  多文件上传成功回调
 *  @param responses 成功后返回的数据
 */
typedef void(^SOMultUploadSuccessBlock)(NSArray *responses);

/**
 *  多文件上传失败回调
 *  @param errors 失败后返回的错误信息
 */
typedef void(^SOMultUploadFailBlock)(NSArray *errors);
typedef SODownloadProgress SOGetProgress;
typedef SODownloadProgress SOPostProgress;
typedef SOResponseFailBlock SODownloadFailBlock;

@interface SONetworking : NSObject

+ (instancetype)shaerdInstance;
/**
 *  正在运行的网络任务
 *  @return task
 */
- (NSArray *)currentRunningTasks;


/**
 *  配置请求头
 *  @param httpHeader 请求头
 */
- (void)configHttpHeader:(NSDictionary *)httpHeader;

/**
 *  取消GET请求
 */
- (void)cancelRequestWithURL:(NSString *)url;

/**
 *  取消所有请求
 */
- (void)cancleAllRequest;



/**
 *  GET请求
 *
 *  @param url              请求路径
 *  @param cache            是否缓存
 *  @param params           拼接参数
 *  @param progressBlock    进度回调
 *  @param successBlock     成功回调
 *  @param failBlock        失败回调
 *
 *  @return 返回的对象中可取消请求
 */
- (SOURLSessionTask *)getWithUrl:(NSString *)url cache:(BOOL)cache params:(NSDictionary *)params progressBlock:(SOGetProgress)progressBlock successBlock:(SOResponseSuccessBlock)successBlock failBlock:(SOResponseFailBlock)failBlock;




/**
 *  POST请求
 *
 *  @param url              请求路径
 *  @param cache            是否缓存
 *  @param params           拼接参数
 *  @param progressBlock    进度回调
 *  @param successBlock     成功回调
 *  @param failBlock        失败回调
 *
 *  @return 返回的对象中可取消请求
 */
- (SOURLSessionTask *)postWithUrl:(NSString *)url cache:(BOOL)cache params:(NSDictionary *)params progressBlock:(SOPostProgress)progressBlock successBlock:(SOResponseSuccessBlock)successBlock failBlock:(SOResponseFailBlock)failBlock;




/**
 *  文件上传
 *
 *  @param url              上传文件接口地址
 *  @param data             上传文件数据
 *  @param fileName         上传文件名
 *  @param name             上传文件服务器文件夹名
 *  @param mimeType         mimeType
 *  @param progressBlock    上传文件路径
 *	@param successBlock     成功回调
 *	@param failBlock		失败回调
 *
 *  @return 返回的对象中可取消请求
 */
- (SOURLSessionTask *)uploadFileWithUrl:(NSString *)url fileData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progressBlock:(SOUploadProgressBlock)progressBlock successBlock:(SOResponseSuccessBlock)successBlock failBlock:(SOResponseFailBlock)failBlock;


/**
 *  多文件上传
 *
 *  @param url           上传文件地址
 *  @param datas         数据集合
 *  @param name          服务器文件夹名
 *  @param fileName      上传文件名
 *  @param mimeTypes      mimeTypes
 *  @param progressBlock 上传进度
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 *
 *  @return 任务集合
 */
- (NSArray *)uploadMultFileWithUrl:(NSString *)url fileDatas:(NSArray *)datas name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeTypes progressBlock:(SOUploadProgressBlock)progressBlock successBlock:(SOMultUploadSuccessBlock)successBlock failBlock:(SOMultUploadFailBlock)failBlock;


/**
 *  文件下载
 *
 *  @param url           下载文件接口地址
 *  @param progressBlock 下载进度
 *  @param successBlock  成功回调
 *  @param failBlock     下载回调
 *
 *  @return 返回的对象可取消请求
 */
- (SOURLSessionTask *)downloadWithUrl:(NSString *)url progressBlock:(SODownloadProgress)progressBlock successBlock:(SODownloadSuccessBlock)successBlock failBlock:(SODownloadFailBlock)failBlock;

@end



@interface SONetworking (cache)

/**
 *  获取缓存目录路径
 *
 *  @return 缓存目录路径
 */
- (NSString *)getCacheDiretoryPath;

/**
 *  获取下载目录路径
 *
 *  @return 下载目录路径
 */
- (NSString *)getDownDirectoryPath;

/**
 *  获取缓存大小
 *
 *  @return 缓存大小
 */
- (NSUInteger)totalCacheSize;

/**
 *  获取所有下载数据大小
 *
 *  @return 下载数据大小
 */
- (NSUInteger)totalDownloadDataSize;

/**
 *  清除下载数据
 */
- (void)clearDownloadData;

/**
 *  清除所有缓存
 */
- (void)clearTotalCache;

@end
