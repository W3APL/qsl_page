---
title: W3APL
subtitle: W3APL
permalink: /
author_profile: true
classes: wide
share: false
---

![Aerial view of the APL campus in Laurel, MD]({{ '/assets/images/jhu_apl_campus.jpg' | relative_url }}){:class="img-fluid" style="max-width:50%"}

## Latest Posts

<ul>
  {% for post in site.posts limit:5 %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      <span>({{ post.date | date: "%B %d, %Y" }})</span>
    </li>
  {% endfor %}
</ul>

[See all posts]({{ '/posts/' | relative_url }})

## Monthly Net

On the first thursday of the month at 17:30 ET, the club holds a net that is
open to the public on the [Columbia Amateur Radio Association](https://www.columbiaara.org)
repeater:

147.135 MHz/+0.6 MHz - PL 156.7 Hz

## Beacons

The club operates six simultaneous beacon transmitters on-site at APL. Beacon
transmitters are keyed using a common keyer.

| Band (m) | Frequency (MHz) | Mode      | Power (W) | Antenna Type   | Height (HAAT) | Height (ASL) | Status  |
|----------|-----------------|-----------|-----------|----------------|---------------|--------------|---------|
|   10     |      28.296     | CW        | 8         | Dipole         | 55' (~17 m)   | 445' (136 m) | Active  |
|    6     |      50.064     | CW        | 19        | Halo           | 53' (~16 m)   | 443' (135 m) | Active  |
|    2     |     144.296     | CW        | 3.5       | Halo           | 57' (~17 m)   | 447' (136 m) | Active  |
|    0.70  |     432.317     | CW        | 3.2       | Crossed Dipole | 68' (~21 m)   | 458' (140 m) | Active  |
|    0.33  |     903.056     | CW        | 7         | Halo           | 68' (~21 m)   | 458' (140 m) | Offline |
|    0.23  |    1296.060     | Morse FSK | 0.3       | Alford Slot    | 125' (~38 m)  | 515' (157 m) | Active  |

*Note: Beacons are occasionally taken off the air for maintenance, for APL
planned power outages, or when club operators are working 10 meters.*
