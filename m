Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA6326308
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 13:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfEVLfY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 07:35:24 -0400
Received: from sauhun.de ([88.99.104.3]:43508 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728450AbfEVLfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 07:35:24 -0400
Received: from localhost (p54B33377.dip0.t-ipconnect.de [84.179.51.119])
        by pokefinder.org (Postfix) with ESMTPSA id BB24B2C3720;
        Wed, 22 May 2019 13:35:21 +0200 (CEST)
Date:   Wed, 22 May 2019 13:35:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: use multiple segments if
 possible
Message-ID: <20190522113521.GC895@kunai>
References: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1558520319-16452-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <1558520319-16452-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 07:18:39PM +0900, Yoshihiro Shimoda wrote:
> In IOMMU environment, since it's possible to merge scatter gather
> buffers of memory requests to one iova, this patch changes the max_segs
> value when init_card of mmc_host timing to improve the transfer
> performance on renesas_sdhi_internal_dmac.
>=20
> Notes that an sdio card may be possible to use scatter gather buffers
> with non page aligned size, so that this driver will not use multiple
> segments to avoid any trouble. Also, on renesas_sdhi_sys_dmac,
> the max_segs value will change from 32 to 512, but the sys_dmac
> can handle 512 segments, so that this init_card ops is added on
> "TMIO_MMC_MIN_RCAR2" environment.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Awesome, Shimoda-san. I think you nailed it, this is nicely readable
code!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzlM/kACgkQFA3kzBSg
KbYtBA/9FF8cB1rnFKGmQr8g0zM53etl4UeJaSa65W/ZqHKJEHIpxOgT7/pSFdya
Mt3+EDuNlgAndb88dDN38X3QKjc0sPH4UH+VXDbtqm4KvBQx8C0kt8QAf8xTSbuZ
m/Ax7qYwHlEahv3ZpCFTDsHfxuZWX9CYm7fBOZ9oQFrb3VNPKt2SR6QFDLDqknM8
+v1y2iPCAlx+6yYIyRZXLmOib7/eyDXf40Yz2QAFD8/6g1JAvxbvgjzV1rBvnaJ2
9Nt6S7rEuLseIJTrg0tTJPk0sH5DYcpy9syeQTjPTGUTNQTgvcwzB/T/CHp8+rdr
9JaLgRpPBBsUINQb+VSEk/1l8qvV/v+uLcy8+hCYv+n5G5jlI+kQ2k+BldKv9Rhi
idBPrhMLJla7pB/AAYnRRk4PkLKOZXAses5DmQ5N3yUPpFcSPbI4eMXkKOypu6bV
BD/fhwCUMl3xhbNxBY0BpzBw3mwuQ437bsG0AUer9EN8bQ1KiQtSmom33Bc2W+Ti
fMEaS1Gqz/yjWI9j/gp7LLi7OEc4gFp4JgRBLzz6SJ7GBHyLr9bx4h/AxgLAVUJb
vNzxyIpZxVRfK63eFynhCz0UJA+rBvpcvjA0LiWDmEBgFuTEsekmcu6TmoUxhB9q
Nq101Z4ELhcDoaA174D69xoRYkBZYOdPI6MGPyEHLaI49jn6u9A=
=U8+1
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
