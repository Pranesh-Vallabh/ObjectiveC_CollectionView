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
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error) {
            completionBlock(nil, error);
            return;
        }
       
        NSError *jsonError;
        NSArray *beerJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &jsonError];
        if(jsonError) {
            NSLog(@"Failed to serialized into JSON: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        NSMutableArray<Beer*> *beers = NSMutableArray.new;
        for(NSDictionary *beerDictionary in beerJSON) {
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
        
        completionBlock(beers, nil);
        
    }] resume];
}
@end
