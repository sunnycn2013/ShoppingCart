//
//  BaseAPI.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestModel;
@interface BaseAPI : NSObject
{
    AFHTTPSessionManager *_manager;
    RequestModel         *_requestModel;
}

@property (nonatomic,strong,readonly) RequestModel *requestModel;

- (NSString *)serverURL;
- (NSString *)functionID;
- (NSDictionary *)params;

- (void)startWithCompletionBlockWithSuccess:(void (^)(NSDictionary *content))success
                                    failure:(void (^)(NSError *error))failure;
- (void)stop;

@end

@interface RequestModel : NSObject

@property (nonatomic,strong) NSString *serverURL;
@property (nonatomic,strong) NSString *functionID;
@property (nonatomic,strong) NSDictionary *params;

@end

