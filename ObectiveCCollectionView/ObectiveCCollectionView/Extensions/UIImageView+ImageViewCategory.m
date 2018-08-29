//
//  UIImageView+ImageViewCategory.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "UIImageView+ImageViewCategory.h"

@implementation UIImageView (ImageViewCategory)
+(void) loadImageFromUrl: (NSString *) urlString completion: (CompletionBlock) completionBlock {
    
    
    NSURL *url = [NSURL URLWithString: urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: url];
    
    [[NSURLSession.sharedSession dataTaskWithRequest: urlRequest completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error) {
            completionBlock([UIImage imageNamed: @"beerPlaceHolderImage"]);
        } else {
           completionBlock([UIImage imageWithData: data]);
        }
    }] resume];
}
@end
