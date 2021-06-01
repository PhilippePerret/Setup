# encoding: UTF-8
# frozen_string_literal: true
=begin
  Crée un raccourci sur le bureau pour le starter STARTUP_NAME
=end

STARTUP_NAME    = "Site_perso"


# ---------------------------------------------------------------------
#   NE RIEN TOUCHER CI-DESSOUS
# ---------------------------------------------------------------------

STARTUP_SCRIPT = "#{STARTUP_NAME}.json"
STARTUP_SCRIPT_PATH = File.join('.','_startup_',"#{STARTUP_SCRIPT}")

STARTUP_COMMAND = "ruby /Users/philippeperret/Programmation/Setup/lib/scripts/run_startup_file.rb #{STARTUP_NAME}\n"

STARTUPER_PATH = File.join(Dir.home,'Desktop',"#{STARTUP_NAME}.command")
File.delete(STARTUPER_PATH) if File.exists?(STARTUPER_PATH)
File.open(STARTUPER_PATH,'wb') { |f| f.write STARTUP_COMMAND}

puts "Le raccourci a été créé sur le Finder"
