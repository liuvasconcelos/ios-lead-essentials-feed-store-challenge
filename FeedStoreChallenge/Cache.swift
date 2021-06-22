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
		return feed.compactMap { ($0 as? CachedImage)?.local }
	}

	internal static func find(in context: NSManagedObjectContext) throws -> Cache? {
		guard let cacheEntityName = entity().name else { return nil }
		let request = NSFetchRequest<Cache>(entityName: cacheEntityName)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	internal static func newUniqueInstance(in context: NSManagedObjectContext) throws -> Cache {
		try find(in: context).map(context.delete)
		return Cache(context: context)
	}
}
