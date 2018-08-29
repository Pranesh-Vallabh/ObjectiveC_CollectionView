//
//  BeerListViewable.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

@protocol BeerListViewable <NSObject>
-(void) getBeerData;
-(void) showErrorMessage: (NSString *) errorMessage;
-(void) showBeerList: (NSMutableArray<Beer *>*) beers;
@end
