//
//  CacheImage.swift
//  FeedStoreChallenge
//
//  Created by Livia Vasconcelos on 19/06/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(CacheImage)
internal class CacheImage: NSManagedObject {
	@NSManaged internal var id: UUID
	@NSManaged internal var imageDescription: String?
	@NSManaged internal var location: String?
	@NSManaged internal var url: URL
	@NSManaged internal var cache: Cache
}

extension CacheImage {
	internal var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}
}
