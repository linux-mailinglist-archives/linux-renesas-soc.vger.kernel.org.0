Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7081344C44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 21:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbfFMTiB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 15:38:01 -0400
Received: from sauhun.de ([88.99.104.3]:44286 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFMTiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 15:38:01 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id B9EC74A127B;
        Thu, 13 Jun 2019 21:37:59 +0200 (CEST)
Date:   Thu, 13 Jun 2019 21:37:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 1/5] iommu: add an exported function to get
 minimum page size for a domain
Message-ID: <20190613193759.GB6863@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 07:20:11PM +0900, Yoshihiro Shimoda wrote:
> This patch adds an exported function to get minimum page size for
> a domain. This patch also modifies similar codes on the iommu.c.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/iommu/iommu.c | 18 +++++++++++++++---
>  include/linux/iommu.h |  1 +
>  2 files changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2a90638..7ed16af 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -280,6 +280,18 @@ iommu_insert_device_resv_regions(struct list_head *d=
ev_resv_regions,
>  	return ret;
>  }
> =20
> +/**
> + * iommu_get_minimum_page_size - get minimum page size for a domain
> + * @domain: the domain
> + *
> + * Allow iommu driver to get a minimum page size for a domain.
> + */
> +unsigned long iommu_get_minimum_page_size(struct iommu_domain *domain)
> +{
> +	return 1UL << __ffs(domain->pgsize_bitmap);
> +}
> +EXPORT_SYMBOL_GPL(iommu_get_minimum_page_size);

What about making this a 'static inline' in the iommu header file? I'd
think it is simple enough and would save us the EXPORT symbol.


--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0CphcACgkQFA3kzBSg
KbavgQ/+JwWPeuVMxx3ApPN3s2nlNe+Sp7vVq6kDrfjELjZdDMHLzLE8PXjCRb4k
gAesEh8M5QcwY/VqkV0XW07TxDLGkSLvKxR3S6vyeGNlzYbttlYRb7qzgpiKu6E3
miXxc2HRrYQMVeFmZJ0ntoPIwHB3Ydsq2am91JSiOKVSmEJgbw1gYGcAMbI8o41I
yfiTwI0DBd/ooD7befuhJoJziIO8J90QI3HNMzkC+viD6RugwwidU7sho5JDCmw4
ha62jLZy42Ijg96Pqd9f7zDtGFJ2SB/h0mqv3+EBKW6+efzHAmVSEd1WoxyBLMjy
WQx6xcthVIQGBwMfUA9p1F8ZDKoiYv5TAxNqPTW6JUpcT2bDpwcrS5LzQvt5RRhE
tJZcPzeBHFW6Jdp9/rgbdooJhauvP4DxtxlcoMieYq3Re4jKQq2YMqS7MLuHK5Je
PqCSIZZH7vl4hKHr3UuRfLOIEdD7hd+5FIi/X8hYmV2+rc5HYECpe4Jy+Ir/1YV2
Omda5LDqeEtyvWjjvGuNJps3XFZEVkjZYKkRYAzw4J7QLlzHOAHBht4q6iZza69K
qx9iY6g98ViBoeReaBHOsq4QGllCfC/BR0k+q94sDAexjK771I++9rjV+sr08NkB
dgIaqwkz3rKn6MBWAaXBXkJvt9jyZjtVgcVYKw/AvLOTkG2MwqU=
=5ihp
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
