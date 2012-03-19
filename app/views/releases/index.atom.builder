atom_feed do |feed|
  feed.title "SublimeVideo Releases"
  feed.updated @releases.first.datetime
  feed.author do |author|
    author.name("Jilion")
    author.email("info@jilion.com")
  end

  @releases.each do |release|
    feed.entry("releases", id: release.datetime.to_i, url: "#{releases_url}##{l(release.datetime, format: :permalink)}") do |entry|
      entry.title(l(release.datetime, format: :feed_title))
      entry.content(release.atom_content, type: 'html')
      entry.updated(l(release.datetime, format: "%Y-%m-%dT%H:%M:%SZ")) # needed to work with Google Reader.
      entry.author do |author|
        author.name("Jilion")
        author.email("info@jilion.com")
      end
    end
  end
end
