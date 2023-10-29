# Dotfiles

To apply all of the dotfiles in this repo you can run the following command:

```bash
stow -t ~ */
```

We need to set the target directory to `~` as `stow` will be default use the parent directory.
The `*/` path is used to specify only the directories in the root the the repo, this excludes the `README.md` for example.
