Return-Path: <linux-renesas-soc+bounces-12262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9387A16A6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 11:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A51A47A558B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F75197552;
	Mon, 20 Jan 2025 10:05:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711151B6CF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367507; cv=none; b=Jz9qmuznI5BRhnpiJd2F0cZjDleWyDuflgHVAWHfUzLvkaQcNYGYHz0B/NrPamQ6JRVVNijewGH/ISaokUtjwPukwi8eHwpHrojsJV7zX2UT/B6wXw2H1pxCGcEfOL0zludUWlgSzOTAKGPrfAEOhPVRqpByrKAXX5bqyh34syc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367507; c=relaxed/simple;
	bh=Lozs5MlT3jPgE3FjPQWrAZXmDSTwtbccze31eOPDTEA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fpihUU2l/18Sr8HmtmZvAgYi9u+mRzjnP7INbwBeHc3pVSSqo6JEyPrCI6FP9ochl/gjrgAHQKtQFgkMvXyvS+w6J1bm6hJUDCmnDqnFsKwqO9FVGkUkvVq5X4qb7tkw41GWoiC2QyO75+FPzDQDZPuzcSgASbnWbe32x0e6PRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tZoeC-0005E1-Ij; Mon, 20 Jan 2025 11:04:44 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tZoeB-000uyA-2Q;
	Mon, 20 Jan 2025 11:04:43 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tZoeB-0005mE-2D;
	Mon, 20 Jan 2025 11:04:43 +0100
Message-ID: <6dd5b81eef1cf3b4a73e2d02f6b25747b496587a.camel@pengutronix.de>
Subject: Re: [PATCH 04/11] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>,  linux-renesas-soc@vger.kernel.org
Date: Mon, 20 Jan 2025 11:04:43 +0100
In-Reply-To: <20250120094715.25802-5-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
	 <20250120094715.25802-5-biju.das.jz@bp.renesas.com>
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

On Mo, 2025-01-20 at 09:47 +0000, Biju Das wrote:
> Simplify rzv2h_icu_init() by using newly added devm_* helpers.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index fd432b43506b..a02d47529564 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -456,23 +456,23 @@ static int rzv2h_icu_init(struct device_node *node,=
 struct device_node *parent)
>  		goto put_dev;
>  	}
> =20
> -	resetn =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	resetn =3D devm_reset_control_get_optional_exclusive_deasserted(&pdev->=
dev, NULL);

This changes the reset control to be optional without mentioning it in
the commit description. Should this change be part of another patch?

regards
Philipp

