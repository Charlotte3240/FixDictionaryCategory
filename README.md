# FixDictionaryCategory
    NSString *string = nil;
    NSDictionary *dic = @{
                          string:@"first key",
                          @"testkey":@"testObject",
                          @"last object":string
                          };
    NSLog(@"dic is %@",dic);
    
    
    
---

	```
	2016-08-29 16:20:40.188 FixDictionary[16620:537697] CharlotteTip : key is nil(object is “first key”)
	2016-08-29 16:20:40.189 FixDictionary[16620:537697] CharlotteTip : object is nil(key is “last object”)
	2016-08-29 16:20:40.189 FixDictionary[16620:537697] fixd dictionary is {
	    testkey = testObject;
	}
	2016-08-29 16:20:40.189 FixDictionary[16620:537697] dic is {
	    testkey = testObject;
	}

	```    