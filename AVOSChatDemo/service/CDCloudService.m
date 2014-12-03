//
//  CloudService.m
//  AVOSChatDemo
//
//  Created by lzw on 14-10-24.
//  Copyright (c) 2014年 AVOS. All rights reserved.
//

#import "CDCloudService.h"
#import "CDUserService.h"

@implementation CDCloudService

+(void)callCloudRelationFnWithFromUser:(AVUser*)fromUser toUser:(AVUser*)toUser action:(NSString*)action callback:(AVIdResultBlock)callback{
    NSDictionary *dict=@{@"fromUserId":fromUser.objectId,@"toUserId":toUser.objectId};
    [AVCloud callFunctionInBackground:action withParameters:dict block:callback];
}

+(void)tryCreateAddRequestWithToUser:(AVUser*)toUser callback:(AVIdResultBlock)callback{
    AVUser* user=[AVUser currentUser];
    assert(user!=nil);
    NSDictionary* dict=@{@"fromUserId":user.objectId,@"toUserId":toUser.objectId};
    [AVCloud callFunctionInBackground:@"tryCreateAddRequest" withParameters:dict block:callback];
}

+(void)agreeAddRequestWithId:(NSString*)objectId callback:(AVIdResultBlock)callback{
    NSDictionary* dict=@{@"objectId":objectId};
    [AVCloud callFunctionInBackground:@"agreeAddRequest" withParameters:dict block:callback];
}

+(void)saveChatGroupWithId:(NSString*)groupId name:(NSString*)name callback:(AVIdResultBlock)callback{
    NSString* userId=[AVUser currentUser].objectId;
    assert(userId!=nil);
    NSDictionary* dict=@{@"groupId":groupId,@"ownerId":userId,@"name":name};
    [AVCloud callFunctionInBackground:@"saveChatGroup" withParameters:dict block:callback];
}

+(id)signWithPeerId:(NSString*)peerId watchedPeerIds:(NSArray*)watchPeerIds{
    if(watchPeerIds==nil){
        watchPeerIds=[[NSMutableArray alloc] init];
    }
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [dict setObject:peerId forKey:@"self_id"];
    [dict setObject:watchPeerIds forKey:@"watch_ids"];
    return [AVCloud callFunction:@"sign" withParameters:dict];
}

+(id)groupSignWithPeerId:(NSString*)peerId groupId:(NSString*)groupId groupPeerIds:(NSArray*)groupPeerIds action:(NSString*)action{
    NSMutableDictionary* dict=[@{@"self_id":peerId,@"group_id":groupId,@"action":action} mutableCopy];
    if(groupPeerIds!=nil){
        [dict setObject:groupPeerIds forKey:@"group_peer_ids"];
    }
    return [AVCloud callFunction:@"group_sign" withParameters:dict];
}

+(void)getQiniuUptokenWithCallback:(AVIdResultBlock)callback{
    [AVCloud callFunctionInBackground:@"qiniuUptoken" withParameters:nil block:callback];
}

@end
