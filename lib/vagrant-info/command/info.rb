require 'optparse'
require 'json'

module VagrantInfo 
  module Command
    class CommandInfo < Vagrant.plugin("2", :command)
      def execute
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant info [machine-name]"
        end

        # Parse the options
        argv = parse_options(opts)
        return if !argv

        results = []
        with_target_vms(argv) do |machine|
          result = ""
          result << machine.name.to_s << "\n"
          result << JSON.pretty_generate(machine.config.vm)
          results << result
        end

        @env.ui.info(results.join("\n"))
        # Success, exit status 0
        0
      end
    end
  end
end
