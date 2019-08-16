Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7527E908E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 21:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfHPTsX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 15:48:23 -0400
Received: from sauhun.de ([88.99.104.3]:48312 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbfHPTsX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 15:48:23 -0400
Received: from localhost (p54B33308.dip0.t-ipconnect.de [84.179.51.8])
        by pokefinder.org (Postfix) with ESMTPSA id 1A8D44A14FE;
        Fri, 16 Aug 2019 21:48:21 +0200 (CEST)
Date:   Fri, 16 Aug 2019 21:48:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
Message-ID: <20190816194820.GB6886@kunai>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1564129876-28261-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <1564129876-28261-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 05:31:13PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a new dma_map_ops of get_merge_boundary() to
> expose the DMA merge boundary if the domain type is IOMMU_DOMAIN_DMA.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Joerg, can we have your ack for this patch so Christoph can take this
series via his tree?

Thanks,

   Wolfram

> ---
>  drivers/iommu/dma-iommu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index a7f9c3e..2992ce4 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1085,6 +1085,16 @@ static int iommu_dma_get_sgtable(struct device *de=
v, struct sg_table *sgt,
>  	return ret;
>  }
> =20
> +static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
> +{
> +	struct iommu_domain *domain =3D iommu_get_dma_domain(dev);
> +
> +	if (domain->type !=3D IOMMU_DOMAIN_DMA)
> +		return 0;	/* can't merge */
> +
> +	return (1UL << __ffs(domain->pgsize_bitmap)) - 1;
> +}
> +
>  static const struct dma_map_ops iommu_dma_ops =3D {
>  	.alloc			=3D iommu_dma_alloc,
>  	.free			=3D iommu_dma_free,
> @@ -1100,6 +1110,7 @@ static const struct dma_map_ops iommu_dma_ops =3D {
>  	.sync_sg_for_device	=3D iommu_dma_sync_sg_for_device,
>  	.map_resource		=3D iommu_dma_map_resource,
>  	.unmap_resource		=3D iommu_dma_unmap_resource,
> +	.get_merge_boundary	=3D iommu_dma_get_merge_boundary,
>  };
> =20
>  /*
> --=20
> 2.7.4
>=20

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1XCIQACgkQFA3kzBSg
KbZ8OBAApd6wfSbUGk8bR2bHXmdMHPFIldoc2rP9hr9PM+q3qiQINrZttJrWtrDG
LFHddbWI0gio2yyl/e+9g5QRBF4rRzcLDhJxRSqn8KfAvxu4jU19HAN2rjboS7zl
R0MNVdj+uBCaxvDVXKfuRa+HUUGKtJCTB0Pp79iMJcVL/fq3emVy9cJIwp/K5Z5W
srwNpawQ2wPlC7IY293k+SJL9VCgGG3zMgsyQnQ5ZFZeybkBwsbltc9bw53HwA5G
MgHUt37Csrg+6V+5RlJx4LSY3J03x6N0h+CqSSohD24vNq3TRjoQQT6/yX+BgkDU
BtsT1CB/Ff1ehHSy4yHJc0+AGuLMx8dDhv2QKI+ZNWIbRkVcT5LYoygsdTAZ5w3n
uf59EWdIV2MvpK80WimH25kXMtlTWMmHbWmm3hjpmLFAypp3ZIFn4olIQ7l1Gi2k
jg8dAH4uA4Mu70cWApfnk/ujiSaBtvIfuTFqKcWRmML/liD8Wm+JhDoZzxw0dax5
RPu8KBIR0W/2DLZ8bKKaDzP3I5rzcBEbyrdVosgADXwPiX2ILq1et21iSz7+Z7G6
bidUnMWjOwlP1hhMOiZnzj2uZd9uhwpg87Iz7nY8PMrpJQbSQiJctt2FVfV+/xwq
DPFYl62HmlAiU8J9dEoRIHeo49sW5PO4uTBlMT+F2uLqfugrQns=
=70Bs
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
