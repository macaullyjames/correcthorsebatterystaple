## What is this?
This is a page that generates secure, easy to remember passwords. That's it. If
you like it, either fork it or send me a pull request! :)

## Show me the goods!
Go [here](http://macaullyjames.github.io/correcthorsebatterystaple/)

## How do I build it?
    npm install
    grunt

## How does it work?
The actual algorithm was proposed in [xkcd 936](http://xkcd.com/936/). Basically,
take a long list of words, randomly choose four words from that list and you have
yourself a password. The math is in the "stats" section of the main page.

### Where did the wordlist come from?
The list is just some random list I found on the internet. It should probably
be replaced, as the words can sometimes be a little... exotic.
