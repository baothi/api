# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/articles routes' do
  it 'routes to articles#index' do
    # expect(get '/articles').to route_to(controller: 'articles', action: 'index')
    aggregate_failures do
      expect(get('/articles')).to route_to('articles#index')
      # expect(get('/articles?page[number]=3')).to(
      #   route_to('articles#index', page: { 'number' => '3' })
      # )
    end
  end

  it 'routes to articles#show' do
    expect(get('/articles/2')).to route_to('articles#show', id: '2')
  end
  
  it 'should route to articles create' do
    expect(post '/articles').to route_to('articles#create')
  end

  it 'should route to articles update' do
    expect(put '/articles/1').to route_to('articles#update', id: '1')
    expect(patch '/articles/1').to route_to('articles#update', id: '1')
  end

  it 'should route to articles destroy' do
    expect(delete '/articles/1').to route_to('articles#destroy', id: '1')
  end
  
end
