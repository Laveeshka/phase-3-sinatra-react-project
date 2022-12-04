module ToHash
    def to_hash
        hash = {}
        self.attributes.each { |key, value| hash[key] = value }
        hash
    end
end