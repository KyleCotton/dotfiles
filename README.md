# Dotfiles

## Applying Changes

The dotfiles are managed by GNU Stow, this allows for all of the dotfiles to be centrally managed then simply
symbolically linked into the correct locations.

To apply all of the dotfiles in this repository you can run the following command:

```bash
stow -t ~ */
```

We need to set the target directory to `~` as `stow` will be default use the parent directory. The `*/` path is used to
specify only the directories in the root the repository, this excludes the `README.md` for example.
