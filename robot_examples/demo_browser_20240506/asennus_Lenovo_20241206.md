# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training

## Robot Framework

### Tuntiesimerkki / Lesson Example

### Päivä / Day: 6.5.2024

### Projekti / Project: demo_browser

### Päivitetty / Updated: 1.12.2024

### Teemu Sipiläinen

### Pythonin asentaminen

Robot Framework vaatii Pythonin. 

C:\Users\tsipi>python --version
Python 3.13.0

C:\Users\tsipi>

Python 3.13.0 on jo asennettu, joten sitä ei tarvitse asentaa. 

### pipx:n asentaminen

C:\Users\tsipi>py -m pip install --user pipx
Collecting pipx
  Downloading pipx-1.7.1-py3-none-any.whl.metadata (18 kB)
Collecting argcomplete>=1.9.4 (from pipx)
  Downloading argcomplete-3.5.1-py3-none-any.whl.metadata (16 kB)
Requirement already satisfied: colorama>=0.4.4 in c:\users\tsipi\appdata\roaming\python\python313\site-packages (from pipx) (0.4.6)
Requirement already satisfied: packaging>=20 in c:\users\tsipi\appdata\roaming\python\python313\site-packages (from pipx) (24.2)
Requirement already satisfied: platformdirs>=2.1 in c:\users\tsipi\appdata\roaming\python\python313\site-packages (from pipx) (4.3.6)
Collecting userpath!=1.9,>=1.6 (from pipx)
  Downloading userpath-1.9.2-py3-none-any.whl.metadata (3.0 kB)
Collecting click (from userpath!=1.9,>=1.6->pipx)
  Downloading click-8.1.7-py3-none-any.whl.metadata (3.0 kB)
Downloading pipx-1.7.1-py3-none-any.whl (78 kB)
Downloading argcomplete-3.5.1-py3-none-any.whl (43 kB)
Downloading userpath-1.9.2-py3-none-any.whl (9.1 kB)
Downloading click-8.1.7-py3-none-any.whl (97 kB)
Installing collected packages: click, argcomplete, userpath, pipx
  WARNING: The scripts activate-global-python-argcomplete.exe, python-argcomplete-check-easy-install-script.exe and register-python-argcomplete.exe are installed in 'C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script userpath.exe is installed in 'C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script pipx.exe is installed in 'C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed argcomplete-3.5.1 click-8.1.7 pipx-1.7.1 userpath-1.9.2

[notice] A new release of pip is available: 24.2 -> 24.3.1
[notice] To update, run: python.exe -m pip install --upgrade pip

C:\Users\tsipi> cd C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts

C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts>.\pipx.exe ensurepath
Success! Added C:\Users\tsipi\.local\bin to the PATH environment variable.
Success! Added C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts to the PATH environment
    variable.

Consider adding shell completions for pipx. Run 'pipx completions' for instructions.

You will need to open a new terminal or re-login for the PATH changes to take effect. Alternatively,
you can source your shell's config file with e.g. 'source ~/.bashrc'.

Otherwise pipx is ready to go! ✨ 🌟 ✨

C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts>

### Poetryn asentaminen

"Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution."

"Poetry on työkalu riippuvuuksien hallintaan ja pakettien hallintaan Pythonissa. Sen avulla voit ilmoittaa, mihin kirjastoihin projektisi riippuu, ja se hallinnoi (asentaa/päivittää) ne puolestasi. Poetry tarjoaa lukitustiedoston, joka varmistaa toistettavat asennukset, ja voi myös rakentaa projektisi jakelua varten." (ChatGPT:n käännös 6.12.2024)

C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts>pipx install poetry
  installed package poetry 1.8.4, installed using Python 3.13.0
  These apps are now globally available
    - poetry.exe
⚠️  Note: 'C:\Users\tsipi\.local\bin' is not on your PATH environment variable. These apps will not
    be globally accessible until your PATH is updated. Run `pipx ensurepath` to automatically add
    it, or manually modify your PATH in your shell's config file (e.g. ~/.bashrc).
done! ✨ 🌟 ✨

C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts>

### Projektin luominen 

C:\Users\tsipi\AppData\Roaming\Python\Python313\Scripts>d:

D:\>cd D:\Omat\Github\software-testing-2024\robot_examples

D:\Omat\Github\software-testing-2024\robot_examples>mkdir demo_browser_20240506

D:\Omat\Github\software-testing-2024\robot_examples>cd demo_browser_20240506

D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506>poetry init --python "^3.13"

This command will guide you through creating your pyproject.toml config.


Package name [demo_browser_20240506]:
Version [0.1.0]:
Description []:
Author [None, n to skip]:  Teemu Sipiläinen <tsipilainen@yahoo.com>
License []:

Would you like to define your main dependencies interactively? (yes/no) [yes] no
Would you like to define your development dependencies interactively? (yes/no) [yes] no
Generated file

[tool.poetry]
name = "demo-browser-20240506"
version = "0.1.0"
description = ""
authors = ["Teemu Sipiläinen <tsipilainen@yahoo.com>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.13"


[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"


Do you confirm generation? (yes/no) [yes] yes

D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506>

### Robot Frameworkin asentaminen projektiin

### rfbrowser init

D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506>poetry shell
Spawning shell within D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506\.venv

(demo-browser-20240506-py3.12) D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506>rfbrowser init
2024-12-06 17:07:49,110 [INFO    ] ==============================================================================================================
2024-12-06 17:07:49,111 [INFO    ] Installing node dependencies...
2024-12-06 17:07:51,362 [INFO    ] Installing rfbrowser node dependencies at D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506\.venv\Lib\site-packages\Browser\wrapper
2024-12-06 17:07:51,881 [INFO    ] npm warn config production Use `--omit=dev` instead.
2024-12-06 17:08:10,129 [INFO    ]
2024-12-06 17:08:10,130 [INFO    ] added 81 packages, and audited 82 packages in 18s
2024-12-06 17:08:10,130 [INFO    ]
2024-12-06 17:08:10,130 [INFO    ] 7 packages are looking for funding
2024-12-06 17:08:10,130 [INFO    ]   run `npm fund` for details
2024-12-06 17:08:10,130 [INFO    ]
2024-12-06 17:08:10,131 [INFO    ] found 0 vulnerabilities
2024-12-06 17:08:10,133 [INFO    ] npm notice
2024-12-06 17:08:10,134 [INFO    ] npm notice New patch version of npm available! 10.9.0 -> 10.9.2
2024-12-06 17:08:10,134 [INFO    ] npm notice Changelog: https://github.com/npm/cli/releases/tag/v10.9.2
2024-12-06 17:08:10,134 [INFO    ] npm notice To update run: npm install -g npm@10.9.2
2024-12-06 17:08:10,134 [INFO    ] npm notice
2024-12-06 17:08:10,168 [INFO    ]
2024-12-06 17:08:10,169 [INFO    ]
2024-12-06 17:08:10,169 [INFO    ]
2024-12-06 17:08:10,169 [INFO    ]
2024-12-06 17:08:10,169 [INFO    ] Installing browser binaries to D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506\.venv\Lib\site-packages\Browser\wrapper
2024-12-06 17:08:10,171 [INFO    ] npx --quiet playwright install
2024-12-06 17:08:19,385 [INFO    ] |                                                                                |   0% of 136.9 MiB
2024-12-06 17:08:30,503 [INFO    ] |                                                                                |  10% of 136.9 MiB
2024-12-06 17:08:41,699 [INFO    ] |                                                                                |  20% of 136.9 MiB
2024-12-06 17:08:59,362 [INFO    ] |                                                                                |  30% of 136.9 MiB
2024-12-06 17:09:13,375 [INFO    ] |                                                                                |  40% of 136.9 MiB
2024-12-06 17:09:34,121 [INFO    ] |                                                                                |  50% of 136.9 MiB
2024-12-06 17:09:44,763 [INFO    ] |                                                                                |  60% of 136.9 MiB
2024-12-06 17:09:58,693 [INFO    ] |                                                                                |  70% of 136.9 MiB
2024-12-06 17:10:19,105 [INFO    ] |                                                                                |  80% of 136.9 MiB
2024-12-06 17:10:41,953 [INFO    ] |                                                                                |  90% of 136.9 MiB
2024-12-06 17:11:10,282 [INFO    ] |                                                                                | 100% of 136.9 MiB
2024-12-06 17:11:15,268 [INFO    ] |                                                                                |   0% of 87.7 MiB
2024-12-06 17:11:33,724 [INFO    ] |                                                                                |  10% of 87.7 MiB
2024-12-06 17:11:50,374 [INFO    ] |                                                                                |  20% of 87.7 MiB
2024-12-06 17:12:02,863 [INFO    ] |                                                                                |  30% of 87.7 MiB
2024-12-06 17:12:15,615 [INFO    ] |                                                                                |  40% of 87.7 MiB
2024-12-06 17:12:28,664 [INFO    ] |                                                                                |  50% of 87.7 MiB
2024-12-06 17:12:37,730 [INFO    ] |                                                                                |  60% of 87.7 MiB
2024-12-06 17:12:49,778 [INFO    ] |                                                                                |  70% of 87.7 MiB
2024-12-06 17:13:11,672 [INFO    ] |                                                                                |  80% of 87.7 MiB
2024-12-06 17:13:31,304 [INFO    ] |                                                                                |  90% of 87.7 MiB
2024-12-06 17:13:38,056 [INFO    ] |                                                                                | 100% of 87.7 MiB
2024-12-06 17:13:41,666 [INFO    ] |                                                                                |   0% of 85.8 MiB
2024-12-06 17:13:48,363 [INFO    ] |                                                                                |  10% of 85.8 MiB
2024-12-06 17:13:59,640 [INFO    ] |                                                                                |  20% of 85.8 MiB
2024-12-06 17:14:13,062 [INFO    ] |                                                                                |  30% of 85.8 MiB
2024-12-06 17:14:26,471 [INFO    ] |                                                                                |  40% of 85.8 MiB
2024-12-06 17:14:34,316 [INFO    ] |                                                                                |  50% of 85.8 MiB
2024-12-06 17:14:43,938 [INFO    ] |                                                                                |  60% of 85.8 MiB
2024-12-06 17:15:00,232 [INFO    ] |                                                                                |  70% of 85.8 MiB
2024-12-06 17:15:13,873 [INFO    ] |                                                                                |  80% of 85.8 MiB
2024-12-06 17:15:25,524 [INFO    ] |                                                                                |  90% of 85.8 MiB
2024-12-06 17:15:34,823 [INFO    ] |                                                                                | 100% of 85.8 MiB
2024-12-06 17:15:38,042 [INFO    ] |                                                                                |   0% of 52.7 MiB
2024-12-06 17:15:42,292 [INFO    ] |                                                                                |  10% of 52.7 MiB
2024-12-06 17:15:46,344 [INFO    ] |                                                                                |  20% of 52.7 MiB
2024-12-06 17:15:53,183 [INFO    ] |                                                                                |  30% of 52.7 MiB
2024-12-06 17:15:59,988 [INFO    ] |                                                                                |  40% of 52.7 MiB
2024-12-06 17:16:06,964 [INFO    ] |                                                                                |  50% of 52.7 MiB
2024-12-06 17:16:11,452 [INFO    ] |                                                                                |  60% of 52.7 MiB
2024-12-06 17:16:17,246 [INFO    ] |                                                                                |  70% of 52.7 MiB
2024-12-06 17:16:25,482 [INFO    ] |                                                                                |  80% of 52.7 MiB
2024-12-06 17:16:33,179 [INFO    ] |                                                                                |  90% of 52.7 MiB
2024-12-06 17:16:43,571 [INFO    ] |                                                                                | 100% of 52.7 MiB
2024-12-06 17:16:56,460 [INFO    ] |                                                                                |   1% of 1.3 MiB
2024-12-06 17:16:56,635 [INFO    ] |                                                                                |  10% of 1.3 MiB
2024-12-06 17:16:56,782 [INFO    ] |                                                                                |  20% of 1.3 MiB
2024-12-06 17:16:56,843 [INFO    ] |                                                                                |  30% of 1.3 MiB
2024-12-06 17:16:56,934 [INFO    ] |                                                                                |  40% of 1.3 MiB
2024-12-06 17:16:57,172 [INFO    ] |                                                                                |  51% of 1.3 MiB
2024-12-06 17:16:57,267 [INFO    ] |                                                                                |  60% of 1.3 MiB
2024-12-06 17:16:57,362 [INFO    ] |                                                                                |  70% of 1.3 MiB
2024-12-06 17:16:57,474 [INFO    ] |                                                                                |  80% of 1.3 MiB
2024-12-06 17:16:57,612 [INFO    ] |                                                                                |  90% of 1.3 MiB
2024-12-06 17:16:57,761 [INFO    ] |                                                                                | 100% of 1.3 MiB
2024-12-06 17:18:01,044 [INFO    ]
2024-12-06 17:18:01,045 [INFO    ]
2024-12-06 17:18:01,046 [INFO    ]
2024-12-06 17:18:01,046 [INFO    ] rfbrowser init completed
2024-12-06 17:18:01,048 [INFO    ] ==============================================================================================================

(demo-browser-20240506-py3.12) D:\Omat\Github\software-testing-2024\robot_examples\demo_browser_20240506>