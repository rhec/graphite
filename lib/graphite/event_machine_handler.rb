# This code originally written by Bob Potter is extracted from OtherInbox
# TODO EMH code should be spun out into its own gem

module Graphite
  class EventMachineHandler
  
    def self.ensure_running
      start_em unless EventMachine.reactor_running? 
    end
           
    private

    def self.start_em
      em = Thread.new { EM.run{} }

      # We want to fail if there is an exception in EM otherwise we're dead in the water
      em.abort_on_exception = true

      %w(INT TERM).each do |sig|
        old = trap(sig) do 
          EM.stop if EM.reactor_running?

          if old.respond_to? :call
            old.call
          else
            old
          end
        end
      end
    end
  
  end
end