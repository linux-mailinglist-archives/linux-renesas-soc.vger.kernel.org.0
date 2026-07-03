Return-Path: <linux-renesas-soc+bounces-34674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dlKnLVloR2poXwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 09:44:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 154516FFB08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 09:44:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFA80302796E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2026 07:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC0F35F8D2;
	Fri,  3 Jul 2026 07:35:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36FB34A3BF;
	Fri,  3 Jul 2026 07:35:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064133; cv=none; b=h+wQoQTBVQJ+/+EfTUEfAlTwC3sqo1/HbulTSzGTIezxVMzbtcEbRGPevyrzzbcrN8asDYR3QpYxSTXVQF4vPmbCM9OS+7RS6qbtU88nQWVmjOqNDIcwxD5QofsvHSIsnysqWBFTT6K+8YDVn9P2yBNMX9kz9zTQmoHifdkAFXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064133; c=relaxed/simple;
	bh=1RMCVM0ri5xRWmmTwn0X2lrg975xVKiP/sVzCS4vn9M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N7d3jVh9qf1H6jmP86shiI5kM7k8dQ7BoouFq4pO+N+hVHNTW52gnfyXf64YiAFaCEQZmcwunC3Ycb9gQgzTYRmziArjrKM5Y78C1Fo3TXDPEFh16zgXhL3nLEWK4jr2m78Q3EjxC3rm4B0YhU7Yo4DmGn2CjOzMlx+dWGOsdNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7C3BE202673;
	Fri, 03 Jul 2026 09:35:28 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfYQq-005sHr-1L;
	Fri, 03 Jul 2026 09:35:28 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfYQq-000000001rl-1Px5;
	Fri, 03 Jul 2026 09:35:28 +0200
Message-ID: <46cfa874bd2ce4b6189606ae391e24833c802391.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] watchdog: rzv2h: Convert WDTDCR handling to regmap
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Wim Van Sebroeck
	 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar
 <prabhakar.csengg+renesas@gmail.com>,  Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 03 Jul 2026 09:35:28 +0200
In-Reply-To: <20260702160457.1884345-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20260702160457.1884345-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34674-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:geert+renesas@glider.be,m:linux-watchdog@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 154516FFB08

On Do, 2026-07-02 at 17:04 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Convert the WDTDCR register access from raw readl/writel variants over to
> the regmap framework using devm_regmap_init_mmio().
>=20
> This conversion serves as a preparatory refactoring step. It allows the
> driver to subsequently support syscon-based system controllers natively
> by passing along alternative regmap handles without forcing messy
> architectural branching at runtime.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/watchdog/rzv2h_wdt.c | 83 +++++++++++++++++++++++++-----------
>  1 file changed, 57 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index e9545b8f5fd0..d0b38450cc32 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -12,6 +12,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/units.h>
>  #include <linux/watchdog.h>
> @@ -67,7 +68,7 @@ struct rzv2h_of_data {
> =20
>  struct rzv2h_wdt_priv {
>  	void __iomem *base;
> -	void __iomem *wdtdcr;
> +	struct regmap *wdtdcr_regmap;
>  	struct clk *pclk;
>  	struct clk *oscclk;
>  	struct reset_control *rstc;
> @@ -89,26 +90,20 @@ static int rzv2h_wdt_ping(struct watchdog_device *wde=
v)
>  	return 0;
>  }
> =20
> -static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, boo=
l start)
> +static int rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool=
 start)
>  {
> -	u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> -
> -	if (start)
> -		reg &=3D ~WDTDCR_WDTSTOPCTRL;
> -	else
> -		reg |=3D WDTDCR_WDTSTOPCTRL;
> -
> -	writel(reg, priv->wdtdcr + WDTDCR);
> +	return regmap_update_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCT=
RL,
> +				  start ? 0 : WDTDCR_WDTSTOPCTRL);
>  }

I would drop this helper function and just call regmap_set/clear_bits()
directly in rzt2h_wdt_wdtdcr_count_stop/start().

regards
Philipp

