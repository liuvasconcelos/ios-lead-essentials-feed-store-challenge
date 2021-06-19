//
//  Cache.swift
//  FeedStoreChallenge
//
//  Created by Livia Vasconcelos on 19/06/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(Cache)
internal class Cache: NSManagedObject {
	@NSManaged internal var timestamp: Date
	@NSManaged internal var feed: NSOrderedSet
}

extension Cache {
	internal var localFeed: [LocalFeedImage] {
		return feed.compactMap { ($0 as? CacheImage)?.local }
	}
}
