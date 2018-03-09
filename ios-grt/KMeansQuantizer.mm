//
//  KMeansQuantizer.m
//  ios-grt
//
//  Created by Radek Pazdera on 07/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifdef __cplusplus
#include "GRT.h"
#endif

#import <Foundation/Foundation.h>
#import "KMeansQuantizer.h"

@implementation KMeansQuantizerWrapper: NSObject {
    NSString *instanceId;
    GRT::KMeansQuantizer *instance;
}

static NSMutableDictionary *instances = [[NSMutableDictionary alloc] init];

+ (NSString *) create {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    instances[uuid] = [[KMeansQuantizerWrapper alloc] initWithId: uuid];
    return uuid;
}

+ (void) destroy:(NSString *) instanceId {
    //[instances[instanceId] dealloc];
    [instances removeObjectForKey:instanceId];
}

+ (void) destroyAll {
    NSArray *keys = [instances allKeys];
    for (int i = 0 ; i < [keys count]; i++)
    {
        if ([instances[keys[i]] isKindOfClass:[KMeansQuantizerWrapper class]])
        {
            [self destroy: keys[i]];
        }
    }
}

+ (KMeansQuantizerWrapper *) getFromId:(NSString *) instanceId {
    return instances[instanceId];
}


- (id)initWithId: (NSString *) aInstanceId {
    if( self = [super init] )
    {
        instanceId = aInstanceId;
        instance = new GRT::KMeansQuantizer;
    }
    
    return self;
}

- (void) dealloc {
    delete instance;
}

//----

- (BOOL) train:(TSCDWrapper *) sample {
    return instance->train(*[sample getCppInstance]);
}

- (BOOL) setNumClusters:(unsigned int) n {
    return instance->setNumClusters(n);
}

- (VectorFloat *) getFeatureVector {
    GRT::VectorFloat vector = instance->getFeatureVector();
    return [[VectorFloat alloc] initWithGRTVector:&vector];
}

- (BOOL) clear {
    return instance->clear();
}

- (unsigned int) quantize:(VectorFloat *) vector {
    return instance->quantize(*[vector getCppInstance]);
}

@end

