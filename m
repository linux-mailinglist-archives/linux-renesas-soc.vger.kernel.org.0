Return-Path: <linux-renesas-soc+bounces-12591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682AA1D7B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 492DF7A2147
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402F55672;
	Mon, 27 Jan 2025 14:05:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD953FC7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986725; cv=none; b=Nba1cpOQowbnIlAU6oTg45XQZrR/IghAIxBpbI3zGRf4C+c2dHfTs5Tn8lj58tT6keWDT7OLtkWPIS7Utcfn33eMOzGLMwnYgT/47B8HKnQ1L7nxG/VqyRgvPk8UJFQy0muRBSjpx/qkPP1YqMOyOg5OwWZpdDDFP8RnCAmzC2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986725; c=relaxed/simple;
	bh=pkmQ4hxVXY3OunO99Zo9hrZjjGOkiLQDmc8vG/DnwBo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dCMOqsnOyxnjS7j7ukaeNi0w7+1RI4+MCq8u0DSwscgp80AUjXbgI9BaLiGi1sahlWK0D2wQbSVbYRfcDtlfh/yjinRbQfH8OjSUyLsImiqc826PHBbHjlOsqyCmFFjXTI0/PNr0KZM3i/l/kL/vojAy3fLci0aAddtVUkezj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcPjm-0005Zw-T3; Mon, 27 Jan 2025 15:05:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcPjl-0028fq-2Y;
	Mon, 27 Jan 2025 15:05:13 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcPjl-000AYS-2J;
	Mon, 27 Jan 2025 15:05:13 +0100
Message-ID: <949114db0aa8a4cdcc66276f300a0e82acb60c7f.camel@pengutronix.de>
Subject: Re: [PATCH v2 05/12] irqchip/renesas-rzv2h: Simplify
 rzv2h_icu_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>,  linux-renesas-soc@vger.kernel.org
Date: Mon, 27 Jan 2025 15:05:13 +0100
In-Reply-To: <20250127113723.24479-6-biju.das.jz@bp.renesas.com>
References: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
	 <20250127113723.24479-6-biju.das.jz@bp.renesas.com>
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

On Mo, 2025-01-27 at 11:37 +0000, Biju Das wrote:
> Simplify rzv2h_icu_init() by using devm_pm_runtime_enable().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch.
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 5c5d2e015a88..f90652013082 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -463,11 +463,16 @@ static int rzv2h_icu_init(struct device_node *node,=
 struct device_node *parent)
>  		goto put_dev;
>  	}
> =20
> -	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "devm_pm_runtime_enable failed, %d\n", ret);
> +		goto put_dev;
> +	}
> +
>  	ret =3D pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
> -		goto pm_disable;
> +		goto put_dev;
>  	}
> =20
>  	raw_spin_lock_init(&rzv2h_icu_data->lock);
> @@ -488,8 +493,6 @@ static int rzv2h_icu_init(struct device_node *node, s=
truct device_node *parent)
> =20
>  pm_put:
>  	pm_runtime_put(&pdev->dev);
> -pm_disable:
> -	pm_runtime_disable(&pdev->dev);
>  put_dev:
>  	put_device(&pdev->dev);

Same comment as for the previous patch, pm_runtime_disable() is now
called after put_device().

regards
Philipp

