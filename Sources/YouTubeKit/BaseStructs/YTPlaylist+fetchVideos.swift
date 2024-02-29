//
//  YTPlaylist+fetchVideos.swift
//
//
//  Created by Antoine Bollengier on 17.10.2023.
//

import Foundation

public extension YTPlaylist {
    /// Fetch the ``PlaylistInfosResponse`` related to the playlist.
    func fetchVideos(youtubeModel: YouTubeModel, useCookies: Bool? = nil, result: @escaping (Result<PlaylistInfosResponse, Error>) -> Void) {
        PlaylistInfosResponse.sendRequest(youtubeModel: youtubeModel, data: [.browseId: self.playlistId], useCookies: useCookies, result: result)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    /// Fetch the ``PlaylistInfosResponse`` related to the playlist.
    func fetchVideos(youtubeModel: YouTubeModel, useCookies: Bool? = nil) async throws -> PlaylistInfosResponse {
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<PlaylistInfosResponse, Error>) in
            fetchVideos(youtubeModel: youtubeModel, useCookies: useCookies, result: { response in
                continuation.resume(with: response)
            })
        })
    }
}
