//
//  NetworkRepository.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "NetworkRepository.h"

@implementation NetworkRepository
-(void) fetchData: (NetworkCompletionBlock) completionBlock {
    
    NSString *urlString = @"https://api.punkapi.com/v2/beers";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: urlString parameters: nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON %@",responseObject);
        NSMutableArray<Beer*> *beers = NSMutableArray.new;
        for(NSDictionary *beerDictionary in responseObject) {
            Beer *beer = Beer.new;
            NSString *name = beerDictionary[@"name"];
            NSString *tagline = beerDictionary[@"tagline"];
            NSString *descriptions = beerDictionary[@"description"];
            NSString *imageUrl = beerDictionary[@"image_url"];
            
            beer.name = name;
            beer.tagline = tagline;
            beer.descriptions = descriptions;
            beer.imageUrl = imageUrl;
            [beers addObject: beer];
        }
        completionBlock(beers,nil);
    }
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@", error);
        completionBlock(nil,error);
    }];
}
@end
