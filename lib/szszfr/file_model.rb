require 'json'
module Szszfr
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename

        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = JSON.parse(obj)
        puts @hash
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        begin
          FileModel.new("db/#{id}.json")
        rescue
          return nil
        end
      end

      def self.all
        files = Dir["db/*.json"]
        files.map {|file| FileModel.new file}
      end

      def self.create(attr)
        hash = {}
        hash[name] = attr['name'] || ''
        hash[github] = attr['github'] || ''

        files = Dir["db/*.json"]
        names = files.map{ |f| f.split("/")[-1] }
        highest = names.map { |b| b[0...-5].to_i }.max
        id = highest + 1

        File.open("db/quotes/#{id}.json", "w") do |f|
          f.write <<TEMPLATE
            {
              "name": "#{hash[name]}"
              "github": "#{hash[github]}"
            }
          TEMPLATE
        end

        FileModel.new "db/#{id}.json"
      end
    end
  end
end
