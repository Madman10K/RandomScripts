#!/bin/bash
xinput set-prop "Apple Inc. Magic Trackpad 2" "Synaptics Two-Finger Scrolling" 1, 1
xinput set-prop "Apple Inc. Magic Trackpad 2" "Synaptics Finger" 2, 2, 0
xinput set-prop "Apple Inc. Magic Trackpad 2" "Synaptics Palm Detection" 1
synclient TapButton1=1 TapButton2=3 TapButton3=2 VertTwoFingerScroll=1 HorizTwoFingerScroll=1
