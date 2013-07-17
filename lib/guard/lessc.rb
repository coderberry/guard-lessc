require "guard"
require "guard/guard"

module Guard
  class Lessc < Guard
    require 'colorize'

    def initialize(watchers = [], options = {})
      super
      @options = {
          :bin_path     => 'lessc',
          :yui_compress => false,
          :compress     => false,
          :in_file      => '',
          :out_file     => ''
      }.merge(options)
    end

    def run_all
      lessc
    end

    def run_on_changes(path)
      puts "detected changes in #{path.join(', ')}".yellow
      lessc
    end

    def lessc
      system("rm #{@options[:out_file]}") if File.exist?(@options[:out_file])
      command = "#{@options[:bin_path]} #{generate_cl_arguments}"
      puts command
      puts `#{command}`
    end

    def generate_cl_arguments
      args = []
      args << "-x" if @options[:compress]
      args << "--yui-compress" if @options[:yui_compress]
      args << @options[:in_file] if @options[:in_file]
      args << "> #{@options[:out_file]}" if @options[:out_file]
      args.join(' ')
    end

  end
end
