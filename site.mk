GLUON_SITE_PACKAGES := \
 	gluon-mesh-babel \
	ffffm-keep-radio-channel \
	ffffm-autoupdater-use-site-conf-branch \
	gluon-next-node \
	gluon-radvd \
	gluon-client-bridge \
	iwinfo \
	iptables \
	haveged \
	gluon-respondd \
	gluon-autoupdater \
	gluon-setup-mode \
	gluon-config-mode-core \
	gluon-config-mode-autoupdater \
	gluon-config-mode-hostname \
	gluon-config-mode-geo-location \
	gluon-config-mode-contact-info \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-private-wifi \
	gluon-luci-wifi-config \
	gluon-luci-node-role \
	gluon-status-page \
	gluon-l3roamd \
	gluon-luci-portconfig \
	gluon-mesh-vpn-fastd \
	gluon-config-mode-mesh-vpn \
	gluon-luci-mesh-vpn-fastd \
	ffffm-fastd-auto-mtu \

# einbauen bei internetverbindung
#	ffffm-banner \
#	ffffm-fastd-auto-mtu \


# wahrscheinlich nicht sinnvoll weil unsupported
#	ffffm-luci-switchconfig \

#	gluon-ffmcollectdconfig \
#	collectd5 \
#	collectd-mod-ping \
#	collectd-mod-interface \
#	collectd-mod-cpu \
#	collectd-mod-network \
#	collectd-mod-iwinfo \
#	collectd-mod-load \
#	collectd-mod-memory \
#	gluon-ffmautokey \

#####################################################################################################################

# This is the dev branch
DEFAULT_GLUON_RELEASE := 2016.1-dev

# For homebrew development add e.g. date and time 
# (don't use the ':' char. It will break the build)
# DEFAULT_GLUON_RELEASE := $(DEFAULT_GLUON_RELEASE)-$(shell date '+%m.%d-%H%M')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Development branch information
GLUON_BRANCH ?= dev

# Default priority for updates.
# GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= en de
