#! /usr/bin/osascript
on alfred_script(links)

  set {init, links} to {item 1, rest} of paragraphs of links

  tell app "Safari"
    make new document with properties { URL: init }

    tell window 1 to repeat with link in links
      make new tab with properties { URL: link }
    end repeat
    activate
  end tell

end alfred_script