//
//  ViewModel.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "NetworkRepository.h"
#include "BeerListViewable.h"
@class ViewController;

@interface ViewModel : NSObject

@property (weak, nonatomic) ViewController *viewController;
-(instancetype) initViewModel: (ViewController *) viewControllers;
-(void) getBeerData;

@end
