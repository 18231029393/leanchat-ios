//
//  CDAbuseReport.h
//  LeanChat
//
//  Created by lzw on 15/4/29.
//  Copyright (c) 2015年 AVOS. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

@interface CDAbuseReport : AVObject<AVSubclassing>

@property (nonatomic,strong) NSString *reason;

@property (nonatomic,strong) NSString *convid;

@property (nonatomic,strong) AVUser *author;

@end
