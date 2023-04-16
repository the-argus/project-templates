# project-templates

A series of nix flake templates for different coding languages I use.

## C++

To use this template, create a folder and run:

```bash
nix flake init --template github:the-argus/project-templates#cpp
```

Or:

```bash
nix flake init --template github:the-argus/project-templates#cpp-meson
```

Meson uses explicit file listing, while CMake uses file globbing. The globbing
approach is much easier during development but unadvisable for release, because
a build system which uses globbing will not notice missing files- sometimes
causing frustrating build errors.

CMake also has direct Visual Studio compatibility so it may be preferable if
co-developing with Windows/VS users.

## Nix

This is a basic flake which is meant for packaging one piece of software. Run:

```bash
nix flake init --template github:the-argus/project-templates#nix
```

## Nim

This is a generic nim project which includes nix packaging. Run:

```bash
nix flake init --template github:the-argus/project-templates#nim
```
