Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A8133058
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 14:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfFCM5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 08:57:06 -0400
Received: from sauhun.de ([88.99.104.3]:37750 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbfFCM5G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 08:57:06 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id C04B82CF690;
        Mon,  3 Jun 2019 14:57:03 +0200 (CEST)
Date:   Mon, 3 Jun 2019 14:57:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christoph Hellwig <hch@infradead.org>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mmc: renesas_sdhi: improve performance by
 changing max_segs
Message-ID: <20190603125701.jkmpkvctrtlj2io7@ninjato>
References: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r46gxcxznvtf2qr6"
Content-Disposition: inline
In-Reply-To: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--r46gxcxznvtf2qr6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2019 at 08:16:08PM +0900, Yoshihiro Shimoda wrote:
> This patch series is based on iommu.git / next branch.
>=20
> Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or more
> segments, the performance rate (especially, eMMC HS400 reading) is not go=
od.
> However, if IOMMU is enabled on the DMAC, since IOMMU will map multiple
> scatter gather buffers as one contignous iova, the DMAC can handle the io=
va
> as well and then the performance rate is possible to improve. In fact,
> I have measured the performance by using bonnie++, "Sequential Input - bl=
ock"
> rate was improved on r8a7795.
>=20
> However, in case of a sdio card (especiialy some WiFi cards/drivers),
> scatter gather buffers are possible to be not contiguous iova because
> each scatter gather buffer has only about 1500 bytes, the DMAC cannot
> handle it. So, this patch set adds init_card() ops to detect the card
> type, and then the driver changes the max_segs if the DMAC is under
> IOMMU environment and an sd card/mmc is detected.
>=20
> Changes from v3 [1]:
>  - Use a helper function device_iommu_mapped on patch 1 and 3.
>  - Check if R-Car Gen3 IPMMU is used or not on patch 3.
>  - Check if all multiple segment buffers are aligned to PAGE_SIZE on patc=
h 3.
>  - Add Reviewed-by Wolfram-san on patch 1 and 2. Note that I also got his
>    Reviewed-by on patch 3, but I changed it from v2. So, I didn't add
>    his Reviewed-by at this time.

Yes, dropping my rev on patch 3 is a good thing to do. I added Christoph
to the CC list because he gave valuable input last time.

@hch: If you didn't get the original mails from some list, I can bounce
them to you or you can find them here:

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D125593

>=20
> Changes from v2 [2]:
>  - Add some conditions in the init_card().
>  - Add a comment in the init_card().
>  - Add definitions for some "MAX_SEGS".
>=20
> Changes from v1 [3]:
>  - Remove adding init_card ops into struct tmio_mmc_dma_ops and
>    tmio_mmc_host and just set init_card on renesas_sdhi_core.c.
>  - Revise typos on "mmc: tmio: No memory size limitation if runs on IOMMU=
".
>  - Add Simon-san's Reviewed-by on a tmio patch.
>=20
> [1]
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D120=
985
>=20
> [2]
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D116=
729
>=20
> [3]
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D110=
485
>=20
>=20
> Yoshihiro Shimoda (3):
>   mmc: tmio: No memory size limitation if runs on IOMMU
>   mmc: tmio: Add a definition for default max_segs
>   mmc: renesas_sdhi: use multiple segments if possible
>=20
>  drivers/mmc/host/renesas_sdhi.h               |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c          | 60 +++++++++++++++++++++=
++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 19 +++++++++
>  drivers/mmc/host/tmio_mmc.h                   |  1 +
>  drivers/mmc/host/tmio_mmc_core.c              |  7 ++--
>  5 files changed, 85 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.7.4
>=20

--r46gxcxznvtf2qr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1GRgACgkQFA3kzBSg
KbYWYw//UpgGMNzkGLIXeMqpmQvikAJ87iHNVtDMm6PJn4dAtK72ieXGaqwQx3pN
MUWwN8goObbBcU0rYGeRbUGwAaOiO1umyTeSrtwKSnAgJxrLe/KysKbMA85cCqz2
/h6QrDZINZTo8Gb+Uh0vQqHwTY8NO4suiDa27eRXDXzAjdXzJ9ABWYdrnW8kwANq
EvVQd/tsi1jB1SuuS7im7VHTfFBCjgdmGgWDk3XZie9ttDR3ZpkbouUdSfs0xSzq
JcQ9OMKOZUfVfYOOwmI/J8rYcjb7pZP+zPWBCSzxr64ZeyIu3wPs0y6zkYm/7PyP
oHxML+bSF5JdmPn4V+/CwPGLqB8L93mgn8RdUYP9gVkcmUpcU431bcc6Tu99smER
aRRQ2f0auI38g9iY241tEiJjeQjiQU1XGHK8ziBf1Ua3gQxR456oSSJiUdWaX4sm
NEU9qv2MrJAbbq6YVBnbqabp41rusek0mRP3N4LD7HV5qGJIg0Sl3WapttjVvwxH
zL80kp9yuao48+xBdycmMtk7+uwqUfFQ2hxXpokMShs7E7Y6cMb2TwvUL4ytPRSQ
QASKr9AqgMX1uCVW671aconSZbGzCrX6+I9X0JKIcadkDY0cfOzW2O54g3rdDAXe
/wsNCXgAy+jWRK20+yzkl2kzGoNT/74E89bdvXtL9zCwwB4RPyU=
=3NFR
-----END PGP SIGNATURE-----

--r46gxcxznvtf2qr6--
