Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4602883E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 09:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgJIHsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 03:48:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51942 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732295AbgJIHsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 03:48:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4A6511C0B88; Fri,  9 Oct 2020 09:48:10 +0200 (CEST)
Date:   Fri, 9 Oct 2020 09:48:09 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Add support for MIPI Adapter
 V2.1 connected to HiHope RZ/G2H
Message-ID: <20201009074809.GE10335@amd>
References: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201006112701.11800-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
In-Reply-To: <20201006112701.11800-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> index 000000000000..c62ddb9b2ba5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapte=
r-2.1.dtsi
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0

dts files are normally dual-licensed...?

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+AFbkACgkQMOfwapXb+vJhUQCcCnk/rOgedQZB419VdeB8rDzc
Q2EAoLyCNfXl+u5ArDL45fLrPFFEHqQp
=2YF9
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
