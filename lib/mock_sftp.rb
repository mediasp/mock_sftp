module MockSFTP

  class SFTPEntry
    attr_reader :name
    def initialize(props)
      @name = props[:name]
    end
  end

  class SFTPDir
    def initialize(dir) ; @dir = dir ; end

    def [](base, pattern)
      Dir[File.join(@dir, base, pattern)].map do |p|
        SFTPEntry.new(:name => File.basename(p))
      end
    end
  end

  class Session

    def initialize(dir) ; @dir = dir        ; end
    def dir             ; SFTPDir.new(@dir) ; end

    def upload!(local_path, remote_path)
      local_remote_path = File.join(@dir, remote_path)
      FileUtils.cp(local_path, local_remote_path)
      nil
    end

    def rename(src, dest, flags_ignored)
      local_src = File.join(@dir, src)
      local_dest = File.join(@dir, dest)
      FileUtils.mv(local_src, local_dest)
    end

    def download!(remote_dir, local_dir, options={})
      raise 'options not supported' unless options == {:recursive => true}

      local_remote_dir = File.join(@dir, remote_dir)
      FileUtils.cp_r(Dir.glob(local_remote_dir + '/*'), local_dir)
    end
  end

end
