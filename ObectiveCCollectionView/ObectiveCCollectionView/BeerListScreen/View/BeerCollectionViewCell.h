//
//  BeerCollectionViewCell.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "UIImageView+ImageViewCategory.h"

@interface BeerCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *beerImage;
@property (weak, nonatomic) IBOutlet UILabel *beerNameLabel;

-(void) setupCell: (Beer *) beer;

@end
