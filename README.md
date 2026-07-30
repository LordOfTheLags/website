# Laggy World

Source for [lordofthelags.net](https://lordofthelags.net) — my personal, self-hosted website, built with [Zola](https://www.getzola.org/) and [Nix](https://nixos.org/).

## Development

```bash
nix develop -c zola serve   # dev server at http://127.0.0.1:1111
nix build                   # build the site into ./result
```

## License

Open source under the [GNU GPL v3.0](LICENSE).
