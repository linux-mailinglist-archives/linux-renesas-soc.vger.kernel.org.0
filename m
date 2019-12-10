Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFF3119CAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 23:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfLJWcj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 17:32:39 -0500
Received: from sauhun.de ([88.99.104.3]:42960 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728109AbfLJWch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 17:32:37 -0500
Received: from localhost (p54B330BE.dip0.t-ipconnect.de [84.179.48.190])
        by pokefinder.org (Postfix) with ESMTPSA id 637A22C0616;
        Tue, 10 Dec 2019 23:32:34 +0100 (CET)
Date:   Tue, 10 Dec 2019 23:32:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 0/2] mmc: renesas_sdhi: add manual correction
Message-ID: <20191210223234.GE8683@kunai>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline
In-Reply-To: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 09:32:58PM +0100, Wolfram Sang wrote:
> Add manual tap correction because the automatic one fails for HS400 on
> Gen3.
>=20
> (Limited) testing on Renesas Salvator-XS with M3-N and H3 ES2.0. I want
> to apply more testing before sending out the real versions. Yet, release
> early...

And to keep everyone updated: I think the BSP patch about ignoring DAT
correction error status should be folded into this series. I hope I can
finish RFC v2 this week.


--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3wHQIACgkQFA3kzBSg
Kbb+VA/+PQCkj/2LeSJ2zCpq2e4mSDOzEg0kCAFiEbBn87ZWhjYGViPSfWrO0HcK
kqoeDsozOrOFCcxcVdmVjILwRf/NtJEAovpJsTa8HGQDkLNZPZM0Nk+fBgv+Pfh7
nugvOaih7JQYLDDMGIbjI+rSzW480NxtSF0FtigHkah5jT7cFWJInL+T4leEbukK
pGB3Jmgck/nV3jENLexfbqczpZ551phHt0zOjjClNz5Uy5rkA7zdX1Iuo3ff6BJo
ERdksHpCoAQSsqfQvB9e87/nIk94eZkQYfVp9zflpwF8CCZEN1gv2E1RUYZ5yVg4
fUsynHwBe0SOhBIqFk3X5fwESrhUGsucVYy8T5eJ3w64vWCRsovYtRaECAFQwGjs
ZgQ7nbTkUA3l9nVh8jGL5qffBxm8Rd/RCgVov+ztfNy6uroxzdiLLEHrULOmRftO
arPfyzSZe+9ZsskTR0oaNGNhSe0meTWbefNn0Psx8P71658y1aiWu3w69m4w1fJU
ej24QqECTG5crv7ZihX0Wj8Uu5zSJXZqR6gsflovsnPodsFe7Y3zYKZx8q6SxBJt
qdPhdJTBIbNPX8gNqhXfZZTLbKv2NA3p9lTMBjFWscz+CU01L6DLMJ6jlSlMr1EK
i+phn7QwBg0/PCICYGd0jr+DQ2cjIw2XO6u54XlP01dwxOEBfkU=
=CsMG
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
