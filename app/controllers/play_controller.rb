class PlayController < ApplicationController
  before_action :customize_params, only: [:game]

  def options
  end

  def game
    @words = if strong_params[:style] == 'random'
      Dictionary.order(Arel.sql('RANDOM()'))[0, strong_params[:numeric].to_i]
    elsif strong_params[:style] == 'newest'
      Dictionary.order(id: :desc)[0, strong_params[:numeric].to_i].shuffle
    elsif strong_params[:style] == 'least'
      Dictionary.order(:learning_count)[0, strong_params[:numeric].to_i].shuffle
    end
    update_learning(@words)
    game_index = start_game(@words)
    redirect_to play_path(id: game_index, index: 0)
  end

  def show
    @index = params[:index].to_i
    @scene = History.find(params[:id])
    @scene.update(finish_time: 0, status: :started, score: 0, right_words: nil, wrong_words: nil, created_at: Time.zone.now) if @index.zero?
    @word = Dictionary.find(@scene.words.split(',')[params[:index].to_i].to_i)
    @source_word = @scene.dict_type == 'en-vi' ? @word.english : @word.vietnamese
    @destination_word = @scene.dict_type == 'en-vi' ? @word.vietnamese : @word.english
  end

  def result
    scene = History.find(params[:scene])
    index = params[:index].to_i
    status = index == scene.words.split(',').length - 1 ? :finished : :started
    started_time = scene.created_at
    if params[:status] == 'true'
      score = scene.score + 1
      right_words = scene.right_words ? (scene.right_words.to_s + ',' + scene.words.split(',')[params[:index].to_i]) : (scene.words.split(',')[params[:index].to_i])
      scene.update(finish_time: (Time.zone.now - started_time).round, status: status, score: score, right_words: right_words)
    else
      wrong_words = scene.wrong_words ? (scene.wrong_words.to_s + ',' + scene.words.split(',')[params[:index].to_i]) : (scene.words.split(',')[params[:index].to_i])
      scene.update(finish_time: (Time.zone.now - started_time).round, status: status, wrong_words: wrong_words)
    end
  end

  def score
    @scene = History.find(params[:scene])
  end

  private

  def update_learning(words)
    words.each { |word| word.increment!(:learning_count) }
  end

  def start_game(words)
    History.create!(
      words: words.map(&:id).join(','),
      dict_type: strong_params[:dictionary],
      numeric: words.length,
      finish_time: 0,
      status: :started,
      score: 0,
    )
  end

  def customize_params
    params[:alphabet] = params[:alphabet] == 'all' ? 'a-z' : params[:alphabet]
    params[:numeric] = params[:numeric] == 'all' ? '10000' : params[:numeric]
  end

  def strong_params
    params.permit(:dictionary, :numeric, :style)
  end
end
