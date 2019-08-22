Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D22099026
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 12:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbfHVJ73 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 05:59:29 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41099 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfHVJ73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:59:29 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DED75240015;
        Thu, 22 Aug 2019 09:59:22 +0000 (UTC)
Date:   Thu, 22 Aug 2019 12:00:51 +0200
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
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
Message-ID: <20190822100051.yhguosvfz3zzykze@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-4-jacopo+renesas@jmondi.org>
 <CAMuHMdVXQaqFg-m3a4xTiKLWQLz+itKQgGEBAQpHtG+MkTNzQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="42s67wtln7iyyikt"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVXQaqFg-m3a4xTiKLWQLz+itKQgGEBAQpHtG+MkTNzQw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--42s67wtln7iyyikt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Wed, Aug 21, 2019 at 02:16:02PM +0200, Geert Uytterhoeven wrote:
> On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Update the 'vsps' property in the R-Car Gen3 SoC device tree files to
> > match what's in in the documentation example.
>
> double in (no worries, I'll fix that up myself)
>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.4.
>
> BTW, any plans to add channel indices to the vsps properties in the
> remaining DTS files?

According to what I read in the parsing 'vsps' proeprties parsing
routine rcar_du_vsps_init(), if the channel index is not specified, it
is defaulted to 0.

           /* Store the VSP pointer and pipe index in the CRTC. */
           rcdu->crtcs[i].vsp = &rcdu->vsps[j];
           rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;

The DU bindings documentation does not state that the channel index is
optional, so yes, it might be worth changing this and simplify the
parsing routing to always assume the channel index is there.

What does Laurent think? Is this worth the effort?

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

--42s67wtln7iyyikt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1eZ9MACgkQcjQGjxah
VjxVOw//dQJQ84fYnCIy7Da9eeUQ2Ymw8guYdhdfL3HqgI1d8U/aY3bgKGb/vbpJ
1SFry3IwJE+TyHuBrcjPTeEZSh+Skonel+vSHhtY73AbrBFXRrsnqv4CAcALPQ0r
nKpcEcnYvVjiefyBYhRJz0NHqhFXDZCorx7B3RluqQjvPIwBZR2GzBg5QgXWML5z
nxSFhwZh58x7ViognfTeNaLocasH8LaKZ+JkBRBooo5xz7LdIw8Gevk4gkzCUTj9
OdzRpG5DQjDl/J5X3iZKJ0T7DU9pPiYjWtEntlgVp6JPDZjxXUL0xyKInVEE9qrJ
Mz3lpFw9Ea151LYjeu0uJUUpMP5RmxOSLjRXxssx0dT2/+x99re5ySvepJmah/gg
S3TF5R6mxaz8i1lheWv7ZGs5cndbiP94bCOoveDUgAqmfhjMeTemX/4HDwmnYNoH
RLLNuW7rG02uIE+biT+ZiD/TIpH4wNb4kwtpjPVXc/jXBcnFlaIqqv/IWKsLLHpJ
hrtxX0EGDTjlmRu/RAh6D2B6YV2OPq3SWKaSl4CTA2Zk9usALsb04HTL2rfBokJN
MNZfduNE0QohpNXhKZXdV3PkljURWaJl6Mb1dCGotDzY5bEZjkp2ssHtcGYut4n6
8qy36cjJw+IRPy65JA8BUVdcAEvaZjdVOCcY5hQnsdw+Ff7jmtA=
=hvs1
-----END PGP SIGNATURE-----

--42s67wtln7iyyikt--
