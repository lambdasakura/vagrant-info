# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8

require "vagrant"

module VagrantInfo 
  class Plugin < Vagrant.plugin("2")
    name "vagrant-info"
    description <<-DESC
    Sahara
    DESC

    command("info") do
      require File.expand_path("../vagrant-info/command/info", __FILE__)
      Command::CommandInfo
    end
  end
end
