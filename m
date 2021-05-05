Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70458373566
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 May 2021 09:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhEEHOY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 May 2021 03:14:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:50220 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhEEHOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 May 2021 03:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=tU/9Tu1LPJ8IbXSp6KGzWXrq7iJv
        FP9Px27Quq1K9Hw=; b=uUOzXV+FpZESd8+JT9BGDPV8GmMixtDs1TsUFsdEhahG
        LYOjRmNTDEe9FpjjzIGHqPwoTf/uiqLYA2kkOnRNd4QKFYDiT+XcyiMw2dp0Zvwx
        XmUl6d6GxfwLxeXWSonOkJDetbrzdyqPGLtT3ytpO7QIEhk5/8qrPWGdfJQFQNI=
Received: (qmail 1676812 invoked from network); 5 May 2021 09:13:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2021 09:13:26 +0200
X-UD-Smtp-Session: l3s3148p1@2zIo7o/B3qIgAwDPXwRNAK21Lx9NnZcs
Date:   Wed, 5 May 2021 09:13:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 1/2] ARM: dts: r8a7778: Correct internal delay for
 i2c[123]
Message-ID: <20210505071323.GA1009@ninjato>
References: <cover.1620138979.git.geert+renesas@glider.be>
 <1eac63f15a776e492ff8a2d8447c5e1019982dd1.1620138979.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <1eac63f15a776e492ff8a2d8447c5e1019982dd1.1620138979.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:41:24PM +0200, Geert Uytterhoeven wrote:
> According to the R-Car M1A Hardware User's Manual Rev. 1.00, the LSI
> internal delay for I2C instances 1 to 3 is 5 ns (typ.), which differs
> from the default 50 ns as specified for instance 0.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I wonder if we shouldn't also specify the 50ns for IIC0 because it is
describing the HW instead of relying on the Linux-only default value in
the driver? Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCSRY8ACgkQFA3kzBSg
KbYUVQ//bA+lZkesLj0UgTumvnuVKp+S9cPrCY9JgMyuYOUz4Et61K1ai9OO+mGb
FlvPeDa2+zUzyu9TvD326w9tsU4m5Yy8U39iJvKZkbWD1P2xP2t+m75Kzo5V7HlZ
H6kiiqUD+hpw4zlgRRFlTiuehtcy+I0FKjB9XDUBqRsitDT3VlaTV3uY9jv0END7
IIKQjpAlRpVeibVKaDa0bISX+k/2N5hCObk+Tks20K5G1sZL2IZDLtOjiR9ZVP/8
9vXI44KoyTa2wZIum6F/Cj2mAYbK41ScllQ0Ft0nbmHZdHheu7JxLysQe/cfWb/2
dXCQ4vpO0mC9pTSMU9wTaHiS4wAIhI98ov4qIARvl5xncG5vQ+eUUbTZTwqMIC+e
Bg1Fqb2pAlpQTYKjBNRhNQId5rw1Brhig+buV9vRuFk16z31iCIKxWJhUmYP6wM5
oXC6ZIB00mhlijtcW6aZGGR8p2nlUIvKfe3R2uvEx3w9qKsMPTmw23SM8DCmjAwY
E63/GBdwLD41Y2SaTEit9OXwpg5/vjXJesU7VHr1Il1raoadfe6HCINp8fhinM/M
2CwmoXTGHj+44QWEFt+nqzddC3RyUEnpO6jHcg4uxHyHLO2B9ZFPx2dBJoo8M6Lm
fkAxGQSOeYMM0D3kvVCGQ5WbK3/MOJas4BC4GbpsNWl/25M8HMM=
=uB7y
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
