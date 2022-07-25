## Tips on Using Asciidoctor

### Include Directive

> `include::file-name.jpg[]`. 
> `include::file-name.png[]`. 

The `[]` can contain further image parameters settings such as width and height. The default images folder is `images`. You can change it: 

> `:includedir: myimagesdir`

To include other asciidoc files:

`include::other-doc.adoc[]`

### Custom Stylesheet

there may be a concept of an Asciidoc template? I think specify a stylesheet with:

`:stylesheet: mysytles.css`



