# frozen_string_literal: true

class Gossip
  attr_reader :author, :content

  def initialize(name, content)
    @author = name
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(id)
    all[id]
  end

  def self.delete(id)
    command = "sed -i.bak -e '#{id + 1}d' ./db/gossip.csv"
    system command
  end
end
