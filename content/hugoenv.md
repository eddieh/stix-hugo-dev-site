+++
title = "Hugo Environment"
description = "Prints out all the variables"
date = "2020-02-15"
aliases = []
author = "Hugo Authors"
draft = true
+++

## Raw

{{< hugoenv.inline >}}
<pre>{{ printf "%#v" .Page.Site }}</pre>
{{< /hugoenv.inline >}}

---

## Object Literal

Inspect `window.HUGO_ENV` for a nicely formatted representation of
the environment.

{{< hugoenv.inline >}}
<script>
window.HUGO_ENV = {{  .Page.Site | jsonify }}
window.HUGO_ENV.Title = "{{ .Page.Site.Title }}"
window.HUGO_ENV.Hugo = {{ .Page.Site.Hugo | jsonify }}
window.HUGO_ENV_PRETTY = JSON.stringify(window.HUGO_ENV, null, 2)
</script>
{{< /hugoenv.inline >}}
