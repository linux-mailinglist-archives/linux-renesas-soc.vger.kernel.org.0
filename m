Return-Path: <linux-renesas-soc+bounces-12590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6659A1D7A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E6C165728
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4466FC5;
	Mon, 27 Jan 2025 14:04:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0704823CE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986662; cv=none; b=j7px4z728b4OzZsGEF6CE1/UQIar2Y6aozePB26XEzWNmE992CaI4b0ikfs6nguo7W4PkXlm8fHteHxJwuyonxqU7w2DF4RDEiMRMfuzUh8S/XqysPQMIsGD432dXHpZMawY+MfqbHDZMwTnMYN17yUcOlGRi4215R6IUZDiSts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986662; c=relaxed/simple;
	bh=IgrgLRwYACj/vVKyPsYBKLqJkxHwpGE0W1zG/w/VIWU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RA8IEKBcMyma97uD43H/ukQziQvkOY+wdKd1dVEqxYTkti+0ztrlYzNENQocvZg8EIfZqETOq1RJPmg4K8xEQDzuxFAt7kE+cm1TGhVP6e4gly40FCC8wuuPLKstnlwEZSyuAoAf7P6wsmtLD78JHway1qVjTe0gdh2qo0/ZzIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcPic-0005NQ-EA; Mon, 27 Jan 2025 15:04:02 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcPib-0028Ou-1x;
	Mon, 27 Jan 2025 15:04:01 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcPib-000AVv-1j;
	Mon, 27 Jan 2025 15:04:01 +0100
Message-ID: <96331f6cdaaec5d5f3e31441f7880173d371d1c8.camel@pengutronix.de>
Subject: Re: [PATCH v2 04/12] irqchip/renesas-rzv2h: Use
 devm_reset_control_get_exclusive_deasserted()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>,  linux-renesas-soc@vger.kernel.org
Date: Mon, 27 Jan 2025 15:04:01 +0100
In-Reply-To: <20250127113723.24479-5-biju.das.jz@bp.renesas.com>
References: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
	 <20250127113723.24479-5-biju.das.jz@bp.renesas.com>
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

On Mo, 2025-01-27 at 11:36 +0000, Biju Das wrote:
> Use devm_reset_control_get_exclusive_deasserted() to simplify
> rzv2h_icu_init().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Split the simplification patch into two.
>  * Updated commit header and description.
>  * Replaced devm_reset_control_get_optional_exclusive_deasserted()->
>    devm_reset_control_get_exclusive_deasserted().
>  * Moved simplification using devm_pm_runtime_enable() to next patch.
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index fd432b43506b..5c5d2e015a88 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -456,15 +456,10 @@ static int rzv2h_icu_init(struct device_node *node,=
 struct device_node *parent)
>  		goto put_dev;
>  	}
> =20
> -	resetn =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	resetn =3D devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL=
);
>  	if (IS_ERR(resetn)) {
>  		ret =3D PTR_ERR(resetn);
> -		goto put_dev;
> -	}
> -
> -	ret =3D reset_control_deassert(resetn);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
> +		dev_err(&pdev->dev, "failed to acquire deasserted reset: %d\n", ret);
>  		goto put_dev;
>  	}
> =20
> @@ -495,7 +490,6 @@ static int rzv2h_icu_init(struct device_node *node, s=
truct device_node *parent)
>  	pm_runtime_put(&pdev->dev);
>  pm_disable:
>  	pm_runtime_disable(&pdev->dev);
> -	reset_control_assert(resetn);
>  put_dev:
>  	put_device(&pdev->dev);

This is mixing devres cleanup and manual cleanup in a way that is not
obviously safe. Specifically, put_device() will be called before the
reset control is asserted in the error path. To keep asserting the
reset control first, put_device() could be called via
devm_add_action_or_reset().

regards
Philipp

