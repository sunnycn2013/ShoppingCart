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
    return @{@"key1":@"val1"};
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(NSDictionary *content))success
                                    failure:(void (^)(NSError *error))failure
{
    self.successBlock = success;
    self.failureBlock = failure;
    [self start];
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
                      _successBlock(@{@"content":@"1"});
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
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",
                                                                            @"application/json",
                                                                                   @"text/json",
                                                                             @"text/javascript",
                                                              nil];//设置相应内容类型
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _manager;
}
@end
