class ProductsController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    query = <<~GRAPHQL
    query{
      products{
        id
        title
      }
    }
    GRAPHQL
    
    response = MyGraphQLClient.query(query)

    if response.data
      @data = response.data.someData
    else
      @data = nil
    end
  end
end
