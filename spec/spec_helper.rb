require 'doggo'

RSpec.configure do | config |
  config.color = true
  config.tty   = true
  config.order = :random

  config.add_formatter 'Doggo'

  if ENV['FOR_EXAMPLE']
    config.filter_run_including for_example_output: true
  else
    config.filter_run_excluding for_example_output: true
  end

  Kernel.srand config.seed
end

def spec_helper_capture_stdout( &block )
  result = ''

  begin
    old_stdout = $stdout
    $stdout = StringIO.new

    yield

    result = $stdout.string

  ensure
    $stdout = old_stdout

  end

  return result
end
