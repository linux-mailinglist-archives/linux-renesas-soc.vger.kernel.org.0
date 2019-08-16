Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66E48908EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 21:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfHPTu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 15:50:29 -0400
Received: from sauhun.de ([88.99.104.3]:48358 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbfHPTu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 15:50:28 -0400
Received: from localhost (p54B33308.dip0.t-ipconnect.de [84.179.51.8])
        by pokefinder.org (Postfix) with ESMTPSA id 7AD8C4A14FE;
        Fri, 16 Aug 2019 21:50:26 +0200 (CEST)
Date:   Fri, 16 Aug 2019 21:50:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        axboe@kernel.dk
Cc:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9 3/5] block: sort headers on blk-setting.c
Message-ID: <20190816195026.GC6886@kunai>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1564129876-28261-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline
In-Reply-To: <1564129876-28261-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 05:31:14PM +0900, Yoshihiro Shimoda wrote:
> This patch sorts the headers in alphabetic order to ease
> the maintenance for this part.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---

Jens, can we have your ack for this patch so Christoph can take this
series via his tree (also for patch 4/5)?

Thanks,

   Wolfram

>  block/blk-settings.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 2ae348c..45f2c52 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -2,16 +2,16 @@
>  /*
>   * Functions related to setting various queue properties from drivers
>   */
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/bio.h>
>  #include <linux/blkdev.h>
> -#include <linux/memblock.h>	/* for max_pfn/max_low_pfn */
>  #include <linux/gcd.h>
> -#include <linux/lcm.h>
> -#include <linux/jiffies.h>
>  #include <linux/gfp.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/lcm.h>
> +#include <linux/memblock.h>     /* for max_pfn/max_low_pfn */
> +#include <linux/module.h>
> =20
>  #include "blk.h"
>  #include "blk-wbt.h"
> --=20
> 2.7.4
>=20

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1XCQEACgkQFA3kzBSg
KbYjog//dAZQC63XN6l3f9L1WM8IfdYypPCOsUgtWh4QAVYLdZ/jWXQPRpVwR/hF
WMR4XX7hbfiFzT5beBXQL2PdzpfjZBIGb7asS//S+9e1FZxSCOrTZKgu3REzg6xr
+YfC80n4iUw6rYLLz77WRSoFFkwB9n+IKQQt+aH6G3TqkF09y47VNQSPXfd7qysv
6QOmFR9Ks/zteUOZ7IpJHrCHr7BnLZxxP0WibZxkPteccbymLMWc5gL78ZCYj768
96wAiC2kYaimsXtwjRZjfSQnhLRGe4sG+DJREhpv79q73bss8Oj+3rvJziGfnbwN
6utP5aC039RbvIApECeK0pLOnLhXD/rkRQGHQroXVzarEXe/U4Kqhv2bUePym2DE
kg1n72w+DaEHCvF6YplmPQp+1xsIzFc+pk6z4Ck3gZkHv7tuNqCzD5Ljonp6C6fl
FJUKKIrV/vMmsrloglOxWWsV5cqSoc3rtuJK9OAH/p5tLpl5Rv1ZlBLBN6VIG0kM
wKYFmDHXeC6bh31D8a8XlEwbb124uvOWSaYw8OIO7hl/P8/BpDmmuyL90RsuqU2N
ThBk0luayqVqdag5MqZeNqkScfuIaMP4OIVROxa66JqEIH4+wB/kxnneRFGQVg0j
HimmywdZzFbi+FNZTxpjZ7SkN2xHELiGwxQsieJMgtMRJG+nwx8=
=SupF
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
