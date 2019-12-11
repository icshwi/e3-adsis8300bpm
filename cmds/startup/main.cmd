###############################################################################
# IOC main startup file
###############################################################################

errlogInit(20000)

###############################################################################
# setup before iocBoot()
###############################################################################

# acquisition (SIS8300) setup
< acq.setup

# timing (MRF EVR) setup
< evr.setup

# ethmod support setup
#< ethmod.setup

# autosave setup
#< autosave.setup

# aliases setup
< aliases.setup

# IPMI setup
#< ipmi.setup


iocInit()



###############################################################################
# initialization after iocBoot()
###############################################################################

# comment out if autosave is not used
#< autosave.init

# comment out if acquisition is not used
< acq.init

# comment out if real device is used (needs acq.init)
# < acq_fakedev.init

# comment out if EVR is connected to EVG (needs evr_standard.init)
< evr_standalone.init

# comment out if EVR clock is not used (needs evr_standard.init)
# < evr_clock.init

# comment out if EVR is not present/used
< evr_standard.init

# comment out if timestamping is not used (needs evr_standard.init)
# < evr_timestamping.init

###############################################################################
# IOC running!
###############################################################################
