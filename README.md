# 	SOBasicFramework

####MYBlurIntroductionView

* 在要使用的类中导入头文件 `#import "MYBlurIntroductionView.h"`
* 初始化 `MYIntroductionPanel`（panel1，panel2...）

  可使用的方法有：
  ​	

  ```objective-c
  -(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description;
  -(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description header:(UIView *)headerView;
  -(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description image:(UIImage *)image;
  -(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description image:(UIImage *)image header:(UIView *)headerView;
  -(id)initWithFrame:(CGRect)frame nibNamed:(NSString *)nibName;
  ```

* 把初始化的`MYIntroductionPanel`(panel1,panel2...)添加到数组中Array中
* 初始化`MYBlurIntroductionView`(introductionView),并且使用方法
	
		-(void)buildIntroductionWithPanels:(NSArray *)panels
	
	把Array添加到`MYBlurIntroductionView`(introductionView)中
* 最后把`MYBlurIntroductionView`(introductionView)添加到self.view中即可
* `MYIntroductionDelegate`的使用

   引导页结束时可以使用的方法
   ```objective-c
   -(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType;
   ```

   ```objective-c
   用来改变每个引导页切换
    -(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex;
   ```

#### SONetworking

​	基于AFNetworking3.x封装网络请求功能，API面向业务层更加友好

- 基础功能

  GET、POST、下载、单文件上传、多文件上传、取消网络请求

- 缓存功能

  缓存分为内存缓存和磁盘缓存，缓存使用LRU缓存淘汰算法，支持过期检验

  #####使用

  ```objective-c
  #import "SONetworking.h"
  ```

* GET请求

  ```objective-c
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
  - (SOURLSessionTask *)getWithUrl:(NSString *)url
  cache:(BOOL)cache
  params:(NSDictionary *)params
  progressBlock:(SOGetProgress)progressBlock
  successBlock:(SOResponseSuccessBlock)successBlock
  failBlock:(SOResponseFailBlock)failBlock;
  ```

* POST请求

  ```objective-c
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
  - (SOURLSessionTask *)postWithUrl:(NSString *)url
                             cache:(BOOL)cache
                            params:(NSDictionary *)params
                     progressBlock:(SOGetProgress)progressBlock
                      successBlock:(SOResponseSuccessBlock)successBlock
                         failBlock:(SOResponseFailBlock)failBlock;
  ```

* 文件上传

  ```objective-c
   *  文件上传
   *
   *  @param url              上传文件接口地址
   *  @param data             上传文件数据
   *  @param type             上传文件类型
   *  @param name             上传文件服务器文件夹名
   *  @param mimeType         mimeType
   *  @param progressBlock    上传文件路径
   *	@param successBlock     成功回调
   *	@param failBlock		失败回调
   *
   *  @return 返回的对象中可取消请求
   */
  - (SOURLSessionTask *)uploadFileWithUrl:(NSString *)url
                                  fileData:(NSData *)data
                                      type:(NSString *)type
                                      name:(NSString *)name
                                  mimeType:(NSString *)mimeType
                             progressBlock:(SOUploadProgressBlock)progressBlock
                              successBlock:(SOResponseSuccessBlock)successBlock
                                 failBlock:(SOResponseFailBlock)failBlock;
  ```

* 多文件上传

  ```objective-c
  /**
   *  多文件上传
   *
   *  @param url           上传文件地址
   *  @param datas         数据集合
   *  @param type          类型
   *  @param name          服务器文件夹名
   *  @param mimeType      mimeTypes
   *  @param progressBlock 上传进度
   *  @param successBlock  成功回调
   *  @param failBlock     失败回调
   *
   *  @return 任务集合
   */
  - (NSArray *)uploadMultFileWithUrl:(NSString *)url
                           fileDatas:(NSArray *)datas
                                type:(NSString *)type
                                name:(NSString *)name
                            mimeType:(NSString *)mimeTypes
                       progressBlock:(SOUploadProgressBlock)progressBlock
                        successBlock:(SOMultUploadSuccessBlock)successBlock
                           failBlock:(SOMultUploadFailBlock)failBlock;
  ```

* 下载请求

  ```objective-c
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
  - (SOURLSessionTask *)downloadWithUrl:(NSString *)url
  
                          progressBlock:(SODownloadProgress)progressBlock
  
                           successBlock:(SODownloadSuccessBlock)successBlock
  
                              failBlock:(SODownloadFailBlock)failBlock;
  ```

* 获取当前正在运行的任务

  ```objective-c
  /**
   *  正在运行的网络任务
   *
   *  @return 
   */
  - (NSArray *)currentRunningTasks;
  ```

* 取消所有网络请求

  ```objective-c
  - (void)cancleAllRequest;
  ```

* 取消下载请求

  ```objective-c
  - (void)cancelRequestWithURL:(NSString *)url;
  ```

* 获取缓存大小

  ```objective-c
  /**
   *  获取缓存大小
   *
   *  @return 缓存大小
   */
  - (NSUInteger)totalCacheSize;
  ```

* 清理缓存

* ```objective-c
  /**
   *  清除所有缓存
   */
  - (void)clearTotalCache;
  ```

* 自动清理缓存

* ```objective-c
  /**
   *每次网络请求的时候，检查此时磁盘中的缓存大小，阈值默认是40MB，如果超过阈值，则清理LRU缓
   *存,同时也会清理过期缓存，缓存默认SSL是7天，磁盘缓存的大小和SSL的设置可以通过该方法
   *[SOCacheManager shareManager] setCacheTime: diskCapacity:]设置。
   */
  [[SOCacheManager shareManager] clearLRUCache];
  ```

  ##### 注意

  1. 对于cache与否，你可以根据自己的需要来决定是否开启cache，即时性和时效性的数据建议不开启缓存，一般建议开启，开启缓存后会回调两次，第一次获取是缓存数据，第二次获取的是最新的网络数据；

  2. 刷新请求参数:设置它是为了解决重复请求的问题。比如，当我们在列表里面上拉获取更多数据的时候，有时候因为网络慢，还没有回调响应刷新出数据，这时候我们可能不断刷新列表，如果业务层不判断，就会发起很多重复的请求。遇到重复请求，若参数设为YES，则会取消旧的请求，用新的请求，若设为NO，则忽略新请求，用旧请求。

  3. 具体使用的时候，可以面向业务层再封装一次Service层或者将网络请求写进MVVM的viewModel中，向controller暴露只面向业务的参数。






