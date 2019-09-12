Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99534B1430
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 19:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfILR5R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 13:57:17 -0400
Received: from sauhun.de ([88.99.104.3]:52640 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfILR5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 13:57:17 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 9A3152C4EFE;
        Thu, 12 Sep 2019 19:57:14 +0200 (CEST)
Date:   Thu, 12 Sep 2019 18:57:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     hch@lst.de, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, treding@nvidia.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mmc: queue: Fix bigger segments usage
Message-ID: <20190912175713.GB919@kunai>
References: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1568261636-25625-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <1568261636-25625-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 01:13:55PM +0900, Yoshihiro Shimoda wrote:
> The commit 38c38cb73223 ("mmc: queue: use bigger segments if DMA MAP
> layer can merge the segments") always enables the bugger segments

"buffer" :)

> if DMA MAP layer can merge the segments, but some controllers (SDHCI)
> have strictly limitation about the segments size, and then the commit
> breaks on the controllers.
>=20
> To fix the issue, this patch adds a new flag MMC_CAP2_MERGE_CAPABLE
> into the struct mmc_host and the bigger segments usage is disabled
> as default.
>=20
> Reported-by: Thierry Reding <treding@nvidia.com>
> Fixes: 38c38cb73223 ("mmc: queue: use bigger segments if DMA MAP layer ca=
n merge the segments")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

For the record:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl16hvkACgkQFA3kzBSg
KbYv4g//d5gzay2l2/0p/YMhVffdiWdxgW/ydBysTTvOVKaAWkHHJNsCECqy84NL
+TFhtZ8YpaN2XtbL5b6JT9ubZ9a+LhdCH1JVyUeQt2x9RzbEVcPNeXP2OkE6qg4F
Ug/C1JUzVLmKlTc+vl6DyoUZesmN5QvPpnWogVqjzDzZNStzH6rvjx3zeKXnNxYg
nc+taNo9GoI3GhDsCSGBk0X6hb3kppMeAX1nVJ0fsIDc+31gIOnTsXb1gQO2rx06
+CgiXFBz5SYNcea9HqkIOJ4ncQoo+zJsJtI6Gq5iEGJrkvm+ingOZCbOnanxV639
HCL0yqS6XF+sjhlg/IhQwjynWG52HE3fGrSChSfIVB7ckX4f4/eArPeOzj0+FqyP
d52z/jX3Ny2jVn46+NiKlmxupz7/GmEm8IdLiGrM/cTL2/yLjN3A4+cCgZ8zpdkt
x4OR2ZR3QaqoQNeFQWyjLV0xWq2+daWBmu7RISg6uXbLK6nw5jFq21ABucdX906X
qAFg+czrq2ulvUwibP2CNh9/G8uIK22V8b/2WA/mYWWAT/egVdy2PI3zx1fu2YVz
NxNJsUTAO08KlXqvazC/u8ytd+3PT/sMatmiX37aCPvlqp++YviPHsmI8Kk7u78S
7WWo4sBrIHyYFQFo2BeQicrYYMpyHj9pt1R9dlGhX75N6BSybaE=
=Sy6R
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
