# http://stackoverflow.com/questions/18136918/how-to-get-current-directory-of-your-makefile
this_dir := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#
#		The gluon-mesh-batman-adv-* package must come first because of
#		the dependency resolution!
GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-14 \
	gluon-alfred \
	gluon-announced \
	gluon-autoupdater \
	gluon-config-mode-autoupdater \
	gluon-config-mode-hostname \
	gluon-config-mode-mesh-vpn \
	gluon-config-mode-geo-location \
	gluon-config-mode-contact-info \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-private-wifi \
	gluon-next-node \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-status-page \
	iwinfo \
	iptables \
	haveged

DEFAULT_GLUON_CHECKOUT := v2014.3.1
# Allow overriding the checkout from the command line
GLUON_CHECKOUT ?= $(DEFAULT_GLUON_CHECKOUT)

DEFAULT_GLUON_RELEASE := $(shell git --git-dir=$(this_dir)/.git --work-tree=$(this_dir) describe --tags --always --dirty --match "v*" | sed 's/^v//')
# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0
