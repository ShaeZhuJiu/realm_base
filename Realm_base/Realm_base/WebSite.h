//
//  WebSite.h
//  Realm_base
//
//  Created by 谢鑫 on 2019/8/20.
//Copyright © 2019 Shae. All rights reserved.
//

#import <Realm/Realm.h>

@interface WebSite : RLMObject
@property NSString *webName;
@property NSString *html;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<WebSite *><WebSite>
RLM_ARRAY_TYPE(WebSite)
