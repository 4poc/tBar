# Tcl package index file, version 1.1
# This file is generated by the "pkg_mkIndex" command
# and sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.

package ifneeded barChart 1.1 [list source [file join $dir barChart/barChart.tcl]]
package ifneeded calClock 1.1 [list source [file join $dir calClock/calClock.tcl]]
package ifneeded callib 0.3 [list source [file join $dir util/callib.tcl]]
package ifneeded cpu 1.1 [list source [file join $dir cpu/cpu.tcl]]
package ifneeded memory 1.1 [list source [file join $dir memory/memory.tcl]]
package ifneeded network 1.1 [list source [file join $dir network/network.tcl]]
package ifneeded statusBar 1.1 [list source [file join $dir statusBar/statusBar.tcl]]
package ifneeded tbar 1.1 [list source [file join $dir tbar/tbar.tcl]]
package ifneeded txt 1.1 [list source [file join $dir txt/txt.tcl]]
package ifneeded util 1.1 [list source [file join $dir util/util.tcl]]
package ifneeded logger 1.0 [list source [file join $dir util/logger.tcl]]
package ifneeded imageresize 0.1 [list source [file join $dir util/imageresize.tcl]]
package ifneeded notify 1.0 [list source [file join $dir notify/notify.tcl]]