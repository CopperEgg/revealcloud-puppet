Puppet::Type.type(:revealuptime_probe).provide(:default) do

  desc 'This is a default provider that does nothing. This allows us to install the probe on the same puppet run where we want to use it.'

  def create
    return false
  end

  def destroy
    return false
  end

  def exists?
    fail('This is just the default provider for probe, all it does is fail')
  end
end
