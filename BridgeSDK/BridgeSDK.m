//
//  BridgeSDK.m
//  BridgeSDK
//
//  Created by Erin Mounts on 9/16/14.
//
//	Copyright (c) 2014, Sage Bionetworks
//	All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted provided that the following conditions are met:
//	    * Redistributions of source code must retain the above copyright
//	      notice, this list of conditions and the following disclaimer.
//	    * Redistributions in binary form must reproduce the above copyright
//	      notice, this list of conditions and the following disclaimer in the
//	      documentation and/or other materials provided with the distribution.
//	    * Neither the name of Sage Bionetworks nor the names of BridgeSDk's
//		  contributors may be used to endorse or promote products derived from
//		  this software without specific prior written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//	DISCLAIMED. IN NO EVENT SHALL SAGE BIONETWORKS BE LIABLE FOR ANY
//	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "BridgeSDK.h"
#import "SBBAuthManagerInternal.h"
#import "SBBCacheManager.h"

const NSInteger SBBDefaultCacheDaysAhead = 4;
const NSInteger SBBDefaultCacheDaysBehind = 7;
const NSInteger SBBMaxSupportedCacheDays = 30;

@implementation BridgeSDK

+ (void)setupWithBridgeInfo:(id <SBBBridgeInfoProtocol>)bridgeInfo {
    // TODO: syoung 01/18/2017 Keep a pointer to the bridge info protocol
    [self setupWithStudy:bridgeInfo.studyIdentifier cacheDaysAhead:bridgeInfo.cacheDaysAhead cacheDaysBehind:bridgeInfo.cacheDaysBehind environment:bridgeInfo.environment];
}

+ (void)setupWithStudy:(NSString *)study
{
    [self setupWithStudy:study cacheDaysAhead:0 cacheDaysBehind:0 environment:gDefaultEnvironment];
}

+ (void)setupWithStudy:(NSString *)study useCache:(BOOL)useCache
{
    NSInteger cacheDaysAhead = useCache ? SBBDefaultCacheDaysAhead : 0;
    NSInteger cacheDaysBehind = useCache ? SBBDefaultCacheDaysBehind : 0;
    [self setupWithStudy:study cacheDaysAhead:cacheDaysAhead cacheDaysBehind:cacheDaysBehind environment:gDefaultEnvironment];
}

+ (void)setupWithAppPrefix:(NSString *)appPrefix
{
    [self setupWithStudy:appPrefix];
}

+ (void)setupWithStudy:(NSString *)study environment:(SBBEnvironment)environment
{
    [self setupWithStudy:study cacheDaysAhead:0 cacheDaysBehind:0 environment:environment];
}

+ (void)setupWithStudy:(NSString *)study useCache:(BOOL)useCache environment:(SBBEnvironment)environment
{
    NSInteger cacheDaysAhead = useCache ? SBBDefaultCacheDaysAhead : 0;
    NSInteger cacheDaysBehind = useCache ? SBBDefaultCacheDaysBehind : 0;
    [self setupWithStudy:study cacheDaysAhead:cacheDaysAhead cacheDaysBehind:cacheDaysBehind environment:environment];
}

+ (void)setupWithStudy:(NSString *)study cacheDaysAhead:(NSInteger)cacheDaysAhead cacheDaysBehind:(NSInteger)cacheDaysBehind
{
    [self setupWithStudy:study cacheDaysAhead:cacheDaysAhead cacheDaysBehind:cacheDaysBehind environment:gDefaultEnvironment];
}

+ (void)setupWithStudy:(NSString *)study cacheDaysAhead:(NSInteger)cacheDaysAhead cacheDaysBehind:(NSInteger)cacheDaysBehind environment:(SBBEnvironment)environment
{
    gSBBAppStudy = study;
    gSBBDefaultEnvironment = environment;
    gSBBUseCache = cacheDaysAhead > 0 || cacheDaysBehind > 0;
    gSBBCacheDaysAhead = MIN(SBBMaxSupportedCacheDays, cacheDaysAhead);
    gSBBCacheDaysBehind = MIN(SBBMaxSupportedCacheDays, cacheDaysBehind);
    
    // make sure the Bridge network manager is set up as the delegate for the background session
    [SBBComponent(SBBBridgeNetworkManager) restoreBackgroundSession:kBackgroundSessionIdentifier completionHandler:nil];
}

+ (void)setupWithAppPrefix:(NSString *)appPrefix environment:(SBBEnvironment)environment
{
    [self setupWithStudy:appPrefix environment:environment];
}

@end
