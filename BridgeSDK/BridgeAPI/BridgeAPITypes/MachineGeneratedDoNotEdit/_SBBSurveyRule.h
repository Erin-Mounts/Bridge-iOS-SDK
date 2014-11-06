//
//  SBBSurveyRule.h
//
//  $Id$
//
// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SBBSurveyRule.h instead.
//

#import <Foundation/Foundation.h>
#import "SBBBridgeObject.h"

@class SBBSurveyConstraints;

@protocol _SBBSurveyRule

@end

@interface _SBBSurveyRule : SBBBridgeObject

@property (nonatomic, strong) NSString* operator;

@property (nonatomic, strong) NSString* skipTo;

@property (nonatomic, strong) id value;

@property (nonatomic, strong, readwrite) SBBSurveyConstraints *surveyConstraints;

- (void) setSurveyConstraints: (SBBSurveyConstraints*) surveyConstraints_ settingInverse: (BOOL) setInverse;

@end
