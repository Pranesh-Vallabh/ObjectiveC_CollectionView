//
//  BeerListViewModel.m
//  ObectiveCCollectionViewTests
//
//  Created by Pranesh on 2018/08/30.
//  Copyright © 2018 Pranesh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "BeerListViewable.h"
#import "RepositoryNetworkable.h"
#import "Beer.h"
#import "ViewModel.h"

@interface BeerListViewModelTests : XCTestCase

@end

@implementation BeerListViewModelTests

id mockBeerListView;
id mockNetworkRepository;
ViewModel *systemUnderTests;
XCTestExpectation *expectation;

- (void)setUp {
    [super setUp];
    expectation = [self expectationWithDescription:@"BeerListViewModel Expectation"];
    mockBeerListView = OCMProtocolMock(@protocol(BeerListViewable));
    mockNetworkRepository = OCMProtocolMock(@protocol(RepositoryNetworkable));
    systemUnderTests = [[ViewModel alloc] initViewModel:mockBeerListView withNetworkRepository:mockNetworkRepository];
}

- (void)tearDown {
    systemUnderTests = nil;
    expectation = nil;
    [super tearDown];
}

- (void) testGivenAViewAndNetworkRepositoryWhenGetBeerDataIsCalledItReturnsSuccessfully {

    NSMutableArray<Beer *> *beers = [self mockPunkApiResponseWithBeerObject];
    [self setUpStubsForBeerListViewableProtcol];
    OCMStub([mockNetworkRepository fetchData: [OCMArg any]])._andDo(^(NSInvocation *invocation) {
        void (^completionBlock)(NSMutableArray<Beer *> *beers, NSError *error);
        [invocation getArgument:&completionBlock atIndex:2];
        completionBlock(beers,nil);
    });
    
    [systemUnderTests getBeerData];
    [self waitForExpectationsWithTimeout:20 handler:^(NSError * _Nullable error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    OCMVerify([mockBeerListView showBeerList: beers]);
    OCMVerify([mockNetworkRepository fetchData: [OCMArg any]]);
    OCMReject([mockBeerListView showErrorMessage:[OCMArg any]]);
}

- (void) testGivenAViewAndNetworkRepositoryWhenGetBeerDataIsCalledItReturnsAnError {

    NSError *networkError = [self mockPunkApiResponseWithNSErrorObject];
    [self setUpStubsForBeerListViewableProtcol];
    
    OCMStub([mockNetworkRepository fetchData: [OCMArg any]])._andDo(^(NSInvocation *invocation) {
        void (^completionBlock)(NSMutableArray<Beer *> *beers, NSError *error);
        [invocation getArgument:&completionBlock atIndex:2];
        completionBlock(nil,networkError);
    });
    
    [systemUnderTests getBeerData];
    [self waitForExpectationsWithTimeout:20 handler:^(NSError * _Nullable error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    OCMVerify([mockBeerListView showErrorMessage: networkError.localizedDescription]);
    OCMVerify([mockNetworkRepository fetchData: [OCMArg any]]);
    OCMReject([mockBeerListView showBeerList:[OCMArg any]]);
}

- (void) setUpStubsForBeerListViewableProtcol{
    
    OCMStub([mockBeerListView showErrorMessage:[OCMArg any]])._andDo(^(NSInvocation *invocation){
        [expectation fulfill];
    });
    OCMStub([mockBeerListView showBeerList:[OCMArg any]])._andDo(^(NSInvocation *invocation){
        [expectation fulfill];
    });
}

- (NSMutableArray<Beer *> *) mockPunkApiResponseWithBeerObject {
    Beer * beer = [[Beer alloc] init];
    beer.name = @"name";
    beer.tagline = @"tagline";
    beer.descriptions = @"descriptions";
    beer.imageUrl = @"imageUrl";
    NSMutableArray<Beer *> *beers = NSMutableArray.new;
    [beers addObject: beer];
    return beers;
}

- (NSError *) mockPunkApiResponseWithNSErrorObject {
    NSMutableDictionary* details = [NSMutableDictionary dictionary];
    [details setValue: @"error" forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"" code:200 userInfo:details];
    return error;
}

@end
