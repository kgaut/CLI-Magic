Cinnamon
=========
Petites commandes qui permettent de s'en sortir avec Cinnamon quand tout va mal

## Relancer Cinnamon depuis un autre TTY
### solution soft 
 - `pkill -HUP -f "cinnamon --replace"` => tente un soft reboot en gardant les fenêtres et programmes
 
### solution BADASS 
    Cinnamon freezes
    Switch tty. I usually go to tty6, Ctrl+Alt+F6
    If you need to login first, do so.
    Type w (yes, just the letter) and press enter. This commands does a lot of different things, but you need it to figure out the number of the display you are using. The display number is in the column FROM. Mine is :0 (yes, including the colon).
    Assuming that cinnamon is already dead (which you would notice by the windows lacking titles and that you can't move different windows around, and perhaps even not being able to use the keyboard), you type export DISPLAY=:0; cinnamon &, and don't forget the colon. I add the ampersand (&) only not to keep that tty busy.
