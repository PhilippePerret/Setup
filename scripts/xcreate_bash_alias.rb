# encoding: UTF-8
# frozen_string_literal: true
=begin
  Script (à ne jouer qu'une fois) qui définit l'alias 'startup' dans le
  bash profile.
=end

RUNNER_PATH = File.expand_path(File.join('.','lib','scripts','run_startup_file.rb'))

# Exécutable
`chmod +x "#{RUNNER_PATH}"`

code = <<-SH
alias startup="#{RUNNER_PATH}"
SH

` echo "\nalias startup=\\\"#{RUNNER_PATH}\\\"" >> "$HOME/.bash_profile"`
