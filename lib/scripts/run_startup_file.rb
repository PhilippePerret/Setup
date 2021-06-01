#!/usr/bin/env ruby
# encoding: UTF-8
# frozen_string_literal: true
=begin
  Joue les commandes définies par le script de démarrage

  Un alias a été créé grâce à scripts/xcreate_bash_alias.rb
=end
require_relative './xrequired'

STARTUPPER_NAME = ARGV[0] || ask_for_startupper


STARTUPPER_AFFIXE = File.basename(STARTUPPER_NAME, File.extname(STARTUPPER_NAME))
STARTUPPER_PATH = File.join(APP_FOLDER,'_startuppers_/',"#{STARTUPPER_NAME}")

# ON récupère les données
data =  case File.extname(STARTUPPER_NAME)
        when '.json'
          require 'json'
          data = JSON.parse(File.read(STARTUPPER_PATH))
        when '.yaml'
          require 'yaml'
          YAML.load_file(STARTUPPER_PATH)
        end

# On exécute les commandes
data.each do |app, commandes|
  commandes.each do |commande|
    case app
    when 'Terminal', :Terminal
      run_in_terminal(commande)
    when 'Atom', :Atom
      run_in_atom(commande)
    when 'Ruby', :Ruby
      run_in_ruby(commande)
    when 'Markdown', :Markdown
      open_in_other_application(ENV['MARKDOWN_APP'], commande)
    else
      open_in_other_application(app, commande)
    end
  end
end

# À la fin, on fait une notifiation
`osascript -e 'display notification "La configuration “#{STARTUPPER_AFFIXE}” est prête." with title "Setup-Starter"'`
