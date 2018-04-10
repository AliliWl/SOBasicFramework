

#import "UIImageView+SOImageView.h"
@implementation UIImageView (SOImageView)


- (void)so_setImage:(NSURL*)imgUrl placeholderImage:(UIImage*)placeholderImage;
{
    [self sd_setImageWithURL:imgUrl placeholderImage:placeholderImage];
}
- (void)so_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;
{
    [self sd_setImageWithPreviousCachedImageWithURL:url placeholderImage:placeholder options:0 progress:progressBlock completed:completedBlock];
}
- (void)so_cancelCurrentImageLoad;
{
    [self sd_cancelCurrentImageLoad];
}
@end
