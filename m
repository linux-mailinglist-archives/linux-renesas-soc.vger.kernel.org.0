Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C53C1B5B97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgDWMj6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:39:58 -0400
Received: from sauhun.de ([88.99.104.3]:34006 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgDWMj6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:39:58 -0400
Received: from localhost (p5486CE55.dip0.t-ipconnect.de [84.134.206.85])
        by pokefinder.org (Postfix) with ESMTPSA id 5F81E2C1F65;
        Thu, 23 Apr 2020 14:39:56 +0200 (CEST)
Date:   Thu, 23 Apr 2020 14:39:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3
 revisions
Message-ID: <20200423123955.GB1130@ninjato>
References: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
 <20200423122448.8099-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdW0OuHy4ikQz3oY+koqLskXtcXJkUVLZYqsW+niT1pLDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW0OuHy4ikQz3oY+koqLskXtcXJkUVLZYqsW+niT1pLDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Usually we don't add soc_device_match quirks for unknown future revisions.

I was just following...

>=20
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -711,11 +711,17 @@ static const struct renesas_sdhi_quirks sdhi_quir=
ks_nohs400 =3D {
> >         .hs400_disabled =3D true,
> >  };
> >
> > +/*
> > + * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as =
of now.
> > + * So, we want to treat them equally and only have a match for ES1.2 t=
o enforce
> > + * this if there ever will be a way to distinguish ES1.2.
> > + */
> >  static const struct soc_device_attribute sdhi_quirks_match[]  =3D {
> >         { .soc_id =3D "r8a774a1", .revision =3D "ES1.[012]", .data =3D =
&sdhi_quirks_4tap_nohs400 },
> >         { .soc_id =3D "r8a7795", .revision =3D "ES1.*", .data =3D &sdhi=
_quirks_4tap_nohs400 },

=2E.. this example here. This also applies to all future versions (not
that there will be any), no?

> >         { .soc_id =3D "r8a7795", .revision =3D "ES2.0", .data =3D &sdhi=
_quirks_4tap },
> >         { .soc_id =3D "r8a7796", .revision =3D "ES1.[012]", .data =3D &=
sdhi_quirks_4tap_nohs400 },
> > +       { .soc_id =3D "r8a7796", .revision =3D "ES1.*", .data =3D &sdhi=
_quirks_4tap },
>=20
> R-Car M3-N is r8a77965, not r8a7796?

Right. $subject should be M3-W :(


--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6hjJsACgkQFA3kzBSg
KbabIA/+N+yb0s8v0ZbJBAHGRiKa3m8F/eXWO83uV4BHwt3+TiRFhxmyg3CWCllq
/XjAGPSX/cM5xxJpCVw46rfbTVvS1c7EnD8A+Gbx5BPCowYGBVTViXl62sAAmcG/
tr4mSblRyk5ApNz9VTMH9vvumI6T4/3OGGCAG+BciHK/B3E9c0pVOmARjr7TLh/5
iFQA6kyk13AXEhczqLjxDTxOjgES2qit41ruc0itkthbQ42Gup8D2Mc68xM1f6OJ
a+klFUCpJmooJw+cJ0Q/AD0jd4m3mp/dO2j7z9TlRgmgZKgqKCRrcXKE93CVF3Yf
I/MvdC3VacTNQCt96ajQFTcSAHR9Qv6LVvpkmombQ5g7YJub7tGZmeVnpirR+pfb
B/cOkRZD/9iOIO/seg0qGzc21PQvHDbqQilNmxYmsjTcpkw+UrumyVJvtR16amEz
yUybeeDXV7eM6qmX6YSP+UZQI+6p1SvHyrM5uutcPrPrluPGOkoq5KONqtgIkGqd
LCpLwpIbXYvicjzel2PO6mfdut7ZN6eRJSETRon8K6ZV3fCRgNUY1Iww336ZVhQQ
DvxurCiUdhYz9jvVRYDAVPTDWyTIckBltHJVmvnxVgoNsULNr3L6tuwqwyZJGSZm
3XeAw+G9Q+C8YdnHPtblYlZJlO4J37W6peZ1jNQaqFsd5eJGyAc=
=rd+I
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
