//
//  UIImageView+ImageViewCategory.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CompletionBlock)(UIImage *);

@interface UIImageView (ImageViewCategory)
+(void) loadImageFromUrl: (NSString *) urlString completion: (CompletionBlock) completionBlock;
@end
