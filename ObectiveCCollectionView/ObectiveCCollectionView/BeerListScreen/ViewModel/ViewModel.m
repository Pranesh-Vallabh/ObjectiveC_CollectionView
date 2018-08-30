//
//  ViewModel.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

@synthesize beerListView;

-(instancetype) initViewModel: (id<BeerListViewable>) beerListView withNetworkRepository: (id<RepositoryNetworkable>) networkRepository {
    self = [super init];
    if (self) {
        self.beerListView = beerListView;
        self.networkRepository = networkRepository;
    }
    return self;
}

-(void) getBeerData {
    [self.networkRepository fetchData: ^(NSMutableArray<Beer *> * beers, NSError * error) {
         dispatch_async(dispatch_get_main_queue(), ^{
             if(error){
                 [self->beerListView showErrorMessage: error.localizedDescription];
             }
             else if(beers) {
                 [self.beerListView showBeerList:beers];
             }
        });
     }];
}
@end
