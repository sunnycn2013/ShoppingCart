//
//  BaseAPI.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "BaseAPI.h"

@interface BaseAPI ()

@property (nonatomic,strong) AFHTTPSessionManager *manager;
@property (nonatomic,copy) void (^successBlock)(NSDictionary *content);
@property (nonatomic,copy) void (^failureBlock)(NSError *error);
@end

@implementation BaseAPI

- (NSString *)serverURL
{
    return @"";
}

- (NSString *)functionID
{
    return @"";
}

- (NSDictionary *)params
{
    return @{};
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(NSDictionary *content))success
                                    failure:(void (^)(NSError *error))failure
{
    self.successBlock = success;
    self.failureBlock = failure;
}

- (void)start
{
    [self.manager GET:self.serverURL
           parameters:self.params
              success:^(NSURLSessionDataTask *task, id responseObject){
                  NSError *error = nil;
                  NSDictionary *contents = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                           options:NSJSONReadingMutableLeaves
                                                                             error:&error];
                  if (_successBlock) {
                      _successBlock(contents);
                  }
              }
              failure:^(NSURLSessionDataTask *task, NSError *error){
                  if (error) {
                      _failureBlock(error);
                  }
             }];
}

- (void)stop
{
    
}

#pragma mark - set get
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
@end
