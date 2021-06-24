Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28383B2747
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 08:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhFXGRF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 02:17:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230393AbhFXGRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 02:17:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6FFD60724;
        Thu, 24 Jun 2021 06:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624515286;
        bh=sfXoSPR0F1FKGuGgJ6WBE95/HX9EkIOuv1LvM4cDw7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G6OaMt7Z5Mg+E4Ox2Y1OG69OFOx7LTs+HAoyjWIXNW0BVGRksG0YJ0Ba+BBcmZadq
         WjLvqYJWr1/y/ZqqUJtrAeVCU2dVmU8unIrAsIJn0K6V+N41IyQjejFmIeN/Arr6BD
         XEzHlp5uRaP1HIXEpAyhymAaGbk8aT0x/g0Cw7Nh1YB6QcEgI/m51jTX0KXhVjULub
         XEZ6blj4kg9lJrC/GNOYzfUZiKzZ3octSBLGrEL33Ba7/0ckG4X6oyMhjJXLHR03Qb
         wuNlj+B1Ltsr0vp/O2XICiZKhTYS9bbfRZ2TLGcR3tsZpclDfnIZQdNaYeD6lrDSzp
         IxGC34ZBVcCBA==
Date:   Thu, 24 Jun 2021 08:14:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G
 and M3e-2G
Message-ID: <YNQi0w4zsG01ezgu@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
 <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
 <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
 <TY2PR01MB36929E0DE956A374B8CF5EE7D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HFmu9+c2wn3iw7rR"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36929E0DE956A374B8CF5EE7D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--HFmu9+c2wn3iw7rR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

> > > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > > > @@ -943,6 +943,8 @@ static const struct soc_device_attribute sdhi_q=
uirks_match[]  =3D {
> > > >       { .soc_id =3D "r8a77965", .data =3D &sdhi_quirks_r8a77965 },
> > > >       { .soc_id =3D "r8a77980", .data =3D &sdhi_quirks_nohs400 },
> > > >       { .soc_id =3D "r8a77990", .data =3D &sdhi_quirks_r8a77990 },
> > > > +     { .soc_id =3D "r8a779m1", .data =3D &sdhi_quirks_bad_taps2367=
 },
> > > > +     { .soc_id =3D "r8a779m3", .data =3D &sdhi_quirks_bad_taps1357=
 },
> > >
> > > Could we reuse the entries for H3 and M3 instead, by dropping the
> > > "ES3.*" revision ?
> >=20
> > We cannot reuse the H3 ES3.0 entry, as soc_device_match()
> > works differently than of_machine_is_compatible(): the former doesn't
> > consider "r8a779m1" and "r8a7795" equivalent, the latter does.
> > Same for M3-W+ (no explicit ES3.0 there) and M3e-2G.
> >=20
> > It's a pity we still don't have a "quirk-free" SDHI version on H3
> > and M3-W class SoCs (waiting for ES4.0?), as that would allow us to
> > just match on "renesas,sdhi-r8a7795" resp. "renesas,sdhi-r8a77961"
> > through the driver's .of_match_table[] instead, which would work for
> > H3e-2G and M3e-2G, too.
>=20
> Perhaps, ES4.0 will not be released. So, we can refactor the driver's
> .of_match_table[] now. I investigated this a little, and it seems
> we need many renesas_sdhi_of_data for each SoC instead of
> of_rcar_gen3_compatible. But, I guess such modification is better
> than adding sdhi_quirks_match entries.
>=20
> Wolfram-san, what do you thinks?

I don't fully understand how the refactoring should look like? Is it
moving 'struct renesas_sdhi_quirks' to renesas_sdhi_internal_dmac.c and
merge it there with renesas_sdhi_of_data? Is it really better to copy
this struct per SoC? Most of the data is the same.

Thanks,

   Wolfram


--HFmu9+c2wn3iw7rR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDUItIACgkQFA3kzBSg
KbZoJQ//X5zWVR2dFxi3uvFr2vfzBnR4UbkgSgXo1946ErJ1+OQfzv/BhzHHCVor
gSni9p5zZweWpEa7Tq8SdV0oHq3DUvIJ8Texe/x+UpFh2LKF/keMqRIpZjSC2AO9
0e3jtGjXyZQEZE5TkNdGysi6EN9TEVK9983GoIuDrBaT2vPC49AchNYfkGm2mvzK
oeJtCIjZEEJoh81TjxbGa+LxVXy1+IAZ/jFY8eMPrysmSlLrd+b4O06RqGE1Nug0
K+sbc/TTSmI8qmfH3tPRC7pm4IC+4YQILx1UR2kojWdStnEOixvbOhn00rh1voOL
M5tz9KB7TeoNNvhPbZiNoGqqwDMJnx1V2sgnj+RbgGr1OHEu0Y0XTDYfHp9/j+Wt
h2JSMSfS2nJ4XS8hZxr0dreq49B1vacPfarEwUv4uvpXYJFhOzM+3gA2I+OYQbwI
gBRzHs86j2bE3IfXEuAjlAiHhrfWE3CZpTRp1jetJen+P1PgP+9uSgl3RIhnO5Ay
bywr876xg2UYPdX23rzyfWm4dcF/Hw1S+uFWuqmQLhDC5etdurz0elLJVoFr9c+w
r0KVg1A3UBXlZHctMpUxd200OGkMh9ZlgxwS2NUnyy6VtU9IkgfhAf7LRbQiFiKu
W3bihOh3FuvRWw/tD1Tb8Tb3N6LDoC1AY0jLNNeyZxU58MZD77s=
=riIz
-----END PGP SIGNATURE-----

--HFmu9+c2wn3iw7rR--
