//
//  ViewController.m
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray <Beer *> *beers;
@end

@implementation ViewController

NSString *cellId = @"cellId";

@synthesize collectionView;
@synthesize viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Beers List";
    self.navigationController.navigationBar.prefersLargeTitles = TRUE;
    viewModel = [[ViewModel alloc] initViewModel: self];
    [self getBeerData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.beers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BeerCollectionViewCell *cell = (BeerCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell setupCell: self.beers[indexPath.item]];
    return cell;
}

-(void) getBeerData {
    [viewModel getBeerData];
}
-(void) showErrorMessage: (NSString *) errorMessage {
    NSLog(@"Error: %@",errorMessage);
}
-(void) showBeerList: (NSMutableArray<Beer *>*) beers {
    self.beers = beers;
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showDetails"]) {
        
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        DetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex: 0];
        destViewController.beer = [self.beers objectAtIndex:indexPath.item];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width/2 - 60, self.view.frame.size.height/3);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end

