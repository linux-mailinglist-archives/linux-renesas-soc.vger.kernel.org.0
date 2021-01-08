Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52BA2EEFCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 10:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbhAHJnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 04:43:00 -0500
Received: from www.zeus03.de ([194.117.254.33]:48852 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbhAHJm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 04:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=gOYwXo14+tF/t3ehP5YDEMSGmk4v
        LbbhZ+rjFrNvn1I=; b=R0gwzNtmzgomN4u/AojQmokheDR3NPeGUpmGQ3l/xU/D
        sFv+Sy2v6e1Ncfib0bLoJq/I1VcreUVmxU6iM5Fkg2oMOeN+VqteBhpirSV15DI+
        AA42fjtVhi0gJ0AtbGlci3dtUO6WPu9zfbznqPkph/gTjpM1ZYULs5uZwxorTXs=
Received: (qmail 1048817 invoked from network); 8 Jan 2021 10:42:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jan 2021 10:42:17 +0100
X-UD-Smtp-Session: l3s3148p1@kks5X2C46MAgAwDPXyX1ACWcscxtZ2TX
Date:   Fri, 8 Jan 2021 10:42:17 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [RFC PATCH] arm64: dts: r8a779a0: correct reset values for GPIO
Message-ID: <20210108094217.GB1223@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
References: <20201227121925.8431-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWVtACtyoQgxKTWpw_4xS-B1knkGOVU-7DpNzG3uoG-RQ@mail.gmail.com>
 <CAMuHMdU0rxV5cBLvMJp_8i6kkyL3mTdQU-uXny-eN3CcBFxeiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0rxV5cBLvMJp_8i6kkyL3mTdQU-uXny-eN3CcBFxeiQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 10:06:51AM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Tue, Jan 5, 2021 at 1:19 PM Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Sun, Dec 27, 2020 at 1:19 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > Because the datasheet is ambigious, copy over the reset values from t=
he
> > > latest BSP.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> > > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > @@ -110,7 +110,7 @@ gpio0: gpio@e6058180 {
> > >                         interrupts =3D <GIC_SPI 832 IRQ_TYPE_LEVEL_HI=
GH>;
> > >                         clocks =3D <&cpg CPG_MOD 916>;
> > >                         power-domains =3D <&sysc R8A779A0_PD_ALWAYS_O=
N>;
> > > -                       resets =3D  <&cpg 916>;
> > > +                       resets =3D  <&cpg 1331>;
> >
> > I doubt the reset topology differs from the clock topology...
> > Let's hope this will be clarified in a datasheet update soon.
>=20
> I wrote a small test to check which reset bits reset the GPIO blocks.
> I can confirm the original resets values are correct, and using the bits
> marked PFCx in the Software Reset Registers 12/13/14 do not have any
> impact on the GPIO registers.
>=20
> So the BSP is wrong, and this patch should be dropped.

Thanks for checking!


--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/4KPUACgkQFA3kzBSg
KbZQ3BAAnfZEQDvWpX2UZKyL9NnOcPUvB/dDi64us7a7OleRvm+35pX6F/pvAMey
5mh+S4Rh5yQ4o+BCXKJhAnX2D+1F2eSS5cd00/Vm7XMh9u4fxipmd2gANgeXokcO
47dpcBdjDrknii6eZz8/2cIcD5po0TM0M9/Kd2WROu/KcjcIYG+JP9CUTnaAYVwh
bvoOUaXUZGHh52MjuZfc+9xRR0iN/cOBOWasoEMoKOzMxDS9y1qDoQDIgSSOCC4a
Hxzv8qlw9F8CM4cOMT65PpRCWdSAVHo07cJUJhC3DLN/WcZkD1dTvwsoLar2FBdX
XH2qMpUrnn4pe8Am9pwAVtXUBHKCcwyOzrnSvy6GCNwBsBYG1Zz2T0MYQ8/0vNQS
IyOm95/1jxX/gngSwM5faxIxZ6sZ/vH40mYe1i7lWK3nByffkhrNk26X9a2jvzRT
ypXTAgdRrcCxLiOKHp56KDZglV9oB5dMmlF3FtjwJv1kjkY3gh9jbxWu3BDMkBd/
pOKK4jBcXEQIB19HiWliovzHKebNS3lYJRcifHYUEmIQghCy3OzRoMrsq4It3Bjx
fm4dBEAhY6wu5HMwa4BMYGfT2G4tddzh21PFQtRwUMvqGrtEJP3S92qvTBjBxCZn
+8L+nczXWq27qr3ZGiFae88jCQRsICuSlV8fDXydGNc9Vup5+oU=
=Z7dl
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
