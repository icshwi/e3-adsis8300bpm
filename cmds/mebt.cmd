###############################################################################
#
# PBI system   : Beam Position Monitor
# Location     : lab
#
# Support      : https://jira.esss.lu.se/projects/PBIBPM
# Wiki         : https://confluence.esss.lu.se/display/PBIBPM
#
###############################################################################


###############################################################################
# Load E3 modules
###############################################################################
# Loading of all required modules and versions
require busy,1.7.2-e45eda2
require autosave,5.10.0
require asyn,4.36.0
require ADCore,3.7.0
require admisc,7505d306
require ipmiComm,4.2.0
require iocStats,3.1.16
require recsync,1.3.0-9705e52
require mrfioc2,2.2.0-rc7
require adsis8300,ad98379b
require adsis8300bpm,8470cb47

###############################################################################
# IOC instance startup file
###############################################################################


# location of the system (section-subsection)
# lab example
epicsEnvSet("RACKROW",                      "FEB-050Row")
epicsEnvSet("SECTION",                      "MEBT-010")
# PBI device name (discipline-device-index)
epicsEnvSet("SLOT1",                        "PBI-BPM-001")
epicsEnvSet("SLOT2",                        "PBI-BPM-002")
# system name (SECTION:SLOT)
epicsEnvSet("SYSTEM1",                      "$(SECTION):$(SLOT1)")
epicsEnvSet("SYSTEM2",                      "$(SECTION):$(SLOT2)")
# Note: above values should come from ESS Naming service

# digitizer device index (from list of /dev/sis8300-n path)
epicsEnvSet("ACQ_DEVID",                    "3")
# acquisition sub unit logical name
# 8x MEBT BPM SIS8300 AMCs: FEB-050Row:PBI-AMC-011 .. FEB-050Row:PBI-AMC-018
epicsEnvSet("ACQ_UNIT",                     "PBI-AMC-012")
# maximum number of samples to acquire
# 300k per channel per rate (14 Hz), this is conservative
# when looking at ~88Msps for 3ms of pulse length.
epicsEnvSet("ACQ_SAMPLES",                  "300000")

# EVR device PCI ID (from lspci)
epicsEnvSet("EVR_DEVID",                    "0e:00.0")
# EVR unit logical name
# 1x MEBT BPM: EVR FEB-050Row:PBI-EVR-010
epicsEnvSet("EVR_UNIT",                     "PBI-EVR-020")

# Work around EVR PV names
epicsEnvSet("EVR_S",                   "MEBT")
epicsEnvSet("EVR_D",                   "010:PBI-EVR-020")

# EthMod device IP:port
epicsEnvSet("EM_DEVID",                     "192.168.100.100:1002")
# 1x MEBT BPM LOD: FEB-050Row:PBI-LOD-001FEB for all 8x AMCs
epicsEnvSet("EM_UNIT",                      "PBI-LOD-001")

# EPICS_CA_MAX_ARRAY_BYTES: 10 MB max CA request
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES",     "10000000")

# include the main startup file
cd startup
< main.cmd
