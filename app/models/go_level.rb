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
    return "gnugo --level 10 --mode gtp" if rank ==  "8k"
    return "gnugo --level  9 --mode gtp" if rank ==  "9k"
    return "gnugo --level  8 --mode gtp" if rank == "10k"
    return "gnugo --level  7 --mode gtp" if rank == "11k"
    return "gnugo --level  6 --mode gtp" if rank == "12k"
    return "gnugo --level  5 --mode gtp" if rank == "13k"
    return "gnugo --level  4 --mode gtp" if rank == "14k"
    return "gnugo --level  3 --mode gtp" if rank == "15k"
    return "gnugo --level  2 --mode gtp" if rank == "16k"
    return "gnugo --level  1 --mode gtp" if rank == "17k"
    return "gnugo --level  0 --mode gtp" if rank == "18k"

    return "gnugo --mode gtp"
  end
end
