require 'optparse'

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

        state = nil
        results = []
        with_target_vms(argv) do |machine|
          state = machine.state if !state
          results << "#{machine.name.to_s.ljust(25)}#{machine.state.short_description} (#{machine.provider_name})"
        end

        message = nil
        if results.length == 1
          message = state.long_description
        else
          message = I18n.t("vagrant.commands.status.listing")
        end

        @env.ui.info(I18n.t("vagrant.commands.status.output",
                            :states => results.join("\n"),
                            :message => message),
                     :prefix => false)

        # Success, exit status 0
        0
      end

      # Prints the help out for this command
      def help
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant info"
          o.separator ""
          o.separator "Available subcommands:"

          # Add the available subcommands as separators in order to print them
          # out as well.
          keys = []
          @subcommands.each { |key, value| keys << key.to_s }

          keys.sort.each do |key|
            o.separator "     #{key}"
          end

          o.separator ""
          o.separator "For help on any individual command run `vagrant plugin COMMAND -h`"
        end

        @env.ui.info(opts.help, :prefix => false)
      end
    end
  end
end
