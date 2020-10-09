Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BF0289017
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 19:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732979AbgJIRgf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 13:36:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38864 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732880AbgJIRgT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 13:36:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B4C5D1C0B88; Fri,  9 Oct 2020 19:36:17 +0200 (CEST)
Date:   Fri, 9 Oct 2020 19:36:17 +0200
From:   Pavel Machek <pavel@denx.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        linux-leds@vger.kernel.org, dmurphy@ti.com
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED
 indication
Message-ID: <20201009173617.GA31847@duo.ucw.cz>
References: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200907155541.2011-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201009073349.GD10335@amd>
 <CA+V-a8tEtQwfz=NstFdBXdJiSy4-QJDoT5HjOh1kgUbuFpgs4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <CA+V-a8tEtQwfz=NstFdBXdJiSy4-QJDoT5HjOh1kgUbuFpgs4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thank you for the review.

Note I'm LED maintainer.

> > > +     leds {
> > > +             compatible =3D "gpio-leds";
> > > +
> > > +             sdhi2_led {
> > > +                     label =3D "sdio-led";
> >
> > This should use appropriate label... probably mmc1:green:activity.
> >
> $ grep -nr mmc | grep -i activity
> $ grep -nr  sd | grep -i activity
>=20
> Results in 0 outputs in dts folder.

Well, so does

grep -ri label.*sdio-led arch/arm*

:-). Feel free to suggest other name following documentation in
Documentation/leds/leds-class.rst .

(And yes, we have lot of work to get this to some kind of consistent
state).

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX4CfkQAKCRAw5/Bqldv6
8vDQAKCmQ65JgESIKoQueOHDnt0GT/ed+wCeMw4yFiNFb92i8yk1tZxZ7oqqZFg=
=d6V6
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
