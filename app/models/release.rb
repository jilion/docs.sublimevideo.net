Release = Struct.new(:version, :datetime, :content) do

  def self.all(stage = 'stable')
    path = Rails.root.join('app', 'views', 'releases', stage)
    path.entries.inject([]) do |releases, file_path|
      case stage
      when 'stable'
        if matches = file_path.to_s.match(/([0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}:[0-9]{2})\.textile/)
          releases << new(
            nil,
            DateTime.parse(matches[1]),
            RedCloth.new(File.new(path.join(file_path)).read).to_html.html_safe
          )
        end
      when 'beta'
        if matches = file_path.to_s.match(/([0-9]{4}-[0-9]{2}-[0-9]{2})-([0-9]{2})([0-9]{2})-([a-z0-9\-\.]+)\.textile/)
            releases << new(
              matches[4],
              DateTime.parse("#{matches[1]}-#{matches[2]}:#{matches[3]}"),
              RedCloth.new(File.new(path.join(file_path)).read).to_html.html_safe
            )
          end
        end
      releases
    end.sort_by { |r| r.datetime }
  end

  def atom_content
    content.to_str.split("\n").each do |line|
      line.sub!(%r{<span\s+class="label\s+[a-z]+">([a-z]+)</span>}) { "[#{$1.try(:upcase)}]" }
    end.join("\n")
  end

  # ===========
  # = Caching =
  # ===========

  def updated_at
    datetime
  end

  def cache_key
    "release-#{datetime}"
  end

end
