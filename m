Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167769CB26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2019 09:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbfHZH7T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 03:59:19 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52027 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730136AbfHZH7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 03:59:18 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 44952240008;
        Mon, 26 Aug 2019 07:59:11 +0000 (UTC)
Date:   Mon, 26 Aug 2019 10:00:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190826080042.grvat5ne5dgi44gk@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
 <CAMuHMdV6_VW-2BYYJ3yNi1i81n2Oeh+Hw+J6ohgqkmjsEjhX+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="byx4x2dvjzmah7mr"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV6_VW-2BYYJ3yNi1i81n2Oeh+Hw+J6ohgqkmjsEjhX+w@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--byx4x2dvjzmah7mr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert.

On Mon, Aug 26, 2019 at 09:28:56AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Sun, Aug 25, 2019 at 3:50 PM Jacopo Mondi <jacopo+renesas@jmondi.org> =
wrote:
> > Add CMM units to Renesas R-Car M3-W device tree and reference them from
> > the Display Unit they are connected to.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 ++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot=
/dts/renesas/r8a7796.dtsi
> > index 3dc9d73f589a..8d78e1f98a23 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -2613,6 +2613,30 @@
> >                         renesas,fcp =3D <&fcpvi0>;
> >                 };
> >
> > +               cmm0: cmm@fea40000 {
> > +                       compatible =3D "renesas,cmm-r8a7796";
>
> Shouldn't you add "renesas,rcar-gen3-cmm" as a fallback?

Should I? Since you have suggested to drop all per-SoC compatibles
=66rom the driver I guess so...

Thanks
  j

> (for all CMM nodes in all DT patches)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

--byx4x2dvjzmah7mr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jkaoACgkQcjQGjxah
Vjxk9BAAua/Lo8u8Uv99rrcKQR/5g54+iAKH8Yl7LE/b4VVrCOQL1ijEnmCnB43X
SAlM5x4M1cKUU8lNiqrZd79I927wzCXNe/2D1PbKVBKlaz1kzKNxkOdcrbM7ZTiy
TiHPO9HOXBV+EbSt1aM2XlwPXg7n0evvy4rZxOx8jfY2Qsx4GZyofTJ74I3i7lr4
K80DSEjpi8nOgMLrrcO/31z1iClDwNH0so6q/6RCXjK0bE3ZzSvDQ8pQYFcvogFr
NmEwKfzW4yiP5AeLanHGgh9Ck6fdknPmJLp+EL43NxEG5z6TAHRQ4lXRdpbGfh2I
EgRykocw7PJsWrLTKJ70V8avVo1TWYRQHu8qneT1wBXhEph3ZqB+TLIzlwQWQqjq
SiePVKKXqQNc+BI7kbyPNPgBvhSsoq4q+Fu5Z4/rjZM15zTyaUT4Xedr2ysS+7Yb
Qfpw1T2IfSoBmWJU9FnNZeshjKBydVqY7gXtFZ96pLJayerrhfaEAvGMnqTWA7sE
HYX5obQlYFyXA+IufnePDlR1U8Q2o2x3cmq9/VafYw82Vp0xcedqhZ2ojQHJ4oM3
cZpiXB7e7FWQ1vAVWIgzjtDyhvbKKqcHDxS88w2niAQHEIbk/jQW2QZsnhgtb9oW
ulTLyNIK8ZcsM2LKKGHTv9Nhl17IX45GSUf+rogGeAhrosjJ5Ys=
=oKOX
-----END PGP SIGNATURE-----

--byx4x2dvjzmah7mr--
