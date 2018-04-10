# 	SOBasicFramework


1. MYBlurIntroductionView的使用

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

2. SONetWorkClient的使用

   * SONetWorkClient是基于`AFNetWorking3.0`的二次封装，使用方法如下：在HTTPURLDefine中填写BaseUrl，然后调用相应的方法即可
   ```objective-c
   [SONetWorkClient getRequest:path parameters:nil needPrompt:YES success:^(id dataObject) {
        
   } failure:^(id resultDict) {
        
   }];

   [SONetWorkClient postRequest:path parameters:nil needPrompt:YES success:^(id dataObject) {
        
   } failure:^(id resultDict) {
        
   }];

   [SONetWorkClient putRequest:path parameters:nil needPrompt:YES success:^(id dataObject) {
        
   } failure:^(id resultDict) {
        
   }];
   [SONetWorkClient headRequest:path parameters:nil needPrompt:YES success:^(id dataObject) {
        
   } failure:^(id resultDict) {
        
   }];
   [SONetWorkClient deleteRequest:path parameters:nil needPrompt:YES success:^(id dataObject) {
        
   } failure:^(id resultDict) {
        
   }];
   ```



