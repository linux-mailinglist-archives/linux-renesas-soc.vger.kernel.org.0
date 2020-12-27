Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5632E325B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 19:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgL0SNr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 13:13:47 -0500
Received: from sauhun.de ([88.99.104.3]:59600 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgL0SNq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 13:13:46 -0500
Received: from localhost (p5486cb89.dip0.t-ipconnect.de [84.134.203.137])
        by pokefinder.org (Postfix) with ESMTPSA id 500742C04B3;
        Sun, 27 Dec 2020 19:13:04 +0100 (CET)
Date:   Sun, 27 Dec 2020 19:13:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 07/12] pinctrl: renesas: r8a779a0: Add MMC pins,
 groups and functions
Message-ID: <20201227181303.GA48782@ninjato>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
 <20201221165541.27679-8-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20201221165541.27679-8-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 05:55:36PM +0100, Ulrich Hecht wrote:
> This patch adds MMC pins, groups and functions to R8A779A0 (V3U) SoC.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I can access the remote eMMC just fine, reading & writing works.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/ozq8ACgkQFA3kzBSg
KbaJYA/9Fb33hm/by9hPQW7CQw7qIUVAL4JRLOgJUv7lJiOIUkjk4qhC5+7g1TVU
m6ool89ShJX3Y3T8PGHz+eZO+mBSpr7M0sKXFwHu8eQJJe6JOh2mAoBe4lVGdGry
JAp5HpAZBDhap9FWAhemA8BCBjvLKx5ys7sL65R5uUs+C7i6H33ic1rbLehwiTmL
ftBaJ7r+acsTEYlMco8DBBlFYus4dLpegA4/fyzWH6RdnVpjhEaCMgZBi1kDFYcC
D5aqXEBVqjePaGfVQekHOHtBdCBJjQmpejxQma5YfA2UZaz6eIyjKEk5DoN1lZjP
IvAD8uJdLmBfcUGXl02HIfRW0JmL7wDhkwzxjNrn1S8uBj++l+5smDeRZ6PnZu9t
7khwy5zLvx4hzls4Id+CAv5J7JSTWHLc2JT4SW+GAAZqKDGfEGQaQgSJ4eqWGy+i
mXuiimeL9FqpgY1FAqiIszjalXaygiBzTGPGKrpwu7PetRFzpiljxMJ8V6w3xFoQ
neht4nsC3LE3P40ySqycssmy4B/vvGSz6QKyhJwmp3C/Ge0TrKoQznZsWiK/BMdk
LCfOsiZQjyjalOoMtX2YOj1KUI9PVDZE/9KKqJVCGkdwL6AfSV1srRdUelfFHeZy
nYU0J3c6O+eOD/T+TBIxirUAEOqHKZKg8dYVRAqS8T9URJE79ug=
=aibq
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
