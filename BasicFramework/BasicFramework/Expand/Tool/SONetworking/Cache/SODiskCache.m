//
//  SODiskCache.m
//  SONetworking
//
//  Created by wangli on 2018/12/30.
//  Copyright © 2018年 wangli. All rights reserved.
//

#import "SODiskCache.h"

@implementation SODiskCache

+ (instancetype)sharedDiskCache {
    static SODiskCache *diskCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        diskCache = [[SODiskCache alloc] init];
    });
    return diskCache;
}

- (void)writeData:(id)data toDir:(NSString *)directory filename:(NSString *)filename{
    assert(data);
    assert(directory);
    assert(filename);
    
    NSError *error = nil;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (error) {
        NSLog(@"createDirectory error is %@",error.localizedDescription);
        return;
    }
    
    NSString *filePath = [directory stringByAppendingPathComponent:filename];
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

- (id)readDataFromDir:(NSString *)directory filename:(NSString *)filename {
    assert(directory);
    assert(filename);
    
    NSData *data = nil;
    NSString *filePath = [directory stringByAppendingPathComponent:filename];
    data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    return data;
}

- (NSUInteger)dataSizeInDir:(NSString *)directory {
    
    if (!directory) {
        return 0;
    }
    
    BOOL isDir = NO;
    NSUInteger total = 0;
    if ([[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:&isDir]) {
        if (isDir) {
            NSError *error = nil;
            NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directory error:&error];
            if (!error) {
                for (NSString *subFile in array) {
                    NSString *filePath = [directory stringByAppendingPathComponent:subFile];
                    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
                    
                    if (!error) {
                        total += [attributes[NSFileSize] unsignedIntegerValue];
                    }
                }
            }
        }
    }
    
    return total;
}

- (void)clearDataIinDir:(NSString *)directory {
    if (directory) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:nil]) {
            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:directory error:&error];
            if (error) {
                NSLog(@"清理缓存是出现错误：%@",error.localizedDescription);
            }
        }
    }
}

- (void)deleteCache:(NSString *)fileUrl {
    if (fileUrl) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileUrl]) {
            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:fileUrl error:&error];
            if (error) {
                NSLog(@"删除文件出现错误出现错误：%@",error.localizedDescription);
            }
        }else {
            NSLog(@"不存在文件");
        }
    }
}


@end
