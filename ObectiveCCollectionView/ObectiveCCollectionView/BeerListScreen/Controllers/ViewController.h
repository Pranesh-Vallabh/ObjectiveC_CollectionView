//
//  ViewController.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "BeerCollectionViewCell.h"
#import "DetailViewController.h"
#import "BeerListViewable.h"
#import "ViewModel.h"

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, BeerListViewable>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) ViewModel *viewModel;

@end

