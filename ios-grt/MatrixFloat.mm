//
//  MatrixFloat.m
//  ios-grt
//
//  Created by Radek Pazdera on 01/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#include "GRT.h"
#endif

#import "MatrixFloat.h"

@implementation MatrixFloat : NSObject {
    GRT::MatrixFloat *instance;
}

- (id) init {
    if( self = [super init] )
    {
        instance = new GRT::MatrixFloat;
    }
    
    return self;
}

- (id)initWithRows:(unsigned int) rows andColumns:(unsigned int) cols {
    if( self = [super init] )
    {
        instance = new GRT::MatrixFloat(rows, cols);
    }
    
    return self;
}

- (GRT::MatrixFloat *) getCppInstance {
    return instance;
}

- (void) dealloc {
    delete instance;
}

- (BOOL)setRowVector:(VectorFloat *) row atIndex:(unsigned int) index {
    return instance->setRowVector(*[row getCppInstance], index);
}

- (BOOL)setColVector:(VectorFloat *) col atIndex:(unsigned int) index {
    return instance->setColVector(*[col getCppInstance], index);
}

- (BOOL)push_back:(VectorFloat *) sample {
    GRT::VectorFloat *vf = [sample getCppInstance];
    return instance->push_back(*vf);
}
@end
