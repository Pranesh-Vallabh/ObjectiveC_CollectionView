//
//  DetailViewController.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize beer;
@synthesize name;
@synthesize descriptions;
@synthesize tagline;
@synthesize beerImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = FALSE;
    if(beer) {
        name.text = beer.name;
        descriptions.text = beer.descriptions;
        tagline.text = beer.tagline;
        [UIImageView loadImageFromUrl: beer.imageUrl completion:^(UIImage * image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self->beerImage.image = image;
            });
        }];
    }
}

@end
