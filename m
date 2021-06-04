Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622D639B9AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 15:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhFDNSg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 09:18:36 -0400
Received: from www.zeus03.de ([194.117.254.33]:57230 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230320AbhFDNSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 09:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=GJ6mYVey0kuWXGMwYlHVXTGba1FE
        PLY/KPOqrPz2Tmw=; b=m5Gxj19J5ohjqR1UMCHl5IU+fhoStfW6W4/otHhzhvkg
        bUeU3PXM5zfLGfymWMSxtVdqbHf4CriJ6NiDEN3G/yhOeqXpZfNB/rB83emHx2T0
        9tyH4ufc4HkCC2Q7H1FQoEShVx8QsKcC15Rd5tRQ8/qRCmh5QB6rnZFxZwJaXjM=
Received: (qmail 1372524 invoked from network); 4 Jun 2021 15:16:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2021 15:16:47 +0200
X-UD-Smtp-Session: l3s3148p1@VpvRgPDDsKVUhs97
Date:   Fri, 4 Jun 2021 15:16:44 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
Message-ID: <YLonvKsHCjtE9W9x@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V029sdB+NFooXkMl"
Content-Disposition: inline
In-Reply-To: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--V029sdB+NFooXkMl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 02:59:43PM +0200, Geert Uytterhoeven wrote:
> R-Car M3-W ES3.0 is marketed as R-Car M3-W+ (R8A77961), and has its own
> compatible value "renesas,r8a77961".
>=20
> Hence using soc_device_match() with soc_id =3D "r8a7796" and revision =3D
> "ES3.*" does not actually match running on an R-Car M3-W+ SoC.
>=20
> Fix this by matching with soc_id =3D "r8a77961" instead.
>=20
> Fixes: a38c078fea0b1393 ("mmc: renesas_sdhi: Avoid bad TAP in HS400")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Great, thanks for this fix!

> Boot-tested on Salvator-XS with R-Car M3-W+ ES3.0.
> No difference seen in eMMC/SHHC detection:

You'd need some stress testing plus debug output of the TAPs chosen to
actually see a difference. However, the patch is obviously correct.
Testing if soc_id actually matches now is good enough.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--V029sdB+NFooXkMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6J7gACgkQFA3kzBSg
Kba9fg/9G492nlxXSXGTiKoz/SO/SZzQ6tnz8V6xN/hhtUzhAAxx0rtF2WVlgaJ7
bDatxxd38ZfneHbaP4uYpPhcfEifMXkUIyw006JTWEzKlCIOLgjGikDT13vBM0ed
bXI6zUkciSTmjL+rFkY2AF3N9jfb4G9Y4bBWW0i83VgkuAR2pkueOS/QpE5g0ZZq
8jxQt5tUT/dmx6Jb9Bd1EhUXx3ZurKmroG5s8Tw/G8s/bEA4fniDHu1dHZKwVPs9
Gvl/+RttmtPmltjEUyyG4MGeUBeVbi6XHs6E18boEZAoaFDNGxcRzN4Mtm6+xgAo
Vbgg7W4WIFtOpMC9yYyFxwuYj6NjlePY1kzlG3S0Tjc/NiVVte2dielsbw9BD9/v
HpfFwH3oh0H5tsi05oazlixmPNfUtWi0TvB+ypr+OhVLwcwt2X0XMmMrLQm7P/XD
kNkoa/CkHF4cUZ3gYgjFQN6xEi189HvFN0r8zV6Dh3av1p6YbkjtPvgBZIhkIE8Y
SlXUntzfdj5vl/oRqumt/sWXzYN7tbKryqWf9D5qm995mJgMp49viJiAqNyhZ8tA
Fh3KfwLHJLReDpjlxAURgEYKd0DmTIMMPr9e+ai/QjFlTIW88YQKnREXNtgVTpfR
EKA3rWC9WiHIDGYTr1NWfnCCUyQcS3wIzGmLeDEfBFSkmBDBeZc=
=tvKF
-----END PGP SIGNATURE-----

--V029sdB+NFooXkMl--
