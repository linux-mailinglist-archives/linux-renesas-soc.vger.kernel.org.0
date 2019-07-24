Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D193972A39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 10:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfGXIfx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 04:35:53 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58575 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfGXIfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 04:35:52 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 05C1124000C;
        Wed, 24 Jul 2019 08:35:48 +0000 (UTC)
Date:   Wed, 24 Jul 2019 10:37:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Message-ID: <20190724083710.wnttvauam2zwiii7@uno.localdomain>
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
 <CAMuHMdVKiJp0PsuogMo8FZ6NUxi4j09+A2zDXZr4nrtZY-KHaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tmwn5ydm7h2arvyi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVKiJp0PsuogMo8FZ6NUxi4j09+A2zDXZr4nrtZY-KHaw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tmwn5ydm7h2arvyi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Wed, Jul 24, 2019 at 09:28:58AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Wed, Jul 24, 2019 at 3:38 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > The R-Car LVDS encoder units support dual-link operations by splitting
> > the pixel output between the primary encoder and the companion one.
> >
> > In order for the primary encoder to succesfully control the companion's
> > operations this should not fail at probe time and register itself its
> > associated drm bridge so that the primary one can find it.
> >
> > Currently the companion encoder fails at probe time, causing the
> > registration of the primary to fail preventing the whole DU unit to be
> > registered correctly.
> >
> > Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> > Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > ---
> > The "Fixes" tag refers to a patch currently part of the
> > renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.
>
> The broken commit is also present in v5.3-rc1.

You're right... This is then entitled to be collected for rc2 then.

Thanks
   j
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--tmwn5ydm7h2arvyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl04GLYACgkQcjQGjxah
VjyrrxAAl4RQ0Uq+Ix56ugDgecHqIcqzJ0HtIHBz+2Zmj1mD26HJwuPzlgV7Ke3O
hMjEXdqtcl2F+BamoPn5HLx0X9VU8zYZ7EKwZniiBER438HAqMzky37ujuenZv+u
YilYEiMslCDqv2JCFlFAgXw41gYWzeWnmPwFbmO2nhMplj5SLU/qSIkTMTGTDDZU
M0txIFJ08GS6UyIWJcS2TAB1BuPltG4F1G+Ei8GJ2iTnW6BndETHh0SGUaTLAgV4
TH40JZd8TnND+lvMvxTQrcHwsuw9VxTJxoDc+bH9sVg7TS8VuJuBojlvTnEQtB4I
PTVNHz51F+vOreEZSyvVAGpIrThxDPNFke/uxTEINvMXJ1XXo6WAgbcs9mznTU02
gq3SKddfyzlRGPQkwHxmCkY4ifkEwstiQSiTzkiKhEOUILjMf8dOltoyQhfhzN2J
g1rsKbp/ufezBMBnIytDN5WdyO5C1Wai5jX5vUxOiBHU40zlsTdleCJrsKaqoGrD
e9VPZmNtTzwvR/j+XcGxRhLT1YQrWt6RAAlqaid2po6aiOUyPs5TZdUBa1FV+hbV
y7Z+zGk9hS2Z/PR4ngqLCipSlgjDCJXocnnE1lG/AZpekgdtrH996QnT+z8B/a/k
gIjDe+x6A9wkzwfsQloCcEJwCZeZsz+l2aQcdJrXgEXHeuxs53c=
=iXnV
-----END PGP SIGNATURE-----

--tmwn5ydm7h2arvyi--
