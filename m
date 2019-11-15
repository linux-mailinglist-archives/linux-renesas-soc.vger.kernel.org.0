Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00FF3FDF58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2019 14:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfKONvu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Nov 2019 08:51:50 -0500
Received: from sauhun.de ([88.99.104.3]:40386 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727411AbfKONvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Nov 2019 08:51:50 -0500
Received: from localhost (p54B33606.dip0.t-ipconnect.de [84.179.54.6])
        by pokefinder.org (Postfix) with ESMTPSA id 2CC0C2C0589;
        Fri, 15 Nov 2019 14:51:48 +0100 (CET)
Date:   Fri, 15 Nov 2019 14:51:47 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>
Subject: Re: [PATCH v2] mmc: tmio: Add MMC_CAP_ERASE to allow
 erase/discard/trim requests
Message-ID: <20191115135147.GA5087@kunai>
References: <20191115134430.12621-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20191115134430.12621-1-erosca@de.adit-jv.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 02:44:30PM +0100, Eugeniu Rosca wrote:
> Isolated initially to renesas_sdhi_internal_dmac [1], Ulf suggested
> adding MMC_CAP_ERASE to the TMIO mmc core:
>=20
> On Fri, Nov 15, 2019 at 10:27:25AM +0100, Ulf Hansson wrote:
>  -- snip --
>  This test and due to the discussions with Wolfram and you in this
>  thread, I would actually suggest that you enable MMC_CAP_ERASE for all
>  tmio variants, rather than just for this particular one.
>=20
>  In other words, set the cap in tmio_mmc_host_probe() should be fine,
>  as it seems none of the tmio variants supports HW busy detection at
>  this point.
>  -- snip --
>=20
> Testing on R-Car H3ULCB-KF doesn't reveal any issues (v5.4-rc7):
>=20
> root@rcar-gen3:~# lsblk
> NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
> mmcblk0      179:0    0 59.2G  0 disk  <--- eMMC
> mmcblk0boot0 179:8    0    4M  1 disk
> mmcblk0boot1 179:16   0    4M  1 disk
> mmcblk1      179:24   0   30G  0 disk  <--- SD card
>=20
> root@rcar-gen3:~# time blkdiscard /dev/mmcblk0
> real    0m8.659s
> user    0m0.001s
> sys     0m1.920s
>=20
> root@rcar-gen3:~# time blkdiscard /dev/mmcblk1
> real    0m1.176s
> user    0m0.001s
> sys     0m0.124s
>=20
> [1] https://lore.kernel.org/linux-renesas-soc/20191112134808.23546-1-eros=
ca@de.adit-jv.com/
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Originally-by: Harish Jenny K N <harish_kandiga@mentor.com>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3OrW8ACgkQFA3kzBSg
Kba6ig//WCzxUDK7XqZHPFyIKnoWYaVMmhuFmSJS0o6WJkZaLynLTZR3DALrSNAU
82GMkl3To5PkbCu4yXXdp2+gVLBP0MSosTOJXpLXrc3vK2g5ZUjgPdkuo+3R0N0w
/v+TAP35H41zzvITJk5lY+3qH5un+g05GA+uOyI9m8JLMAK6ILgQnK/wRoMa6UAR
z1Yj0Bjf1Nw0sRKquwrusV2WAX+sRf+iRy02EZaPdG+dFR/mngaUJ14/WhHZ7wLI
HmzHoqOGK+JKzHbgrogQnUdXyK2r2fFb9Gzouf4gg09lYr/3oVwwWHIr6ejW7Ezg
iHwj+CgLlf77wHQzBVeJEC0cdszJEtI2fH5JVWcQbl96eDKyHQdQUlHQ/6AfqQgd
aJkADiNtiB7R24+reNOUseIPP53736mAGtRmH5T6dWcjysIK69+CHwbcGpTf90Cd
ax20XEyOpElRTj+HRbEWfjVlXB5gpcabMR2oi7w7/PdpIjIdGvjbZWKbGy4ksgDn
OYckglpN70SJgoYIorqDTEClQxZbP7wtlvqcpE01b0RaXulFUtzsGv3afoqXnkPC
/0/SVgxmbiwnuBp90ZdmXE2mGKrmZxILZKArRmAo2zgF1zg43i08H8Z6kuSAvoRn
+h2xMnQQH8NyaqwJIurfIsDtZgQhgKifDqVfPxT1FfA2xz4fAZg=
=iNSV
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
