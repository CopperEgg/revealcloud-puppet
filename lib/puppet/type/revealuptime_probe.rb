Puppet::Type.newtype(:revealuptime_probe) do

  @doc = "Manage creation/deletion of Uptime Cloud Monitor RevealUptime probes`."

  ensurable

  newparam(:probe, :namevar => true) do
    desc "The RevealUptime meter destination."
  end

  newparam(:apikey) do
    desc "The RevealUptime API key."

    validate do |value|
      if value == nil
        raise ArgumentError, "You must specify an API key."
      end
    end
  end

  newparam(:type) do
    desc "The probe type, GET or POST. Defaults to GET."

    newvalues(:GET, :POST)

    defaultto "GET"
  end

  newparam(:frequency) do
    desc "The frequency of the check."

    newvalues("15", "60")

    defaultto "60"
  end

  newparam(:description) do
    desc "The description of the probe."

    validate do |value|
      if value == nil
        raise ArgumentError, "You must specify a description."
      end
    end
  end
end
