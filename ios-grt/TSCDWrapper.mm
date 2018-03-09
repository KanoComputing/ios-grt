//
//  TSCDWrapper.mm
//  ios-grt
//
//  Created by Radek Pazdera on 01/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#include "GRT.h"
#endif

#import "TSCDWrapper.h"

@implementation TSCDWrapper: NSObject {
    NSString *instanceId;
    GRT::TimeSeriesClassificationData *instance;
}

static NSMutableDictionary *instances = [[NSMutableDictionary alloc] init];

+ (NSString *) create {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    instances[uuid] = [[TSCDWrapper alloc] initWithId: uuid];
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
        if ([instances[keys[i]] isKindOfClass:[TSCDWrapper class]])
        {
            [self destroy: keys[i]];
        }
    }
}

+ (TSCDWrapper *) getFromId:(NSString *) instanceId {
    return instances[instanceId];
}


- (id)initWithId: (NSString *) aInstanceId {
    if( self = [super init] )
    {
        instanceId = aInstanceId;
        instance = new GRT::TimeSeriesClassificationData;
    }

    return self;
}

- (void) dealloc {
    delete instance;
}

- (GRT::TimeSeriesClassificationData *) getCppInstance {
    return instance;
}

//----

- (void) setInfoText:(NSString *) text {
    instance->setInfoText([text UTF8String]);
}
- (NSString *) getInfoText {
    std::string infoText = instance->getInfoText();
    return [NSString stringWithUTF8String:infoText.c_str()];
}

- (void) setNumDimensions:(unsigned int) n {
    instance->setNumDimensions(n);
}

- (unsigned int) getNumDimensions {
    return instance->getNumDimensions();
}

- (unsigned int) getNumSamples {
    return instance->getNumSamples();
}

- (BOOL) addSample:(unsigned int) label withMatrix:(MatrixFloat *) matrix {
    return instance->addSample(label, *[matrix getCppInstance]);
}
@end
