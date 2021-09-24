Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C26A4171F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 14:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245627AbhIXMhL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 08:37:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:50138 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245559AbhIXMhL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 08:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=JalfDMXF3NmfGlLDe7ItYlmatpp0
        M3ZXEfuT22l8kF8=; b=3qoOWwi2E5ZYDt7U8rAXtPzRJPbGyJearPuOvjrVg03T
        7E2/H0/nAT7Y74cs7frQzGAbfVfvAxeNCtzhlOqwpr3V8BMfAPjaGib4SkNJuUZr
        EAGErJ3L+rxSxTFmvvx3qZxdV8aXyZIY3N6WnRJlEAejFb7hpZM0EAV+8ICuAic=
Received: (qmail 4024565 invoked from network); 24 Sep 2021 14:35:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2021 14:35:36 +0200
X-UD-Smtp-Session: l3s3148p1@BQi6+7zMZK8gAwDPXw1LAJ+FoAZ06vRo
Date:   Fri, 24 Sep 2021 14:35:32 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer
 in Manual mode
Message-ID: <YU3GFMmCjjG3eS+L@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
 <11355367-8d20-5a17-70da-618d87301407@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3GmlKcnzAGOYltn1"
Content-Disposition: inline
In-Reply-To: <11355367-8d20-5a17-70da-618d87301407@canonical.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3GmlKcnzAGOYltn1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> > So, in 16-bit transfer (SPIDE[3:0]=3Db'1100), SMWDR0 should be
> > accessed by 16-bit width.
> > Similar to SMWDR1, SMDDR0/1 registers.
> > In current code, SMWDR0 register is accessed by regmap_write()
> > that only set up to do 32-bit width.
>=20
> Is this part something worth splitting to its own patch?

I don't think so because it is related. The patch ensures that a) only
8, 4, 2, or 1 byte blocks are used and b) whatever is used, the access
width to the data registers is proper. Only the combination of both
fixes the data corruption. Also, for backporting, it would be good to
not introduce dependencies, I think.

> You sent the patch just slightly after this one:
> https://lore.kernel.org/lkml/20210922184830.29147-1-andrew_gabbasov@mento=
r.com/
>=20
> Are you solving similar problem?

Unlikely. I do not have HyperFlash on my board, so I can't test. But as
I understand the docs, HyperFlash in deed doubles the granularity from 8
to 16 bits when using memcpy. But I am dealing with MMIO register
accesses in manual mode here.

Thanks for the review,

   Wolfram


--3GmlKcnzAGOYltn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFNxg0ACgkQFA3kzBSg
KbYQmg//UVJyBjn+24BPvQRf4wI1rjv/D6e5dNrdkQ3DaIG8hQ1OcwcWIU+AKI+N
9GJ8TvChdTF571hoFNVcjHbGcZNaatQ4W7Cq01pvKUKJPJQ+DfBypMw2gV3XWTHB
LTmUGZeaKcy6m6xEpChVP0hUJ1+Uajr27WcFhnE2H808JXz/6t2Xdl4K+Cmw47zN
wPgpQGv8vRQqqSKkYaKN+Rr+pGx0ddxLOA8dMGx7Seg+QAdPDYeDcqOTUKo/wrvt
xC2XsbXAjpPIr2THflQ3/6GaxPNh6NT41UbZitrXKimu8jb0/O8JdP1kzHT9874e
i+/91IYLlKS3amPJ5j4EQrr+qxadLRptpghtfYrUSBXuS1qjkjXI5uQgTZ+wZf2i
gtVzKbxFvGPB7z0hekXfTW/Xh+tjbKukm3TyCojm+js79QBKM6ofuduJKJoBsLbP
mPAXn6/uh6gwzaV9Ou+a6Y95DXusW3vqtmuWItSIH046xrQwmL+Jf4l6AYK0P2hj
IRKk74cicYRI/Zl8X4Yy1eQjZwoZpbtiUdx+wp9ypY+pWIgRiYElYiHbg32xNk41
WF5rlk0te//MEkcfeHifaMxE4q0bazyUu+zsxfPsbFPyU6O8ix7myYtOS9h1U7d8
CM7R4UX//IjlqJ5qq2NDg8NQFqUrnbXhpE+6cLJOs93S6Ov7+iM=
=lQS+
-----END PGP SIGNATURE-----

--3GmlKcnzAGOYltn1--
