package provide statusBar 1.1

proc statusBar {w args} {
	geekosphere::statusBar::makeStatusBar $w $args

	proc $w {args} {
		geekosphere::statusBar::action [string trim [dict get [info frame 0] proc] ::] $args
	}
	return $w
}

namespace eval geekosphere::statusBar {
	variable sys
	
	proc makeStatusBar {w args} {
		variable sys
		
		# vars that can be set by the coder
		set sys($w,totalAmount) "100";# total amount of the thing to be measured
		set sys($w,barCharacter) "|";# the character that will make up the graphic
		
		# vars that can not be set by the coder
		set sys($w,originalCommand) ${w}_;# the name of the original frame command
		set sys($w,displayText) "N/A";# the text displayed in the textLabel label
		set sys($w,displayGraphic) "N/A";# the text displayed in the graphicsLabel
		
		# create widgets within the widget
		frame ${w} -class statusBar
		pack [label ${w}.graphicsLabel \
					-textvariable geekosphere::statusBar::sys($w,displayGraphic) \
			] -side right
		pack [label ${w}.textLabel \
					-textvariable geekosphere::statusBar::sys($w,displayText) \
			] -side left

		# rename widgets so that it will not receive commands
		uplevel #0 rename $w ${w}_

		# run configuration
		action $w configure [join $args]
		
		return $w
	}
	
	proc action {w args} {
		variable sys
		set args [join $args]
		set command [lindex $args 0]
		set rest [lrange $args 1 end]
		if {$command eq "configure"} {
			foreach {opt value} $rest {
				switch $opt {
					"-bg" - "-background" {
						changeBackgroundColor $w $value
					}
					"-fg" - "-foreground" {
						changeForegroundColor $w $value
					}
					"-font" {
						changeFont $w $value
					}
					"-gc" - "-graphicscolor" {
						changeGraphicColor $w $value
					}
					"-ta" - "-totalamount" {
						if {![string is integer $value]} { error "${opt} only accepts integer values" }
						set sys($w,totalAmount) $value
					}
					"-bc" - "-barcharacter" {
						set sys($w,barCharacter) $value
					}
					"-font" {
						changeFont $w $value
					}
					default {
						error "${opt} not supported"
					}
				}
			}
		} elseif {$command eq "update"} {
			set sys($w,displayText) [calcPercentage $sys($w,totalAmount) $rest]
			set sys($w,displayGraphic) "\[ [returnBars $sys($w,barCharacter) $sys($w,displayText)] \]"
			set sys($w,displayText) $sys($w,displayText)%
		} else {
			error "Command ${command} not supported"
		}
	}
	
	proc returnBars {barCharacter percent} {
		set returnString [string repeat $barCharacter [::tcl::mathfunc::round [expr {$percent / 10.0}]]]
		append returnString [string repeat " " [expr {10 - [string length $returnString]}]]
		return $returnString
	}
	
	proc calcPercentage {totalAmount value} {
		variable sys
		return [::tcl::mathfunc::round [expr {$value * 1.0 / $totalAmount * 100}]]
	}
	
	#
	# Widget configuration procs
	#
	
	proc changeBackgroundColor {w color} {
		variable sys
		$sys($w,originalCommand) configure -bg $color
		${w}.graphicsLabel configure -bg $color
		${w}.textLabel configure -bg $color
	}
	
	proc changeForegroundColor {w color} {
		variable sys
		${w}.textLabel configure -fg $color
	}
	
	proc changeFont {w font} {
		variable sys
		${w}.graphicsLabel configure -font $font
		${w}.textLabel configure -font $font
	}
	
	proc changeGraphicColor {w color} {
		variable sys
		${w}.graphicsLabel configure -fg $color
	}
}