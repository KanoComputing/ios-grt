//
//  VectorFloat.h
//  ios-grt
//
//  Created by Radek Pazdera on 01/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifndef VectorFloat_h
#define VectorFloat_h

#ifdef __cplusplus
#include "GRT.h"
#endif

@interface VectorFloat: NSObject
- (id)initWithSize:(unsigned int) size;

#ifdef __cplusplus
- (id)initWithGRTVector:(GRT::VectorFloat *) vector;
- (GRT::VectorFloat *) getCppInstance;
#endif

- (void) dealloc;

- (void) clear;
- (BOOL) push_back:(float) value;

- (NSArray *) toNSArray;
@end

#endif /* VectorFloat_h */
