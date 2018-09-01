module ESpeak
  class Speech
    attr_reader :options, :text

    # filename - The file that will be generated
    # options  - Posible key, values
    #    :voice     - use voice file of this name from espeak-data/voices. ie 'en', 'de', ...
    #    :pitch     - pitch adjustment, 0 to 99
    #    :speed     - speed in words per minute, 80 to 370
    #    :capital   - increase emphasis of capitalized letters by raising pitch by this amount
    #                 no range given in man but good range is 10-40 to start
    #    :quiet     - remove printing to stdout. Affects only lame (default false)
    #
    def initialize(text, options={})
      @text = text
      @options = options
    end

    # Speaks text
    #
    def speak
      IO.popen(espeak_command(command_options), 'r') do |process|
        process.read
      end
    end

    # Generates mp3 file as a result of
    # Text-To-Speech conversion.
    #
    def save(filename)
      speech = bytes_wav
      res = IO.popen(lame_command(filename, command_options), 'r+') do |process|
        process.write(speech)
        process.close_write
        process.read
      end
      res.to_s
    end

    # Returns mp3 file bytes as a result of
    # Text-To-Speech conversion.
    #
    def bytes()
      speech = bytes_wav
      res = IO.popen(std_lame_command(command_options), 'r+') do |process|
        process.write(speech)
        process.close_write
        process.read
      end
      res.to_s
    end

    # Returns wav file bytes as a result of
    # Text-To-Speech conversion.
    #
    def bytes_wav()
      IO.popen(espeak_command(command_options, "--stdout"), 'r') do |process|
        process.read
      end
    end

    private

    def command_options
      default_options.merge(symbolize_keys(options))
    end

    # Although espeak itself has default options
    # I'm defining them here for easier generating
    # command (with simple hash.merge)
    #
    def default_options
      { :voice => 'en',
        :pitch => 50,
        :speed => 170,
        :capital => 1,
        :quiet => true }
    end

    def espeak_command(options, flags="")
      ['espeak', "#{@text}", "#{flags}", "-v#{options[:voice]}", "-p#{options[:pitch]}", "-k#{options[:capital]}", "-s#{options[:speed]}"]
    end

    def std_lame_command(options)
      lame_command("-", options)
    end

    def lame_command(filename, options)
      ['lame', '-V2', '-', "#{filename}", "#{'--quiet' if options[:quiet] == true}"]
    end

    def symbolize_keys(hash)
      hash.inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = value
        options
      end
    end
  end
end
