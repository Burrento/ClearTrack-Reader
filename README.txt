CLEARTRACK CARD READER
======================

This folder lets an officer's laptop scan student ID cards into ClearTrack
with an ACR122U reader. The reader program runs on this laptop and passes
each card tap to the ClearTrack website open in the browser.

Website: https://lgc-cleartrack.duckdns.org


WHAT'S IN THIS FOLDER
---------------------
1 - Install Prerequisites.bat   Run once per laptop. Installs what the reader needs.
2 - Start Reader.bat            Run every time you scan. Starts the reader.
reader\                         The reader program. Don't change these files.
Prerequisites\ACS Reader Driver Driver for the ACR122U, only if Windows doesn't detect it.


FIRST-TIME SETUP (once per laptop)
----------------------------------
1. Install Python, if the laptop doesn't have it:
   - Download it from https://www.python.org/downloads/
   - On the installer's first screen, TICK "Add python.exe to PATH", then click Install Now.
2. Double-click "1 - Install Prerequisites.bat".
   Wait until it says "Done", then press any key.
3. Plug in the ACR122U reader.
   Windows usually sets it up by itself. If the reader isn't detected later,
   run "Prerequisites\ACS Reader Driver\Setup.exe", then unplug and replug the reader.


EVERY TIME YOU SCAN
-------------------
1. Plug in the ACR122U reader.
2. Double-click "2 - Start Reader.bat".
   - A black window opens. KEEP IT OPEN the whole time you scan.
   - ClearTrack opens in your browser.
3. Log in as an officer and open the event's scanner page
   (Events > the event > Open RFID scanner).
4. The page should show a green dot and "Card reader connected".
   If the browser asks to allow access to devices on your local network
   (or "localhost"), click Allow.
5. Tap student IDs on the reader. Each name flashes green when recorded.
6. When finished, close the black window.

The same reader also fills the RFID field when registering or editing a student.


IF SOMETHING GOES WRONG
-----------------------
"Card reader offline" on the page
  - Check the black reader window is still open. If not, run "2 - Start Reader.bat" again.
  - Make sure the browser address is exactly https://lgc-cleartrack.duckdns.org
    (not an old sslip.io address). The reader only works with that address.
  - Brave browser: click the lion icon in the address bar and turn Shields off
    for this site, then refresh. Or use Google Chrome.

The black window says "Python was not found" or closes immediately
  - Python isn't installed, or "Add python.exe to PATH" wasn't ticked.
    Reinstall Python with that box ticked, then run step 1 again.

"Read failed" or nothing happens when a card is tapped
  - Unplug the reader, plug it back in, and tap again.
  - Hold the card flat on the reader for a second.
  - If it still fails, install the driver from "Prerequisites\ACS Reader Driver".

"address already in use"
  - The reader is already running in another black window. Use that one,
    or close all of them and start again.

The scanner says "Student not found"
  - That card isn't registered. Register the card on the student's record:
    Students > Edit > tap the card > Save changes.


Keep a paper sign-in sheet at every event as a backup, in case the reader,
the laptop or the internet fails.
