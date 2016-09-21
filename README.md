# SOBasicFramework


1. MYBlurIntroductionView的使用

	* 在要使用的类中导入头文件 `#import "MYBlurIntroductionView.h"`
	* 初始化 `MYIntroductionPanel`（panel1，panel2...）
		
		可使用的方法有：
			
			-(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description;
			-(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description header:(UIView *)headerView;
			-(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description image:(UIImage *)image;
			-(id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description image:(UIImage *)image header:(UIView *)headerView;
			-(id)initWithFrame:(CGRect)frame nibNamed:(NSString *)nibName;
	
	* 把初始化的`MYIntroductionPanel`(panel1,panel2...)添加到数组中Array中
	* 初始化`MYBlurIntroductionView`(introductionView),并且使用方法
		
			-(void)buildIntroductionWithPanels:(NSArray *)panels
		
		把Array添加到`MYBlurIntroductionView`(introductionView)中
	* 最后把`MYBlurIntroductionView`(introductionView)添加到self.view中即可
	* `MYIntroductionDelegate`的使用
	
			引导页结束时可以使用的方法
			-(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType;
			
			用来改变每个引导页切换
			 -(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex;