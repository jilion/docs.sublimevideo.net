class SearchKeyword
  include Mongoid::Document

  field :k, type: String
  field :c, type: Integer, default: 0 # searches count

  index({ k: 1 }, { unique: true })
  index({ c: -1 })

  validates :k, presence: true, uniqueness: true

  def self.increment(keyword)
    Librato.increment 'docs.search'
    sk = create(k: keyword) unless sk = where(k: keyword).first
    sk.inc(c: 1)
  end

  def self.ranking
    order_by(:c.desc).entries.inject("") { |text, sk| text += "#{sk.k}: #{sk.c}\n"; text }
  end

end
