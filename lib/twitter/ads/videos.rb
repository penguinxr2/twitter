require 'twitter/ads/utils'
require 'twitter/error'
require 'twitter/promoted_tweet'
require 'twitter/rest/request'
require 'twitter/settings'
require 'twitter/tweet'
require 'twitter/video'
require 'twitter/utils'

module Twitter
  module Ads
    module Videos
      include Twitter::Ads::Utils
      include Twitter::Utils

      # Retrieve references to videos associated with an account and optionally
      # specific line items
      #
      # @see https://dev.twitter.com/ads/reference/get/accounts/%3Aaccount_id/videos
      # @rate_limited Yes
      # @authentication Requires user context
      # @raise [Twitter::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Twitter::Video>]
      # @param account_id [String] Ads account id.  # @param options [Hash] customizeable options.
      # @option options [String] :line_item_id Restrict listing to accounts associated to the specified line item.
      # @option options [Boolean] :with_deleted Set to true if you want deleted funding instruments to be returned.
      def videos(account_id, options = {})
        perform_get_with_cursor("https://ads-api.twitter.com/0/accounts/#{account_id}/videos",
                                 options, :data, Twitter::Video)
      end

      # Videos in association with a specified line item
      #
      # @see https://dev.twitter.com/ads/reference/get/accounts/%3Aaccount_id/videos/%3Aid
      # @rate_limited Yes
      # @authentication Requires user context
      # @raise [Twitter::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return Twitter::Video
      # @param account_id [String] Ads account id.
      # @param with_deleted [Boolean] Include deleted results in your request. Defaults to false.

      def video(account_id, video_id, options = {})
        perform_get_with_object("https://ads-api.twitter.com/0/accounts/#{account_id}/videos/#{video_id}",
                                  options, Twitter::Video)

      end

      # Promote tweets in association with a specified line item
      #
      # @see https://dev.twitter.com/ads/reference/post/accounts/%3Aaccount_id/videos
      # @rate_limited Yes
      # @authentication Requires user context
      # @raise [Twitter::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return Array<Twitter::Video>
      # @param account_id [String] Ads account id.
      def create_video(account_id, video_media_id, options = {})
        options = options.merge(video_media_id: video_media_id)
        perform_post_with_object("https://ads-api.twitter.com/0/accounts/#{account_id}/videos",
                                  options, Twitter::Video)

      end
    end
  end
end
