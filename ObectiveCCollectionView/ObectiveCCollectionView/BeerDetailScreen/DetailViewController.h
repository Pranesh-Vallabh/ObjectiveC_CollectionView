//
//  DetailViewController.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "UIImageView+ImageViewCategory.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *beerImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptions;
@property (weak, nonatomic) IBOutlet UILabel *tagline;
@property (strong, nonatomic) Beer *beer;

@end
