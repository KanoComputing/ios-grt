//
//  MatrixFloat.h
//  ios-grt
//
//  Created by Radek Pazdera on 01/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifndef MatrixFloat_h
#define MatrixFloat_h

#import "VectorFloat.h"

@interface MatrixFloat: NSObject
- (id)initWithRows:(unsigned int) rows andColumns:(unsigned int) cols;

#ifdef __cplusplus
- (GRT::MatrixFloat *) getCppInstance;
#endif

- (void) dealloc;

- (BOOL) setRowVector:(VectorFloat *) row atIndex:(unsigned int) index;
- (BOOL) setColVector:(VectorFloat *) col atIndex:(unsigned int) index;
- (BOOL) push_back:(VectorFloat *) sample;
@end

#endif /* MatrixFloat_h */
