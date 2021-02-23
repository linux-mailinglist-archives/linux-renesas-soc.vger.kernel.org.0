Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1193228B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Feb 2021 11:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhBWKRx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Feb 2021 05:17:53 -0500
Received: from www.zeus03.de ([194.117.254.33]:51588 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231799AbhBWKRw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 05:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=iClqYnFJ5jndIZkRL8nZCTTZiauO
        AmKqtLat/qOoGxU=; b=PIVGDXxXWkutzjWcOp1fWieq4OwVT8tX5+rX3aJGjAum
        La60oVAEZU4YZVU7euUGtX+pkdSSem+UUiXdaaEvu5VCeywNHEoB2H2nZwqBko9/
        KKFr+1yn+2YvCrF7bd7XuGV7gcTzwA03jk0+SF/uv9PDK6lth9v7C3BWhdwwYcA=
Received: (qmail 2597289 invoked from network); 23 Feb 2021 11:17:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2021 11:17:11 +0100
X-UD-Smtp-Session: l3s3148p1@KjmyOP67NIMgARa4RdeBASWYxunz7zkl
Date:   Tue, 23 Feb 2021 11:17:09 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH v2 2/2] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <20210223101709.GA2486@ninjato>
References: <20210222113955.7779-1-wsa+renesas@sang-engineering.com>
 <20210222113955.7779-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVFuof3C7JPw9BLUM0vBaiD+ZpUX2nSf8hiAZ4qw9doSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVFuof3C7JPw9BLUM0vBaiD+ZpUX2nSf8hiAZ4qw9doSQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> "if (priv->rstc)" if the reset is made optional.

Yes, that would be better.

> > +       priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NUL=
L);
>=20
> devm_reset_control_get_optional_exclusive()?
> + missing error handling (real errors and -EPROBE_DEFER).

OK.

> Perhaps you want to add a "select RESET_CONTROLLER" to "config
> MMC_SDHI"?

Isn't "select" too strong for an optional feature? I'd think so.

Thanks,

   Wolfram

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA01iIACgkQFA3kzBSg
KbYawBAAm5dMf2/ksXxYKM5CO/CXTDlPzDaHro7jPEYwb8gA/s8sIwNlJxN27q/F
lHMT+5hd1OEIN8V/HhRAXgzdT9RP3M0B94Il95C+B9KQo0iHSv1b3BaaFPTpl+oU
jAutaEbaI1bgEjODENy4dPKHkwDG7jwVEnNLjGSjpx23IEyPyppiAn3irh3/0K5m
IZLq1zEFQ5jK42bUVDqETh3eg8eKyc5Q+FveQmtXxSiG0a51lPoWUZyq99+MJ47/
/XUPEuutKliJzHfXOO3ULiQ0RDczhfeNMtkJ2Bw6mundOfi7CGXWs9LEfG9cAfVZ
k/CmG4tYJ6NJE/G9AcV9QRq8f3lWOo8d+5MxLaD94siO7D8Z/CE/LbftFWbETObu
DHAs1y1F+sg7ae3BVZew1JgL9oYqvMso6ogR1S4AeVtwqOKO/ybS8yxk67aNetz+
WoLkoRmppNkQpwC0ytCjIXSxvjuKTTY30fdQhS+BdNfrsk/sV32fFjCeStFmGcJ9
WTrPpVPmUCmIpmq5EPJub1D38urDraUYdJZ1pJaPPV4N5yJyON9yZVR0vsdO27s5
vCj2/DinqPnZHj7PYgH/vhcCwp819/E99BFej1j2uZBWH3amuymORJwAbwoFwtpQ
SOoPE3DRNlmzldxHOCUlc9dzOqky8yCMjA9cyL3puXNMsIXh7U4=
=d+SM
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
