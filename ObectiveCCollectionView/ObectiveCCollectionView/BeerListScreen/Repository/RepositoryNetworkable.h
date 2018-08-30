//
//  RepositoryNetworkable.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/30.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

typedef void (^NetworkCompletionBlock)(NSMutableArray<Beer *> *, NSError *);
@protocol RepositoryNetworkable <NSObject>
-(void) fetchData: (NetworkCompletionBlock) completionBlock;
@end
