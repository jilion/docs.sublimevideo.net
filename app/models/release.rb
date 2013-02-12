Release = Struct.new(:version, :datetime, :content) do

  def self.all(stage = 'stable')
    base_path = Rails.root.join('app', 'views', 'releases', stage)

    base_path.entries.inject([]) do |releases, file_path|
      if release_attributes = detect_beta_release(file_path) || detect_stable_release(file_path)
        releases << new(*release_attributes, release_content(base_path, file_path))
      end
      releases
    end.sort_by { |r| r.datetime }
  end

  def self.detect_stable_release(file_path)
    if matches = file_path.to_s.match(/([0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}:[0-9]{2})\.textile/)
      [nil, DateTime.parse(matches[1])]
    end
  end

  def self.detect_beta_release(file_path)
    if matches = file_path.to_s.match(/([0-9]{4}-[0-9]{2}-[0-9]{2})-([0-9]{2})([0-9]{2})-([a-z0-9\-\.]+)\.textile/)
      [matches[4], DateTime.parse("#{matches[1]}-#{matches[2]}:#{matches[3]}")]
    end
  end

  def self.release_content(base_path, file_path)
    RedCloth.new(File.new(base_path.join(file_path)).read).to_html.html_safe
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
