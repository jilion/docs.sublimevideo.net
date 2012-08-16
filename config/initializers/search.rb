require_dependency 'search'
require_dependency 'search/index_tank_wrapper'

Search.wrapper = Search::IndexTankWrapper
