//
//  CDIMClient.h
//  LeanChat
//
//  Created by lzw on 15/1/21.
//  Copyright (c) 2015年 AVOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDCommon.h"

@interface CDIM : NSObject

@property AVIMClient* imClient;

+ (instancetype)sharedInstance;

-(void)open;

-(BOOL)isOpened;

- (void)close;

-(void)fecthConvWithId:(NSString*)convid callback:(AVIMConversationResultBlock)callback;

- (void)fetchConvWithUserId:(NSString *)userId callback:(AVIMConversationResultBlock)callback ;

-(void)fetchConvsWithIds:(NSSet*)convids callback:(AVIMArrayResultBlock)callback;

-(void)findGroupedConvsWithBlock:(AVArrayResultBlock)block;

-(void)setTypeOfConv:(AVIMConversation*)conv callback:(AVBooleanResultBlock)callback;

@end
