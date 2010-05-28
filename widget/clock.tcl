package require calClock

namespace eval geekosphere::tbar::wrapper::clock {
	
	proc init {path settingsList} {
		pack [calClock $path \
			-fg $geekosphere::tbar::conf(color,text) \
			-bg $geekosphere::tbar::conf(color,background) \
			-format "%B %d, %H:%M:%S" \
			-hovercolor $geekosphere::tbar::conf(color,hovercolor) \
			-clickedcolor $geekosphere::tbar::conf(color,clickedcolor) \
			-font $geekosphere::tbar::conf(font,sysFont) \
			{*}$settingsList
		] -side $geekosphere::tbar::conf(widgets,position)
		return $path
	}
	
	proc update {path} {
		$path update
	}
}
