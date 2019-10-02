Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25FDFC4942
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 10:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfJBIP4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 04:15:56 -0400
Received: from sauhun.de ([88.99.104.3]:56728 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbfJBIP4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 04:15:56 -0400
Received: from localhost (p54B33447.dip0.t-ipconnect.de [84.179.52.71])
        by pokefinder.org (Postfix) with ESMTPSA id 9C4942C3720;
        Wed,  2 Oct 2019 10:15:53 +0200 (CEST)
Date:   Wed, 2 Oct 2019 10:15:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Message-ID: <20191002081553.GB1388@ninjato>
References: <20191001180834.1158-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <20191001180834.1158-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 08:08:34PM +0200, Geert Uytterhoeven wrote:
> As platform_get_irq() now prints an error when the interrupt does not
> exist, a scary warning may be printed for an optional interrupt:
>=20
>     sh_mmcif ee200000.mmc: IRQ index 1 not found
>=20
> Fix this by calling platform_get_irq_optional() instead for the second
> interrupt, which is optional.
>=20
> Remove the now superfluous error printing for the first interrupt, which
> is mandatory.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested on a R-Car H2: it does make the error message go away and the
MMCIF device acts normal during boot. Can't enter userspace currently
with v5.4-rc1 but this is unrelated to this patch and MMCIF. Looks like a
configuration thing on my side, so I will still give:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

But will report back when I fixed the unrelated issue.


--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2UXLkACgkQFA3kzBSg
KbYa+w//RlPIc068QUME2rU3dxW1z4TyTC+Zk6k5Z8RoLsCHDbt3L1S6o6PctLRD
zxdTDlbzY9FlvpdQmiJi6R40tnTN76ofuW1zB9WCHemkgYgRUaazBrZJwItiN1+X
1dhrBkKkd1L5EnO4vGPCUvMutU+BJiAuYVr7Pwa53D5lMxRpMAMTxAjT7Imv/Pvw
zs/s3KqHTZokF+h0EPKjaaZW53FAM8BnF4ZFFkF3Om+rFW/D/3svpx0K55Uu3Tt+
K6ZHf3Wh4Uy9DYPODn/Lr1UCwS3oo5zC2do5yuRo/so1e9jUFgl67eVk6+h/Z5BK
PAhILdWOt79bkIchcXkZJhR01mcjZqJ1th/rsYvhS9yGgjaMz2QZEPunFBS3PLyP
wxYPADztsWmMvIvrkqoRqhN0S50BNM0xFpRqMBlQs86AvZ9ld8qp5qmcAJF1zfqS
DVOLWl6DhhYQfL1B+4e+sQ6i2gGdShHsO8+SAfwPADg5WUljNVUjJtOF1rJHCozw
DSDGb+IDIUTbeQ+2NNjG2rq9QDebersQZc0un1MSFL7Yf19bTZib/jlMyfTabtWq
NCbq050oqLpHM35sp/WetGLOjQMY0p5Dvmcj2/bxd5jqAUDe85eylM9Tnu1AnFxe
ABE9aDY0L0InF2DdY8LWTbAexalsmcGkWrY6VVABMdkdSiLbBZI=
=e3oA
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
