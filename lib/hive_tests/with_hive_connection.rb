module WithHiveConnection
  def self.extended(mod)
    mod.let(:hive) { HiveTests.connector }

    mod.let(:connection) { hive.start_connection }

    mod.after(:all) do
      hive.stop_connection(connection) unless hive && connection
    end
  end
end