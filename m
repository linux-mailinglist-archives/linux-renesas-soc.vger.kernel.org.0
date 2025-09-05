Return-Path: <linux-renesas-soc+bounces-21495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30AB45B01
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 16:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90E03B99E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192CF2066F7;
	Fri,  5 Sep 2025 14:54:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBF637289F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084052; cv=none; b=eIIe7sVYj/16VD2hkl5UWw7+q6IF8gOXDDjSj8xcPWZ/zntT6QTBQj54DvCNWWKKWkRyj7C6U6QXOi0PaDgUuf5i5/6w6BLcc2w7Cwdb2lmJms4SdfG6BUzAFLEnVAtRPRA4TVuf5SiIsppCnHcWVIIwBEq2NRoTh8eHT2Bz6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084052; c=relaxed/simple;
	bh=WjRXupgPJ/figm33/ag919mEa+sesxxKQ0aWzjSPnbQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XC7x5Ffd+DkUsM3v0jR+E8w0yN/wRjMmnsWkW/YtifoEl94/CuYzqOEvhuJGFYwTN2PcBd4D1e0SJME2ypuVe6FLpAOOSOjKsfNdQipfxpLLkFgVcb0zhfpfLZXqNNPPSHDOH1PIAOpNaDj3BN2pZp8Pw272UErvqTrRNd0K+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuXp6-0007kK-8c; Fri, 05 Sep 2025 16:53:56 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuXp5-004OAc-0H;
	Fri, 05 Sep 2025 16:53:55 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuXp5-000W8Q-01;
	Fri, 05 Sep 2025 16:53:55 +0200
Message-ID: <1b2d2410dd9c300da1ffe015ed4835208416798b.camel@pengutronix.de>
Subject: Re: [PATCH 2/4] dmaengine: sh: rz-dmac: Use
 devm_add_action_or_reset()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Vinod
 Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 05 Sep 2025 16:53:54 +0200
In-Reply-To: <20250905144427.1840684-3-tommaso.merciai.xr@bp.renesas.com>
References: <20250905144427.1840684-1-tommaso.merciai.xr@bp.renesas.com>
	 <20250905144427.1840684-3-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Fr, 2025-09-05 at 16:44 +0200, Tommaso Merciai wrote:
> Slightly simplify rz_dmac_probe() by using devm_add_action_or_reset()
> for reset cleanup.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/dma/sh/rz-dmac.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
> index 0b526cc4d24be..0bc11a6038383 100644
> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -905,6 +905,11 @@ static int rz_dmac_parse_of(struct device *dev, stru=
ct rz_dmac *dmac)
>  	return rz_dmac_parse_of_icu(dev, dmac);
>  }
> =20
> +static void rz_dmac_reset_control_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
>  static int rz_dmac_probe(struct platform_device *pdev)
>  {
>  	const char *irqname =3D "error";
> @@ -977,6 +982,12 @@ static int rz_dmac_probe(struct platform_device *pde=
v)
>  	if (ret)
>  		goto err_pm_runtime_put;
> =20
> +	ret =3D devm_add_action_or_reset(&pdev->dev,
> +				       rz_dmac_reset_control_assert,
> +				       dmac->rstc);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
>  	for (i =3D 0; i < dmac->n_channels; i++) {
>  		ret =3D rz_dmac_chan_probe(dmac, &dmac->channels[i], i);
>  		if (ret < 0)
> @@ -1031,7 +1042,6 @@ static int rz_dmac_probe(struct platform_device *pd=
ev)
>  				  channel->lmdesc.base_dma);
>  	}
> =20
> -	reset_control_assert(dmac->rstc);
>  err_pm_runtime_put:
>  	pm_runtime_put(&pdev->dev);
> =20
> @@ -1053,7 +1063,6 @@ static void rz_dmac_remove(struct platform_device *=
pdev)
>  				  channel->lmdesc.base,
>  				  channel->lmdesc.base_dma);
>  	}
> -	reset_control_assert(dmac->rstc);

This patch changes cleanup order by effectively moving the
reset_control_assert() after pm_runtime_put(). The commit message does
not explain that this is safe to do.

If this is ok, I'd move the reset_control_assert() up before
pm_runtime_enable/resume_and_get().

regards
Philipp

