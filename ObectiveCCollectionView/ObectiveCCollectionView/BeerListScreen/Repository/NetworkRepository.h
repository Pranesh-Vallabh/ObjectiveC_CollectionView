//
//  NetworkRepository.h
//  ObectiveCCollectionView
//
//  Created by Pranesh on 2018/08/29.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

typedef void (^NetworkCompletionBlock)(NSMutableArray<Beer *> *, NSError *);

@interface NetworkRepository : NSObject
-(void) fetchData: (NetworkCompletionBlock) completionBlock;
@end
