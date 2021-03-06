# largely from https://github.com/aki017/slack-ruby-gem
require 'json-schema'
require 'erubis'

namespace :slack do
  namespace :web do
    namespace :api do
      # update slack-api-ref from https://github.com/dblock/slack-api-ref
      task :git_update do
        sh 'git submodule update --init --recursive'
        sh 'git submodule foreach git pull origin master'
      end

      desc 'Update API.'
      task update: [:git_update] do
        method_schema = JSON.parse(File.read('lib/slack/web/api/schema/method.json'))
        data = Dir.glob('lib/slack/web/api/slack-api-ref/methods/*.json').each_with_object({}) do |path, result|
          name = File.basename(path, '.json')
          prefix, name = name.split('.')
          result[prefix] ||= {}
          parsed = JSON.parse(File.read(path))
          JSON::Validator.validate(method_schema, parsed, insert_defaults: true)
          result[prefix][name] = parsed
        end

        method_template = Erubis::Eruby.new(File.read('lib/slack/web/api/templates/method.erb'))
        data.each_with_index do |(group, names), index|
          printf "%2d/%2d %10s %s\n", index, data.size, group, names.keys
          File.write "lib/slack/web/api/endpoints/#{group}.rb", method_template.result(group: group, names: names)
        end

        endpoints_template = Erubis::Eruby.new(File.read('lib/slack/web/api/templates/endpoints.erb'))
        File.write 'lib/slack/web/api/endpoints.rb', endpoints_template.result(files: data.keys)
      end
    end
  end
end
