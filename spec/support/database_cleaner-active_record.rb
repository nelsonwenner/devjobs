RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(
      :truncation,
      except: %w(ar_internal_metadata)
    )
  end
end

DatabaseCleaner.url_allowlist = [
  'postgresql://root:root@postgres:5432', 
  'postgresql://root:root@localhost:5432'
]
