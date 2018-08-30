//
//  ViewModel.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryNetworkable.h"
#import "BeerListViewable.h"

@interface ViewModel : NSObject

@property (weak, nonatomic) id<BeerListViewable> beerListView;
@property id<RepositoryNetworkable> networkRepository;
-(instancetype) initViewModel: (id<BeerListViewable>) beerListView withNetworkRepository: (id<RepositoryNetworkable>) networkRepository;
-(void) getBeerData;

@end
