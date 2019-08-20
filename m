Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EF1958C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 09:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfHTHrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 03:47:11 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:39049 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTHrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 03:47:11 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 68BE5240008;
        Tue, 20 Aug 2019 07:47:02 +0000 (UTC)
Date:   Tue, 20 Aug 2019 09:48:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wjfjaeh4g25lin6n"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wjfjaeh4g25lin6n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,
   sorry for the delayed response..

On Mon, Aug 19, 2019 at 03:45:54PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Add device tree bindings documentation for the Renesas R-Car Display
> > > Unit Color Management Module.
> > >
> > > CMM is the image enhancement module available on each R-Car DU video
> > > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > > @@ -0,0 +1,25 @@
> > > +* Renesas R-Car Color Management Module (CMM)
> > > +
> > > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > > +
> > > +Required properties:
> > > + - compatible: shall be one of:
> > > +   - "renesas,rcar-gen3-cmm"
> > > +   - "renesas,rcar-gen2-cmm"
> >
> > Why do you think you do not need SoC-specific compatible values?
> > What if you discover a different across the R-Car Gen3 line tomorrow?
> > Does the IP block have a version register?
>
> Do you have an answer to these questions?

It does not seem to me that CMM has any version register, nor there
are differences between the different Gen3 SoCs..

However, even if we now define a single compatible property for
gen3/gen2 and we later find out one of the SoC needs a soc-specific
property we can safely add it and keep the generic gen3/gen2 one as
fallback.. Does it work for you?

Thanks
   j


> Thanks!
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

--wjfjaeh4g25lin6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1bpb4ACgkQcjQGjxah
VjzFehAAtZJyQ2C0O0+nEMVUjcPez/olBePoMeBVwI9w3mnWypOuE2eVaEyzNlMb
imYJcwvi3JNKbb+3sxlcQAarRkWBayu5QFq/5Orbtk5ZxwBsKVyUjCkfkcTEprsf
Drf5HI77kmvBDtIDRAwSZUPllhAzzmqqymQNOmuCRebv4i+BTKsiyRMrAIxH8xkw
gcwpsfCCYzQxvjZgR73cshXHidzgrPVWL9mTT+SntxymEAspd+S+bd2Q4pVWHCaq
ErkXABSR8quM6hLdPozJGRCaVv9oDkhSxihAj3dkp0AqtwvPLecmm1Czsoe7j5T3
Qi+012N+EyLV5T/lt/jNNJZExS1wUVrkArYzulUUGrSYpWbN0B6StL/rEKY/KcgX
RwubHKNXKAZKSXcHCzL3rnqeGhhP8QavJBtsj+F9oPy6K3tjoj95TBu2llE6fbuv
dwJ4VbdccJA5bGYUTPbl9Xkn671CwUmCMnuGpp3C/jCOBJNLm9k3+4jMkkQcQYae
kt3AwaARLmVCFRjh++QCczkG/MAZtOUVBcqXfJpGqKb4NkKwQofq3lcxib9zSGyk
G3l+SEUmEwIm4TEvyu5VK04y6VD+Vx9CbcE7oJSG2aDzoEsBQymAIIx10vDvRTgA
QV5rl0pWKx75XvHoWn8+OBO3phKOqM2Jr7n7QuhpdMR8GPY7pWY=
=CPng
-----END PGP SIGNATURE-----

--wjfjaeh4g25lin6n--
