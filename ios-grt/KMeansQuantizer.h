//
//  KMeansQuantizer.h
//  ios-grt
//
//  Created by Radek Pazdera on 07/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifndef KMeansQuantizer_h
#define KMeansQuantizer_h

#import "TSCDWrapper.h"
#import "VectorFloat.h"

/*
 KMeansQuantizer
  setNumClusters(n)
  train(sample)
  quantize(data)
  getFeatureVector()
  clear()
 */

@interface KMeansQuantizerWrapper : NSObject
+ (NSMutableDictionary *) instances;
+ (NSString *) create;
+ (void) destroy:(NSString *) instanceId;
+ (void) destroyAll;

+ (KMeansQuantizerWrapper *) getFromId:(NSString *) id;

- (id) initWithId:(NSString *) instanceId;
- (void) dealloc;

//----

- (BOOL) train:(TSCDWrapper *) sample;
- (BOOL) setNumClusters:(unsigned int) n;
- (VectorFloat *) getFeatureVector;
- (BOOL) clear;
- (unsigned int) quantize:(VectorFloat *) vector;

@end

#endif /* KMeansQuantizer_h */
