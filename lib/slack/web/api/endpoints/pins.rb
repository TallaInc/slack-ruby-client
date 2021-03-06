# This file was auto-generated by lib/slack/web/api/tasks/generate.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Pins
          #
          # This method pins an item (file, file comment, channel message, or group message) to a particular channel.
          # The channel argument is required and one of file, file_comment, or timestamp must also be specified.
          #
          # @option options [channel] :channel
          #   Channel to pin the item in.
          # @option options [file] :file
          #   File to pin.
          # @option options [Object] :file_comment
          #   File comment to pin.
          # @option options [Object] :timestamp
          #   Timestamp of the message to pin.
          # @see https://api.slack.com/methods/pins.add
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/pins.add.json
          def pins_add(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            post('pins.add', options)
          end

          #
          # This method lists the items pinned to a channel.
          #
          # @option options [channel] :channel
          #   Channel to get pinned items for.
          # @see https://api.slack.com/methods/pins.list
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/pins.list.json
          def pins_list(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            post('pins.list', options)
          end

          #
          # This method un-pins an item (file, file comment, channel message, or group message) from a channel.
          # The channel argument is required and one of file, file_comment, or timestamp must also be specified.
          #
          # @option options [channel] :channel
          #   Channel where the item is pinned to.
          # @option options [file] :file
          #   File to un-pin.
          # @option options [Object] :file_comment
          #   File comment to un-pin.
          # @option options [Object] :timestamp
          #   Timestamp of the message to un-pin.
          # @see https://api.slack.com/methods/pins.remove
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/pins.remove.json
          def pins_remove(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            post('pins.remove', options)
          end
        end
      end
    end
  end
end
