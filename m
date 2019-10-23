Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C9FE1F08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 17:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406499AbfJWPQb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 11:16:31 -0400
Received: from sauhun.de ([88.99.104.3]:45168 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406466AbfJWPQb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 11:16:31 -0400
Received: from localhost (p54B33207.dip0.t-ipconnect.de [84.179.50.7])
        by pokefinder.org (Postfix) with ESMTPSA id 6076C2C001C;
        Wed, 23 Oct 2019 17:16:29 +0200 (CEST)
Date:   Wed, 23 Oct 2019 17:16:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Message-ID: <20191023151629.GA5153@kunai>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2019 at 07:49:04AM +0100, Biju Das wrote:
> This patch adds SDHI support for RZ/G2N (R8A774B1) SoC.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

But please keep an eye on the patch which Geert mentioned and check with
your HW team if your SoC needs this, too. (You can't really test that
without a very specific setup)


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2wbscACgkQFA3kzBSg
KbbMlQ/+MeBwFVzaqf6EXCE6bn2GRx7vqw6OJTMHp2l12gOWR2FB3mhkouj+hoOz
T1TriugqHs8Zhbe04V+7cmFQycYkp1MbUcgpoR/DgvW0siAvLQNbTmHkPo8JedB0
dCZWrQpNQ/DjDnM5BNTQmBYDPX0TIe9S8TWB05qjocZOuv17ijh8cIXq49swxy8l
1vouhorQ0KJpES8DiDHwYDlOpd5EAUSgMrB0E9X+y0xSXscV04P8o5UCmSdZ8Bjr
SezS7wUp4kQTaC1zYsCc/Q/NSoWNansgb1p/EycI89RB53FI8FjxwaaqgYcQYYTi
44vT9YrRENWaRF5w4PS3Q66QROMJhQJqAiCiEAcn4LGN4QFeWUVAsiSHVmKJHLbs
+xml1vWbq8h99/Z+fOGdKPTSyhQYlwpcPEmXWZafVicVInqrujn1P/sosvENAqOw
ZnHbaDXbabtwfpHY7iLNMRRzMvnoq74Hcwkiqv6dLaYy2Yr9wk0+ZVt6CTKlPN5V
knf0x/ZGWBO7VHlOkN8HggzvRvO/NH+R0cw4vKvBl4foqQm2Ep/f3bug8Yb1vGMe
Rc8l40/WrEBsNhGlrEeWQPfj2SMYosvw3wdybGS2GftWe/JS5PErtRQKt5jYZ/Cp
VPNwbwbgkD0NHZ1+hNKn2r/h4q8M4ACsOiPAICUgbi6XPbnbndg=
=3foK
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
