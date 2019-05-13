Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29DAA1B233
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 11:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbfEMJA5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 05:00:57 -0400
Received: from sauhun.de ([88.99.104.3]:37648 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727401AbfEMJA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 05:00:57 -0400
Received: from localhost (p54B3324F.dip0.t-ipconnect.de [84.179.50.79])
        by pokefinder.org (Postfix) with ESMTPSA id DB76F2CF610;
        Mon, 13 May 2019 11:00:54 +0200 (CEST)
Date:   Mon, 13 May 2019 11:00:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Message-ID: <20190513090054.GA15744@kunai>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

thank you for this update!

> +static void renesas_sdhi_init_card(struct mmc_host *mmc, struct mmc_card *card)
> +{
> +	struct tmio_mmc_host *host = mmc_priv(mmc);
> +
> +	if (host->pdev->dev.iommu_group &&

I wonder if I am too cautious, but maybe we should have another
condition here to be checked first, namely "host->mmc->max_segs < 512"?

> +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> +		host->mmc->max_segs = 512;
> +	else
> +		host->mmc->max_segs = host->pdata->max_segs;

max_segs can be 0, so we should probably have:

 +		host->mmc->max_segs = host->pdata->max_segs ?: 32;

That also means, for the sys-dmac and Gen2, we then use 512 for the
IOMMU case and 32 (default TMIO value) for the non IOMMU case. My
understanding is that SYS DMAC can handle 512 in both cases. Maybe it
makes sense then to make an incremental patch setting the max_segs value
explicitly to 512 in the sys-dmac driver for Gen2?

Kind regards,

   Wolfram


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzZMj0ACgkQFA3kzBSg
KbZwTA//ZGgR4/1JbeNPKQ++DerCafySilftu/RpG5KKFZAIY+0ecC0BiC+MSrN3
Pr7CfCLf4AwgR9RwBRRAVQTEPpNhVpbVwpGIarv7k61dSU2fFz9Mr93qSrD8S4s+
kPMBNAW49O5M4ausIO1gzrCsSaApR/DR4BEjJgejREuGTvJtazDWDI3rAROwGBr5
g3hRSBVAEBYvECfk2Q01xLZZqZQuHa1qa/4DrwNN7qLEIfmR0kpPmmEWiexmBp0z
EBvkQ5mawK74ehjWSS7y4gNhWp/E344TN5UoiEOkfcYqIvAmAK0DiG0LbrE+Jn4y
jNt7SuqAWsc/rk5y4y7qTxQQuHktUj5C+AyHJ08xXrR6PSJuMOdS9lAB8QgYwrAK
YZ8Hc8GHlrfylQQO/5EWX01SEBBrcDhVcbwq7sILiwt3HBbP5LQSFKZ13uNJjUke
A+5PP5AoiHU6JqnrxOBAkXu2IIvOLBvOJj57YbwrnOYi6RT2CtrfNAv+skMvHggT
Uv2UArHZjvoi6/EW9qgMkha/oXipGNHAFaZhC2tvpGCFQwR/xk3Faolcs4rdMCHh
8MmRigEyKBN4oJIq8y106MSQ5OBXlUMVW5DjBqs2LnVLSNiSUcpTDXnrXMMhMI/y
dtA+BWLogsXmhZTxFHdfHqpWU0N3UO+WzQpWQBSF5o3euXzaJ9I=
=JmKS
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
