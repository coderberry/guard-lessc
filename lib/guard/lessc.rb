require "guard"
require "guard/guard"

module Guard
  module Lessc < Guard
    require 'colorize'

    def initialize(watchers = [], options = {})
      super
      @options = {
          :yui_compress => false,
          :compress     => false,
          :paths        => [],
          :optimization => 1,
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
      command = "lessc #{generate_cl_arguments}"
      puts command
      puts `#{command}`
    end

    def generate_cl_arguments
      args = []
      args << "-x" if @options[:compress]
      args << "--yui-compress" if @options[:yui_compress]
      args << "--paths #{@options[:paths].join(':')}" if @options[:paths].size > 0
      args << "--optimization #{@options[:optimization]}" if @options[:optimization]
      args << "> #{@options[:out_file]}" if @options[:out_file]
      args.join(' ')
    end

  end
end
