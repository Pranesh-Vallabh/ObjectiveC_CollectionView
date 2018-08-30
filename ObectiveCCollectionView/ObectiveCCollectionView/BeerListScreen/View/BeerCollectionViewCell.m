//
//  BeerCollectionViewCell.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "BeerCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation BeerCollectionViewCell

@synthesize beerImage;
@synthesize beerNameLabel;

-(void) setupCell: (Beer *) beer {
    
    [beerImage setImageWithURL: [NSURL URLWithString: beer.imageUrl]
               placeholderImage: [UIImage imageNamed:@"beerPlaceHolderImage"]];
    /*[UIImageView loadImageFromUrl: beer.imageUrl completion:^(UIImage * image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self->beerImage.image = image;
        });
    }];*/
    beerNameLabel.text = beer.name;
}

@end
