Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F0F3AC7C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 11:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhFRJjA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 05:39:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:38838 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232605AbhFRJjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 05:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=YPMwCSoOK4+3h4WMQzIehTDluXtP
        Y4I7iaF3OF2jXBA=; b=cw6P9IiQE/OyhJE+SeEEfTd1t4zORN6DOjylUTc1J6zu
        +IbWggJtuMu/7oOQ2LcjzqCnxyZwmzn+gBULJWTnTS0PbuUR44K7ZJ3ZwJvJmFbf
        +zOEaNMMO22/e9zf9loYecP9dHYwfUsmJP9LCAJMroq72jxJizECMoCNfxn9q7o=
Received: (qmail 671146 invoked from network); 18 Jun 2021 11:36:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2021 11:36:49 +0200
X-UD-Smtp-Session: l3s3148p1@c3oaEAfFJLQgAwDPXwaEABQIKHLDvKpZ
Date:   Fri, 18 Jun 2021 11:36:48 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <YMxpMKH39aYs4Zaz@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210317091622.31890-1-wsa+renesas@sang-engineering.com>
 <20210317091622.31890-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdU6=rTHjvcgK8GBzd3OL_9YFqV77=KsAEGJvAVapnhsOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o+Y/X1RJGwghOxm6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU6=rTHjvcgK8GBzd3OL_9YFqV77=KsAEGJvAVapnhsOQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--o+Y/X1RJGwghOxm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> In v5.10, v5.11, and v512, it works fine:
>=20
>     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (=
CMD19)
>     mmc0: new ultra high speed SDR104 SDHC card at address aaaa
>     mmcblk0: mmc0:aaaa SM32G 29.7 GiB
>       mmcblk0: p1
>=20
> Note that I do see one timeout during identification.
>=20
> After b4d86f37eacb7246 (bisected), it fails:
>=20
>     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (=
CMD19)
>     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (=
CMD19)
>     [...]
>     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (=
CMD19)
>     mmc0: tuning execution failed: -5
>     mmc0: error -5 whilst initialising SD card
>     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (=
CMD19)
>     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (=
CMD19)
>     [...]
>=20
> Given the single timeout I see with older kernels, the issue may be that =
the
> harder reset causes that timeout to repeat ad infinitum?

I can confirm this. I also found a SanDisk card which shows the same
issue on my Lager board. However, I wouldn't say this patch breaks
things in a way that a revert is a good solution.

The card does not really work "fine". During probe we get one timeout,
and when trying to read from the card, more follow. Already before this
patch. There seems to be a state where an initial command fails and only
the retry suceeds. The hard reset in deed seems to cause an endless loop
here. However, the proper fix is to find out why this first command
fails, especially only with some cards. My Samsung one works 100% fine.

And if we fix this, then the hard reset is still good for Gen2 as well.

Makes sense?

All the best,

   Wolfram


--o+Y/X1RJGwghOxm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDMaTAACgkQFA3kzBSg
KbaVPxAAmmy4USWZyF724xuUZFSzeCZmrYDczhaXPpF+Axx2e3+Vqq1kDMCxkxSy
ZJa3nqZuY7adaPpbpCoKwMGT3BUgl9N39GkugclTCQ1rhnkr2TABlmlLGcd+68Kg
+ge2iDc27KRPd32istBEU7BNovfgWp9KfO0pfXQ6v+30VpIMjImdOueLe72fIlkR
G/NAF1pye3SvwDCPlL9Im10IWd2RLy36rIeAq23m8Pcf0GtmT5M9jE5f87BsAWqW
20Woa+zM8WTpl2p2sXTIg6gTUnc16kyrQ5hJf862WgA6xm0760BmjDmVVbOVzIkF
Gg7yZkbdnoluhByeNICMKLVnNIf1NhoB6C34MBTsfp9/KW6Xf5A+Hsmmll7RO/yr
2vqZji9CYRko08R9cgEhMOP8wK3rX4Kw2oBVzB9iNeRqFiR4c0lfTz3OEmMKGcRY
1Hmv7Wth0nyciiGLnwSVeVvKONOa9wkr6214D3OxsjNuW3i/QTVRrfE2nGJmsSnQ
lRdNWLCTNjr/1JeGp606+8a1H9W3Yy6XSGpOJy9WUbDmBsNSiodldyyRIqm5/gTJ
me2Dbi58/+5tdnuhg4xr16PK59IxOqYdW+W44ii4ylxTmehmywMudSLxTNILAhqO
fvqrd/7rCpeK650KxvDNJYDfmW23cdmJMq9WRUUx+lM4hh+RJN4=
=iagi
-----END PGP SIGNATURE-----

--o+Y/X1RJGwghOxm6--
