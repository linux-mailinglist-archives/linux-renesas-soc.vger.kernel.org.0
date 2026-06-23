Return-Path: <linux-renesas-soc+bounces-34366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Z29Iv9BOmqr4wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:21:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A7D6B53C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=D8iiQu1z;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="K BDWkrs";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 260273024511
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6422E3CC32E;
	Tue, 23 Jun 2026 08:18:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A882848BE;
	Tue, 23 Jun 2026 08:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202709; cv=none; b=Phr97v4TkaLqspv70Vv7ZqAd9uD8VtlsrZ+vXgsB6t5AUEPSCDtussLHf5PKFvHpkuxsuNcCNhjwQTz/g+SyoFQvcy5/MPy824hhpfqKp8AMl/rFPJAdszVIzp0dVIqhvTcqBkoGNNjxeLgRcct4WSQDZZofTEFCWMctloyc8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202709; c=relaxed/simple;
	bh=yoUzsa95RhqJEgutS52suqvIBpvD7HV/GdWxjcvRMKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1RKi1N3+0Ruiu8dPaRzaF0gmw4UjRQSNUw8skA6JXr5cggi2j1c5hExdpSJ8UhLrUtuMUMKf2fjl+1k41fZOlRL8+/EdIstYQMaO0vBWKnqnsKrohueg0rKSWDrnzpVO6MmmCSMCebxPDdJ0htpir/3Kr5riOYVLEECdUPRSlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=D8iiQu1z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KBDWkrso; arc=none smtp.client-ip=202.12.124.152
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 624237A013C;
	Tue, 23 Jun 2026 04:18:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 23 Jun 2026 04:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782202706;
	 x=1782289106; bh=uZgbKFGXZqJi9f6tN/Bf7E+BgXfTbBHtxrri4BcfqOI=; b=
	D8iiQu1zxw5G7Tg5NnHwhmQVBhsF0BBbbW1WdXyoCblqbE3p8+ZUvEHkpox8pcgn
	1OapQBR1cEpTs8rUP8fVjE0uqfO/isdHTKmdOgaumebRgren8G5BP2y2zEAuvzMv
	B3wBPV1dMAcVtMretflxXI5jP5+ejfxZa96qPUxXLv+BFA8ysPaBtaTScYWOETfy
	g6ZYcQhKA5NjOCQa/imW7LzFbqiC7udppObf446GR/7BBbv53Y1D6heNJz2sQKOn
	ly8kC+0YhSfZfPaC5UTIgcUp4Pkhv2XdEl9/qAB08c8d0LNJVVQ2f9v8ub0rTGFT
	N0mppnG8dIP1bylpnYa0Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782202706; x=
	1782289106; bh=uZgbKFGXZqJi9f6tN/Bf7E+BgXfTbBHtxrri4BcfqOI=; b=K
	BDWkrsoFv6mGjivQwy6GdOpInvZc+WZPQ9ufVivpu9BZu4sjT28g0pqcfP/TvcCH
	GX034eBSgaJRmC4vsk/vnPV1054iGtC/Z4E0jaHOSmRdX9AyAKQbxf3tV9Vc20N4
	e6gMg1ySke3U18dxBE+/Kk6h/tpWdHx6gV6pgvRr/hD7Zmw0sqPvw0u1XEDYWwIG
	c1bZojPkmS7lDgmrsDCDAeMTy6VqKIOQ+3l8J+8W5WuQ3TbVJj8ZFCTCH7+Avir2
	H4T0kMeI7Tmhm5ur6txJmDEfvzQfLWPQu/NLuByOHZYAGUQtGufRFU3kRofW1leW
	9hFSQTKGx4RVRhRjGpiEA==
X-ME-Sender: <xms:UUE6apEub4skCU2fjKXwT-eea8gIHKUBKvGZbNW3RxaF8F77Fc8U-Q>
    <xme:UUE6aqKECquRsU4M7STnftfyC4VK5D-w23-8rQApo4aRbXmfx3Mv78iV4l96ZBREO
    Bg-oxYCeog7qStrY98fBU51bwKPHDdvMDnZJGibvgcvcBMvWDBGmAw>
X-ME-Received: <xmr:UUE6amg-TdCCwiLtvGxJCJwPuH3iRiaUyJBSv9WOie2ozBNznmgxOe2RSFT9FKsbMLI9ARYUB9__TnhJWH2F3teWz6oyl90>
X-ME-Proxy-Cause: dmFkZTFbbnCQ7N/bL+MF7HA9ZAFH1k3OOAe0KaBvdZJx8nXvlurWeZCa7LOxzkVtAFWAoq
    fG6eITsINC8dlVIY1gZBQyLE+f0vkPzgDQGoh/eUyrWSwuW1VmA3GbB3zaqKjKH1exZkWF
    /+eFyMziilhLwnQJa0gFsS8MB1v7/Hav3UTTveYx5kqRthBz4kQLNW/JN22FRyR22IBgHR
    5CgNGb16mHbmRdFmWnc6LFEFp6InfD5SXKG48Fe2EeAJXBN5cVkflajCO3b+Td20yg+2tf
    pQezncV0pVPCMv23LIQBwKT9GvYpkzYibNMEwAvyhXy94nmUzxolK7jdD3ZG54Zhod+tg+
    xOJppoWCQHA09TRVPue6EU+xaIY0Of8s+48gsZnqemcbIs1MCqLdE0MTsyLl7xj+Kh/pQT
    ABGm07xTmtAZCuftkvutZWlyBjwh4DVxE++qdB4pjZFQEGkN1Hj4tZcPlsBYUhTvlMYiHM
    e1NC7n9aOkgZT8VaHMT8xIBu13JYiHAnmmChriEqWWRUks4vr2KBwfF0mlofwokUz6XH5w
    LcrhArcMATCY1w8Cj59eyoqp/nF2gg+hkA81k9pwQ0AwACEUCoDMZD08KpMh4LOCJHhnGt
    dNA1dIMBKmdVTazgigOenrdOqt0OG/6hfkMfcM9PLKeIufZ71noSf1d2OCnQ
X-ME-Proxy: <xmx:UUE6aok_gwGq0uWQlsz5Nqtgx_sDHipfaT3I8fa5ROjEcuV_GhRJHw>
    <xmx:UUE6atW5zTYq0AffxqpHTNBHt8LVQGYVNXTu7aPf20_pNrdSbamO_Q>
    <xmx:UUE6altP6FsSPa6Pc38M4_7s6N1fuTbEei-1Ae1iODJPmbqWIgIO0w>
    <xmx:UUE6ao6ZsrRSthbPvA9qWeVTtJxXyvOGv_fRnMVMmZSe9ssx59imug>
    <xmx:UkE6am-uSqAV1QoNFxpQBkt_v8l8ZoW2L1ZpHcUepXbjBvmCI_dJmPrC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jun 2026 04:18:25 -0400 (EDT)
Date: Tue, 23 Jun 2026 10:18:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Dan Carpenter <error27@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <20260623081822.GB3937090@ragnatech.se>
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajo6iQ3VWvcxedA9@stanley.mountain>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34366-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1A7D6B53C7

Hi Dan,

Thanks for your work.

On 2026-06-23 10:49:29 +0300, Dan Carpenter wrote:
> The thermal_zone_device_register_with_trips() can fail for a number of
> reasons, including allocation failures.  Check for error pointers to
> avoid an error pointer dereference.
> 
> Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")

I don't think this is correct as this commits just moves the file.

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/thermal/renesas/rcar_thermal.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> index 6e5dcac5d47a..71f836fbc698 100644
> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c
> @@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
>  						&rcar_thermal_zone_ops, NULL, 0,
>  						idle);
> +			if (IS_ERR(priv->zone)) {
> +				ret = PTR_ERR(priv->zone);
> +				priv->zone = NULL;
> +				goto error_unregister;
> +			}

While this indeed is an issue that should be fixed I don't think this is 
the correct fix. Below the if .. else .. block where this is added there 
already is a check for IS_ERR(priv->zone). That however does not guard 
against the usage of priv->zone for thermal_zone_device_enable().

We should only call thermal_zone_device_enable() if we are on a system 
that uses OF (gated by chip->use_of_thermal) which is the reason for the 
if .. else .. block in the first place. As chance have it we also have a 
check on chip->use_of_thermal directly after the existing 
IS_ERR(priv->zone) check. I think it would be better to move the call to 
thermal_zone_device_enable() there and avoid having two checks for 
IS_ERR(priv->zone)? Something like this,

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..dd13cf971ddb 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -492,12 +492,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
-
-			ret = thermal_zone_device_enable(priv->zone);
-			if (ret) {
-				thermal_zone_device_unregister(priv->zone);
-				priv->zone = ERR_PTR(ret);
-			}
 		}
 		if (IS_ERR(priv->zone)) {
 			dev_err(dev, "can't register thermal zone\n");
@@ -507,13 +501,16 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		}

 		if (chip->use_of_thermal) {
+			ret = thermal_zone_device_enable(priv->zone);
+			if (ret)
+				goto error_of_thermal;
+
 			ret = thermal_add_hwmon_sysfs(priv->zone);
 			if (ret)
-				goto error_unregister;
+				goto error_of_thermal;
 		}

 		rcar_thermal_irq_enable(priv);
-
 		list_move_tail(&priv->list, &common->head);

 		/* update ENR bits */
@@ -528,6 +525,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)

 	return 0;

+error_of_thermal:
+	thermal_zone_device_unregister(priv->zone);
 error_unregister:
 	rcar_thermal_remove(pdev);

>  
>  			ret = thermal_zone_device_enable(priv->zone);
>  			if (ret) {
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund

