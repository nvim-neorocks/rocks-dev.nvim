# Changelog

## [1.8.1](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.8.0...v1.8.1) (2025-07-14)


### Bug Fixes

* **rockspec:** restrict lua version to 5.1 ([82950fd](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/82950fd61e5373e0a25b33e6bceb412d0ee56a96))

## [1.8.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.7.0...v1.8.0) (2025-05-05)


### Features

* help file ([#41](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/41)) ([32695e3](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/32695e3213a1f4fb47dbdde2165aa6fc61907afe))

## [1.7.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.6.0...v1.7.0) (2024-09-03)


### Features

* **experimental:** install rockspec dependencies ([#38](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/38)) ([bec5271](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/bec5271a21a84e2bfcd9a3ab5fad763f2e653053))

## [1.6.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.5.0...v1.6.0) (2024-09-02)


### Features

* **experimental:** recognise rocks-dev packages as dependencies ([#33](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/33)) ([100f4f8](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/100f4f83c82463db52e6dcbb2b210f2c29308a11))

## [1.5.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.4.0...v1.5.0) (2024-08-19)


### Features

* warn about wrong 'dir' values ([#35](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/35)) ([84bbfbf](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/84bbfbf51cee3cbdeeea5444b6a95908d56473e3))

## [1.4.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.3.0...v1.4.0) (2024-08-02)


### Features

* basic rocks-config.nvim interoperability ([#30](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/30)) ([e2a2e23](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/e2a2e23befd4ef433942d8367726b2f68863039a))

## [1.3.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.2.4...v1.3.0) (2024-07-28)


### Features

* support dev.path & dev = true ([#28](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/28)) ([4c922b8](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/4c922b81b677048e36f2837cd30edceaf5b7cb49))

## [1.2.4](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.2.3...v1.2.4) (2024-07-11)


### Bug Fixes

* plugins with `HOME` alias (`~`) in `dir` not sourced ([#24](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/24)) ([8836235](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/88362352a0e0e4ff3bfddf84cbac2b256485674c))

## [1.2.3](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.2.2...v1.2.3) (2024-06-12)


### Bug Fixes

* remove local rock outside of sync query_installed_rocks callback ([#21](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/21)) ([3ee5e96](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/3ee5e96d40c52bff4432a8cfcdbce61a1135bdd1))

## [1.2.2](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.2.1...v1.2.2) (2024-06-04)


### Bug Fixes

* update rocks.nvim module ([65f4ab6](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/65f4ab611925990e98fc1d8a3c46a198ce4d8e16))

## [1.2.1](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.2.0...v1.2.1) (2024-04-25)


### Bug Fixes

* proper function name in `rtp.nvim` call ([#12](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/12)) ([4799436](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/4799436f301b1cd38842ef2f4c84532299627cc0))

## [1.2.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.1.2...v1.2.0) (2024-04-25)


### Features

* use rtp.nvim to source plugin directories ([#9](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/9)) ([c7bf5f9](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/c7bf5f916e9adab3c1e53eb5e6a6a15612e4ed7c))

## [1.1.2](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.1.1...v1.1.2) (2024-02-29)


### Bug Fixes

* **runtime:** source plugin rtp directories ([#6](https://github.com/nvim-neorocks/rocks-dev.nvim/issues/6)) ([1c0f90f](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/1c0f90f51704126a4f8dc3dc9e48b60282307101))

## [1.1.1](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.1.0...v1.1.1) (2024-02-23)


### Bug Fixes

* error when attempting to remove installed rock ([debd2c6](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/debd2c684af22294ae72c68aaaf29fa05f36ae31))

## [1.1.0](https://github.com/nvim-neorocks/rocks-dev.nvim/compare/v1.0.0...v1.1.0) (2023-12-26)


### Features

* better rock handling ([cb29db9](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/cb29db92497b755733c644b91f53848f43cb169e))
* prune even more plugins that have `dir` specified ([291af48](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/291af48243b728cbf7aac04d21aef3c9c5d7acd5))


### Bug Fixes

* don't remove plugins which don't exist ([a73978c](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/a73978c8daadf3a92ecef5acd5477f9758e2936f))
* prune plugins that have `dir` specified ([73c44aa](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/73c44aa0cc0254e3986c9f1eb96c52dc216f1316))

## 1.0.0 (2023-12-19)


### Features

* initial commit ([68473bf](https://github.com/nvim-neorocks/rocks-dev.nvim/commit/68473bfc1a4ce1710271a710fed30ce70f04d4e9))
