# CHANGELOG for copperegg

This file is used to list changes made in each version of copperegg cookbook.

## 1.0.7 (2013-03-08)

* Improved error reporting during installation

## 1.0.6 (2013-03-01)

* Removed two includes that did not belong.

## 1.0.5 (2013-03-1)

* Updated the copperegg class to a parameterized class

  The default parameters are those declared in the params.pp manifest

  You may now override these defaults on a per-node basis.
  - Usage examples

      You can still declare the copperegg class in your node definition as before:

            `include copperegg`

      To ovverride the defaults in your node definition:

            `class{'copperegg': tags => 'tag1,tag2' }`

## 1.0.4 (2013-02-13)

* commented-out the enable command in init.pp
* this was done to eliminate an interaction with our init script, which enables the service during install.

## 1.0.3 (2013-02-10)

* Fixed a parameter-passing regression in 1.0.2. The issue manifested itself when certain of the parameters specified in params.pp were empty strings.

    Now the Tags, Label, Proxy and UUID will function as expected.

* Also in this release, I have begun including the release tarball (e.g., CopperEgg-copperegg-1.0.3.tar.gz).
