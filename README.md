# `rustfmt-bin`

> Binary releases of [rustfmt]

[rustfmt]: https://github.com/rust-lang-nursery/rustfmt

## Targets

### Linux

Each Linux target is built inside a Docker container.

| TARGET                            | OS (Ubuntu) | Glibc |
|-----------------------------------|-------------|-------|
| `i686-unknown-linux-gnu`          |       12.04 |  2.15 |
| `i686-unknown-linux-musl`         |       16.04 |   N/A |
| `x86_64-unknown-linux-gnu`        |       12.04 |  2.15 |
| `x86_64-unknown-linux-musl`       |       16.04 |   N/A |

### macOS

- `i686-apple-darwin`
- `x86_64-apple-darwin`

### Windows

- `i586-pc-windows-msvc`
- `i686-pc-windows-gnu`
- `i686-pc-windows-msvc`
- `x86_64-pc-windows-gnu`
- `x86_64-pc-windows-msvc`

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
  http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
