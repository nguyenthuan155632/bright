class PlayController < ApplicationController
  before_action :customize_params, only: [:game]

  def options
  end

  def game
    @words = Dictionary.includes(:categories)
                       .where(categories: { name: strong_params[:categories].split(',') })
                       .where(alphabet_query)
                       .order(Arel.sql('RANDOM()'))[0, strong_params[:numeric].to_i]
  end

  private

  def en_dict?
    strong_params[:dictionary] == 'en-vi'
  end

  def alphabet_query
    alphabet = [*(strong_params[:alphabet].split('-')[0]..strong_params[:alphabet].split('-')[1])]
    alphabet.map do |ab|
      "dictionaries.#{en_dict? ? 'english' : 'vietnamese_unsigned'} LIKE '#{ab}%'"
    end.join(' OR ')
  end

  def customize_params
    params[:alphabet] = params[:alphabet] == 'all' ? 'a-z' : params[:alphabet]
    params[:numeric] = params[:numeric] == 'all' ? '10000' : params[:numeric]
  end

  def strong_params
    params.permit(:dictionary, :categories, :alphabet, :numeric)
  end
end
