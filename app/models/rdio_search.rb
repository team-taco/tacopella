class RdioSearch
  RDIO_KEY = 'nwqk6482vnzn47ph332m5e6v'
  RDIO_SECRET = 'TxxUNrJC3v'

  attr_accessor :search_results

  def initialize(search_q)
    #api = Rdio::Api.new('nwqk6482vnzn47ph332m5e6v', 'TxxUNrJC3v')
    @search_results = search_q
  end

  def as_json(option = {})
    @search_results.map do |result|
      {
        key: result.key,
        name: result.name,
        artist: result.artist_name
      }
    end
  end

end
