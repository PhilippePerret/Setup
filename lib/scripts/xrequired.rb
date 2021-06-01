# encoding: UTF-8
# frozen_string_literal: true
=begin

=end
require 'tty-prompt'
Q = TTY::Prompt.new()

LIB_FOLDER = File.dirname(__dir__)
APP_FOLDER = File.dirname(LIB_FOLDER)

# ---------------------------------------------------------------------
#
#   MÉTHODES D'INTERACTION
#
# ---------------------------------------------------------------------

# Pour demander le startupper qu'il faut lancer quand aucun n'est
# défini dans la commande 'startup'
def ask_for_startupper
  starters = startuppers_for_tty_prompt
  if starters.count == 1
    return starters[0][:value]
  elsif starters.count == 0
    raise "Il faut définir au moins un starter dans #{APP_FOLDER}/_startup_/"
  end
  starters << {name:"Renoncer", value: nil}
  Q.select("Quel startupper dois-je jouer ?") do |q|
    q.choices starters
    q.per_page starters.count
  end
end #/ ask_for_startupper

# ---------------------------------------------------------------------
#
#   MÉTHODES DE DÉMARRAGE
#
# ---------------------------------------------------------------------
def run_in_terminal(command)
  command = command.gsub(/"/,'\\"')
  cmd = <<-EOC
osascript <<APPLESCRIPT
tell app "Terminal"
  activate
  do script "#{command}"
end tell
APPLESCRIPT
  EOC
  res = `#{cmd} 2>&1`
end #/ run_in_terminal

def run_in_atom(command)
  `open -a Atom #{command}`
end #/ run_in_atom

def run_in_ruby(code)
  `ruby << TEXT\n#{code}\nTEXT`
end #/ run_in_ruby

def open_in_other_application(app, command)
  `open -a "#{app}" #{command}`
end #/ run_in_othen_application

# ---------------------------------------------------------------------
#
#   MÉTHODES FONCTIONNELLES
#
# ---------------------------------------------------------------------

def startuppers_for_tty_prompt
  premiers = []
  suivants = []
  Dir["#{APP_FOLDER}/_startuppers_/*.*"].each do |fpath|
    fname = File.basename(fpath)
    hname = File.basename(fname, File.extname(fname)).gsub(/_/,' ')
    dsetup = {name:hname, value:fname}
    if hname.start_with?('!')
      premiers << dsetup.merge!(name: hname[1..-1])
    else
      suivants << dsetup
    end
  end
  return premiers + suivants
end #/ startuppers_for_tty_prompt
