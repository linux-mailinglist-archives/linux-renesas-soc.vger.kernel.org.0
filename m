Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087BFFCF66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 21:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKNUPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Nov 2019 15:15:17 -0500
Received: from sauhun.de ([88.99.104.3]:44526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbfKNUPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 15:15:17 -0500
Received: from localhost (x4db7660f.dyn.telefonica.de [77.183.102.15])
        by pokefinder.org (Postfix) with ESMTPSA id 0F4272C03EE;
        Thu, 14 Nov 2019 21:15:15 +0100 (CET)
Date:   Thu, 14 Nov 2019 21:15:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP_ERASE to
 Gen3 SoCs
Message-ID: <20191114201514.GA3058@kunai>
References: <20191112134808.23546-1-erosca@de.adit-jv.com>
 <20191112204952.GA2976@kunai>
 <CAPDyKFq8oVk26ruNA_R8HDXhMGKhDeHnL0q82xi40g1aeo109A@mail.gmail.com>
 <20191114113743.GA19656@vmlxhi-102.adit-jv.com>
 <CAPDyKFp5iqrFDM1EWnYBwFmQAiAA5FADDLAyuVVBgMu4Sx=x5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <CAPDyKFp5iqrFDM1EWnYBwFmQAiAA5FADDLAyuVVBgMu4Sx=x5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

thanks again for the heads up.

> Let's first take a step back, because I don't know how the HW busy
> detection works for your controller.
>=20
> I have noticed there is TMIO_STAT_CMD_BUSY bit being set for some
> variants, which seems to cause renesas_sdhi_wait_idle() to loop for a
> pre-defined number of loops/timeout. This looks scary, but I can't
> tell if it's really a problem.

That should be okay. The datasheet mentions that some registers can only
be accessed when either CBSY or SCLKDIVEN bits signal non-busyness.
renesas_sdhi_wait_idle() is for that.

> BTW, do you know what TMIO_STAT_CMD_BUSY actually is monitoring?

0: A command sequence has been completed.
1: A command sequence is being executed.

> I have also noticed that MMC_CAP_WAIT_WHILE_BUSY isn't set for any of
> the renesas/tmio variant hosts. Is that simply because the HW doesn't
> support this? Or because implementation is missing?

Good thing we use public development. I recalled we discussed this
before but I needed a search engine to find it again:

https://patchwork.kernel.org/patch/8114821/

Summary: The HW (at least since Gen2) has HW support for busy timeout
detection but I never came around to implement it (and even forgot about
it :( ). So, we still use a workqueue for it.

Kind regards,

   Wolfram


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Ntc4ACgkQFA3kzBSg
KbbALRAAtN5mgjwND8GXvfgnDgmjvkOqkG4JE3T24NtpQdmjoSGhduWW8lhSsCeD
2i6ziNE3oght8mF1Rkh3KkD/LX8yzYJPAEWsLJ2+P2pmmkqNFo2HUnS5udIGP5mV
yo3XMA6cshF69DV1eafWLEBYluk9SmrMD2iD+0kO+4Mc7+SlwAcF8xVG9fpQ2ODh
asack+7659QzovDga35Yp6xnC0T9bRXbA/+j9KbInci5I1txfMR1JCmbiYdHjvcP
ioGgGAW0lSck//kLuQUZ/c08KrkcdW625W3xmZXbINhLcXU9UAMPliH9Peaehcz6
jaoUdUFXJlUc63uyvxkHinWRgVAztFfZQ8SAJjtRJ1Mhafi85yYlvFXEw8UIE3rm
N8JyQh27VhBXuDGvV6ea3aQUyOp4zNJ1i4Ap/xmgPTKZocYgJGsvfN+9uofGYMvh
YpCnl0Y+jGDvlGnoNwIWFDcG0MAm2lA5Ty0hzIkpnOCY2C5WZL09QYlTQYZh3dCo
iEx7Tbhq/WkgDV9wdMywuTFdjWHm64oTa8e5qmW5d8qOwjon0vbDlkdN7IkXQ+Zt
KZNuFNQr4vZ4Cs/l1FcLOM0S+ttMRaGwaCjFwBrThP+9rvxbEBj+uArxZZTzy98a
It7rsCfb75FPhfDjB39xttbtcxtm9ZjBgwJiD7eS2RQZ3+B8uZo=
=JtQE
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
