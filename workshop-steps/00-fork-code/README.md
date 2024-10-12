

1. Go to the demo app: https://github.com/gdgpescara/app-mod-workshop
1. Click [🍴 fork](https://github.com/gdgpescara/app-mod-workshop/fork).
1. Edit things as you wish.
1. Click `Create Fork`.
![alt text](image.png)
1. Keep track of the new repo. Eg, https://github.com/Friends-of-Ricc/app-mod-workshop
1. Clone it locally using SSH or GitHub CLI. Example:

```
cd ~
# option 1: ssh
git clone git@github.com:YOUR_GITHUB_USER/app-mod-workshop.git
# option 2: gh
gh repo clone YOUR_GITHUB_USER/app-mod-workshop

```
1. Edit it with your fav IDE, eg: `code app-mod-workshop/`
2. Copy the `.env.dist` into `.env`.

## [🚄 speed] Note on git clone and ssh

If it's the first time you do the `git clone` with `ssh`, you might have to set up the SSH key both locally and on github side.

To optimize time 🚄, you might want to just git clone with http, no password required. You won't be able to *push* to your repo but you can download the code, get started and edit locally.
