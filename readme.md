# Content Element generator for startpilot

This documentation is written for version [1.4.0](https://github.com/Alphatone/ce-gen/releases/tag/1.4.0) of ce-gen. The ce-gen only works in combination with a [startpilot](https://github.com/Startpiloten/startpilot/) provider extension



## What it does:

ce-gen is a CLI tool built to generate all the files a Custom Content Element needs. It's name stems from **c**ontent **e**lement **gen**erator. This includes:

- fluidtemplates 
- backendpreview templates
- scss files
- tsconfig files
- typoscript files 

In order to generate and include these files automatically we use the structure of a startpilot provider extension.

There are three different types of Custom Content Elements ce-gen allows you to generate. These are defined as follows:

- Default Item
- Irre Item
- MM Item

Each one of them is generated with a ready to use frontend output and can immediately be used in the backend. There is a caveat to it which we will get to in the section below.

#### What is a Default Item?

A default item is probably the most common and straight forward content element. Per default (and that's the caveat) it only ships with a single configured (header) field. ce-gen provides you with everything you need to check to be sure that you have a working basis you can build your Custom Content Element on.

#### What is a Irre Item?

Irre is an acronym for Inline-Relational-Record-Editing. Check out the [official documentation](https://docs.typo3.org/typo3cms/TCAReference/ColumnsConfig/Type/Inline.html) on this topic. An Irre Item is a content element that contains an arbitrary amount of same predefined other elements. Think of an accordion, where multiple equally structured elements are grouped together. Remember the caveat? These wrapped and equally structured elements also ship with a header field only.

#### What is a MM Item?

A MM Item makes use of the bidirectional binding betweend two tables. One of the tables contains a list of records, the other one is able to display a arbitrary amount, combination and order of these records. A common use case for these items could look like this:

You need to display a contact person on your customer's website. Your customer needs the contact person to be on some pages but not all of them. There also is a page where all the persons get displayed in a list. Each person has their own profile page as well, displaying information about him.

In this case the record would be the contact person. With MM Items you can create a record that holds all the data that gets displayed in the different views. How this record is displayed – layoutwise and which data – is completely up to the container holding these records.
The advantage over three different default items that could manage three different layouts as well lies in being able to edit a single record and effect all places this record is being displayed. In a MM relation item you also are able to jump from the wrapping container to its child records and edit them directly.

## System Requirements

- a startpilot provider extension
- PHP 7.2 has to be available on your CLI
- composer
- gettext

If you do not have setup a provider extension with startpilot, please refer to the [startpilot documentation](https://github.com/Startpiloten/startpilot/). There are plenty of well documentad different ways to install PHP 7.2, composer or gettext. Feel free to use whatever suits you best. You can check these requirements by running following commands on your cli:

 `php -v` should print 7.2.* (or newer):

```bash
PHP 7.2.1 (cli) (built: Jan 15 2018 12:20:50) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2017 Zend Technologies
```



`composer -v` should print 1.6.*:

``Composer version 1.6.2 2018-01-05 15:28:41`` 



`gettext -v`	should print 0.19.*

`gettext (GNU gettext-runtime) 0.19.6`



## Usage

Alwas run the script from your project root (depending on your composer.json bin-dir).

If you have not set the bin-dir in the composer.json (default):

use: `sh vendor/bin/ce-gen.sh`



If the config entry in your composer.json contains this: 

```json
  "config": {
    "bin-dir": "."
  }
```
you can execute the ce-gen by entering following command on your cli:

 `sh ce-gen.sh` 

**!! Do not cd into vendor/bin/ and run it there!!**

After you entered the command for the first time the cli will inform you that `.t3.cegen.yaml` was not found and it creates the missing file in your project root. If you open it it should look something like this:

```yaml
extension:
  name: startpilot
  path: public/typo3conf/ext/startpilot
```

You have to replace the name property with the name you gave your startpilot provider extension and check if the path to your extension directory is correct. If you did not bother to change the name of it you can skip this step.

If you execute `ce-gen.sh` again you will get prompted to chose the type of content element you want to create (if this sounds new to you, you can look it up at „What it does?“ above). Next up are some specifications that get displayed and the backend as well as the cType TYPO3 needs to refer to the element internally.

Once you get asked if you want to start over again, you know all went well and you are ready and set to begin adding just anything you need your new content element to have.

If your version control was clean as you started you will not find it clean anymore. There should be added files that the ce-gen generated, as well as a .gitignore change that adds the `.t3cegen.yaml` to it.