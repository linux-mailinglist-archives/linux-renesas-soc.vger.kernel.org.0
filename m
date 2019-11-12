Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9738AF9B35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2019 21:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfKLUt4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Nov 2019 15:49:56 -0500
Received: from sauhun.de ([88.99.104.3]:37204 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbfKLUt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Nov 2019 15:49:56 -0500
Received: from localhost (x590c7292.dyn.telefonica.de [89.12.114.146])
        by pokefinder.org (Postfix) with ESMTPSA id CDE132C015F;
        Tue, 12 Nov 2019 21:49:52 +0100 (CET)
Date:   Tue, 12 Nov 2019 21:49:52 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP_ERASE to
 Gen3 SoCs
Message-ID: <20191112204952.GA2976@kunai>
References: <20191112134808.23546-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20191112134808.23546-1-erosca@de.adit-jv.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 02:48:08PM +0100, Eugeniu Rosca wrote:
> From: Harish Jenny K N <harish_kandiga@mentor.com>
>=20
> Enable MMC_CAP_ERASE capability in the driver to allow
> erase/discard/trim requests.
>=20
> Suggested-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> [erosca: Forward-port and test on v5.4-rc7 using H3ULCB-KF:
>          "blkdiscard /dev/mmcblk0" passes with this patch applied
>          and complains otherwise:
> 	 "BLKDISCARD ioctl failed: Operation not supported"]
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Looks good to me. Just a generic question, probably more for Ulf:

Why does this CAP_ERASE exist? As I understand, the driver only needs to
set the flag and no further handling is required. Why would a driver not
set this flag and not support erase/trim commands?

Kind regards,

   Wolfram


--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3LGusACgkQFA3kzBSg
KbYKkw//VxC8isy0WeY7yOM8Eu1mt8LljuDDozsi46StVWx608b6GQAsLW34WLCs
sFTSRhYuQkld3iiYD+mFiQ/4X/W6Wj7c45SaIQ9doP+2EjT592pUMaSNhMTrPt84
XP48vZKZa4SOyEkP/TUSkAXqgFZsqO3Kos/qceqJb02il5N+biuEmFQM6rwj71sx
P71aDgWiq1eKVej8WEHn4t/A+UNsUbQpVmqvyyUXYm7KVgM5PZjogQBzc6Y8p+12
gI6AlUm0h5Nl8o7NDM6jy1VgP+UgZ8qjTTylFcYr6wSKKiUvJNb+U0Imd+txY8DZ
gtoWBuMDPQEAdngoX9jbw6Q9zFI41eJ6fM1LX5UnVO5VxopY+WRqiLfmp4u356tT
T2e/VNX9ZnGTrYWazo3jmpDpL0DoAPhbfgRkrpAG98vtNujOb3xtejglxbPfUYx+
8aXP3a0htCkgsaap34hHeAu4UiOyuZsh6Ie4iHukMP+S3m+5+vX9uXEi7ZQHgiLC
t9ANcKGUki2syaauaCZSSon0E0offhnuNqb6SRHla3rKAptSKNwoqlnDz2LoIUIV
Z+I/YUl2PNcHAJk1IkqIJwnBeMZKVUlMPdi38VlDdFQG0kXdCb6dABe7Km4kOr/e
AgdIusuIpZxP90NAGtgBm3JPiDEzEHxOEVobI7kJNKMCISgWYto=
=vVLb
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
