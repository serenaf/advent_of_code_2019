class FileReader
  def self.read_from_file(file_name)
    input = []
    File.open(file_name) do |f|
      f.each_line do |line|
        line.strip!
        input << line
      end
    end
    input
  end
end
