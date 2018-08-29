//
//  ViewModel.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "ViewModel.h"
#import "ViewController.h"
@implementation ViewModel

@synthesize viewController;

-(instancetype) initViewModel: (ViewController *) viewControllers {
    self = [super init];
    if (self) {
        self.viewController = viewControllers;
    }
    return self;
}

-(void) getBeerData {
    NetworkRepository *networkRepository = [[NetworkRepository alloc] init];
     [networkRepository fetchData: ^(NSMutableArray<Beer *> * beers, NSError * error) {
         dispatch_async(dispatch_get_main_queue(), ^{
             if(error){
                 [self.viewController showErrorMessage: error.localizedDescription];
                 return;
             }
             else if(beers) {
                 [self.viewController showBeerList:beers];
                 return;
             }
         });
     }];
}
@end
