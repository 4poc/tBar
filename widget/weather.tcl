catch { namespace import geekosphere::tbar::packageloader::* }
namespace eval geekosphere::tbar::wrapper::weather {
	package require weather

	generallyRequires weather googleweather http imageresize tdom logger
	setNamespace weather ::geekosphere::tbar::widget::weather
	registerNamespaceImportsFor weather \
		::geekosphere::tbar::util::* \
		::geekosphere::googleweather::*

	proc init {path settingsList} {
		pack [weather $path \
			-fg $geekosphere::tbar::conf(color,text) \
			-bg $geekosphere::tbar::conf(color,background) \
			-height $geekosphere::tbar::conf(geom,height) \
			-font $geekosphere::tbar::conf(font,sysFont) \
			-imagepath [file join $geekosphere::tbar::sys(user,home) image] \
			{*}$settingsList
		] -side $geekosphere::tbar::conf(widgets,position)
		return $path
	}

	proc update {path} {
		$path update
	}
}
