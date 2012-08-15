module Page

  MENU_PAGE_TITLES = {
    "quickstart-guide" => "Quickstart Guide",
    "write-proper-video-elements" => "Write <video> elements",
    "encode-videos-for-the-web" => "Video encoding",
    "create-poster-frame" => "Create poster frame",
    "lightbox" => "Floating lightbox",
    "hd-switching" => "HD switching",
    "customizing-the-initial-play-button" => "Custom play button",
    "autoplay-video-upon-page-load" => "Autoplay a video",
    "returning-to-the-initial-state-once-video-playback-ends" => "Back to initial state on end",
    "optimize-for-stats" => "Optimize <video> for stats",
    "ssl" => "SSL Serving",
    "video-code-generator" => "Video code generator",
    "wordpress" => "WordPress plugin",
    "real-time-stats" => "Real-Time Statistics",
    "peak-insurance" => "Peak insurance",
    "site-settings" => "Site settings",
    "faq" => "FAQ",
    "supported-browsers-and-platforms" => "Supported platforms",
    "releases" => "Release Notes"
  }

  def self.menu_title(permalink)
    MENU_PAGE_TITLES.fetch(permalink, permalink.split('/').last.gsub('-', ' ').humanize)
  end

end
