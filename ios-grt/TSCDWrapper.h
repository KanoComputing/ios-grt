//
//  TSCDWrapper.h
//  ios-grt
//
//  Created by Radek Pazdera on 01/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifndef TSCDWrapper_h
#define TSCDWrapper_h

#ifdef __cplusplus
#include "GRT.h"
#endif

#import "MatrixFloat.h"

@interface TSCDWrapper: NSObject
+ (NSMutableDictionary *) instances;
+ (NSString *) create;
+ (void) destroy:(NSString *) instanceId;
+ (void) destroyAll;

+ (TSCDWrapper *) getFromId:(NSString *) instanceId;

- (id) initWithId:(NSString *) instanceId;
- (void) dealloc;

#ifdef __cplusplus
- (GRT::TimeSeriesClassificationData *) getCppInstance;
#endif

//----

- (void) setInfoText:(NSString *) text;
- (NSString *) getInfoText;

- (void) setNumDimensions:(unsigned int) n;
- (unsigned int) getNumDimensions;

- (unsigned int) getNumSamples;
- (BOOL) addSample:(unsigned int) label withMatrix:(MatrixFloat *) matrix;
@end

#endif /* TSCDWrapper_h */
