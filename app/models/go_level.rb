class GoLevel < Go::GTP
  def self.start rank
    command = self.get_command rank

    self.run_gnugo command: command
  end

  def loadsgftext sgf
    file = Tempfile.new(['temp', '.sgf'])
    file.write(sgf)
    file.close

    resp = self.loadsgf(file.path)

    file.unlink

    resp
  end

  protected

  def self.get_command rank
    return "gnugo --mode gtp"
  end
end
