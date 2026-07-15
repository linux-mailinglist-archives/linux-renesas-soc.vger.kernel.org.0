Return-Path: <linux-renesas-soc+bounces-35249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NOXLC6dTV2peJQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:32:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C21075C866
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:32:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=QNsAILbF;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="F mSyGTF";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD5B30948FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7BC42255D;
	Wed, 15 Jul 2026 09:26:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9943ED3CF;
	Wed, 15 Jul 2026 09:26:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107596; cv=none; b=skvxqtmxX8gVeLRtS9J89pTegUe2cHkKrP8pbXhb1g+6rwixWU89/OdXV32mSIdwkQ57uJyDPpJE9GapQL6hq4cQLgWoqtJHgw+g7haIxyjP3Wyq2lLRaTAr0jj2vxj8x64I4P74p1jX+cjt/fJtzxzM6UG30KBBri+oa6XInF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107596; c=relaxed/simple;
	bh=Gw9d+azDSiBHe7zI7M5WDXfQEEpbX27nlNrMMPDaPgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek9ggZ3IjiLCZvEu2/t+rQHocagrVZ3JBJBEmk0EWF2shjzzIo4pDmTJVv5xIbUlFeQxnfbNQE3Rz4sBRkPLvqyMXiKhiuO9Cs9k0EyOChXo1jphNefqQSSu3WtAtNiuVk8mrmH3HyxtPblTEs0S4r+vA3DNILLK3F4Nprp3N+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QNsAILbF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FmSyGTFF; arc=none smtp.client-ip=103.168.172.159
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 26D7C14000CB;
	Wed, 15 Jul 2026 05:26:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 15 Jul 2026 05:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784107591;
	 x=1784193991; bh=RHheL60c0QV2tMAPkrEKcnYFAylqde2oM7O4i68nidI=; b=
	QNsAILbFA97F3JtdVS0gYjZSS9yF12AP80UBjFfoRS3YuhEqejUZkaziEKAVZwsM
	uZ7JL43teuDeXq2KKuTiVuCfxzeYwEi2IixGlKIiRQfTKB4269SV2EFf7hxv8MQ+
	itCh+i0TCNIMmq0LwdnLm6hm8AM2XsUjo+s2YAY9jmIijgTh5b1w3zURjBeqpeSm
	79vMXHowyjmE/Y71mfnP3NrUvSCtPuUdu+PvbM7vPF+J/koL12/qsokkXRejPpjX
	LSHEDdHFc8S4PgRHhjRGNNWt5EgXj5dM0Kijw5bftoqhJdXtgOY7HN6d4s/MSpgB
	VZpTuoYgSlV4sB06vCDAkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784107591; x=
	1784193991; bh=RHheL60c0QV2tMAPkrEKcnYFAylqde2oM7O4i68nidI=; b=F
	mSyGTFFhk1eevGasfNhytFnt1F7xUgHAWGsUSIlizkr3cggdA+aeKq33Ec/4CVQL
	2LyzWNvOzx+0Zr2QXeb0wl1lNom5UjJgvE7j12s5SaKvu3RtmZxB0FbQEORi/dP/
	iVTJbcjqDo5Xp2tcOKJsaSHNRw3JfNuBVQhe9FUaFkn/Q+wJOotyfiFn6WX/cgN6
	nAP4K/4Fr4iUCilVDBgo581c7GitCk/jiNNi4frrHra97VUZI8qjcSK3OBujLftd
	EsHaxUgu2pxrnw/x5Ae0Og1pCKlX73POm7Pii2dKXWzJoOsWpqRRFleb4XShuwdF
	zh023aMZE6v0ojQTTw3dA==
X-ME-Sender: <xms:RlJXagJzJGPRK2_KgZQkz6qLh6oAjQNvVRTamULXpqqa8y261lHq2A>
    <xme:RlJXar8u4nT3tRv7rC2uFGU3557u4h4p9L7E1yZSBDEJcGhKKs2HLrQpPxSLL6cLg
    FzKdyYoiFkeL1JlLQjWjl2qFNBEI4eHUD9G5NXS839Z4RjAg1Of5Co4>
X-ME-Received: <xmr:RlJXasG6snxbTeUxvpgM7CIjLlC2xsFbO7eRyK8SQKhp7OYkSGaXR5xnkFCCAaUxqfIK8Puu0LqnzefJ1Mp16PZmfEvVoRE>
X-ME-Proxy-Cause: dmFkZTEVthRYG87x0RWI7lFO6KZoE6B1uews7yLk+z8qQMXlYp6TA5AvYq2s5o5IKlc4Ou
    Ie6n3sgQCcf1VZ3CeQaVgIQhFAtdEiTV/xgLjh2yuh/E1dSNv7KXwqIxKswtheXWy7rxBN
    xLjmhdTvw3ZVPeirLhFGuaEfSeEauJPrCojDsdERu1eJN/zMIaPJ7KT/pPjxQ2bS3tHbpu
    X4gA5g19ZlAbEVhh6dbFee8fRBr2H1XHayzCSpWA0sUglxSBA+N/ItzLsN+CfXq1hpECmc
    qFWCT6RfY4BqaeFTSO4DkvZF6iHtjUgv/b6MD15GRyk4dkT6nUcpo8gV7qjtnVuLOvdpJl
    apS5SAEMSwDMclo2GTxG+TFXfmP2IStY7zsRxYoMy2VP7x2EBO2iVaIPD0uKRLheX36Osn
    0Luuh7n+zEb/52udRUJqzMcFzp4j9uLix2N9Rz4XfDmZLAw1NIYHAluAiaLJxiu/UL0NJz
    ll/Ziu+FLZJ0NCAMrzv8/9VjvXlpEuDWZgFzktPwQa3D3xPpF2748ztLqnB2Qk4KK3ugMz
    z9ECo7+JzlyE+1mX5ONi6cZL+ILaKKOpdNaAjlMfd75K3G+WQgQVsvYxGReltIM50emKq1
    b3Ec3nCN5iCKFCz0xCu4RqGMw+mAMnMkel8QTsOEEMwiLa1ww3CvUs2OGPZQ
X-ME-Proxy: <xmx:RlJXam4nfWa4gscwE275DjUfffNPOe5tpqrutthZBQ3SfToHlEw9UA>
    <xmx:RlJXalY0qRjTdD86zHiY0ZArQ3pMaLpaTiV6V9t82_vhbIH9bf4kMg>
    <xmx:RlJXakheV4OIUu_5c1_3S9rVYtEe6YrUynKq5Jp7h4fl54rFvGt7TA>
    <xmx:RlJXanfi4I4a-a2Y3qLZ2pNJgr_AKxZ-V_SiG0qRErPun5KxNOJxOw>
    <xmx:R1JXam3tHO3TN2xAf8W-kNQpCfi7yYEZDq-liCN0S82_Q88ngJX0RVlY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:26:30 -0400 (EDT)
Date: Wed, 15 Jul 2026 11:26:28 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Pan Chuang <panchuang@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:THERMAL" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/18] thermal/drivers/renesas: Remove redundant dev_err()
Message-ID: <20260715092628.GF3059211@ragnatech.se>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <20260709023048.599150-15-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709023048.599150-15-panchuang@vivo.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35249-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:panchuang@vivo.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:john.madieu.xa@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:from_mime,ragnatech.se:mid,ragnatech.se:email,ragnatech.se:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C21075C866

Hi Pan,

Thanks for your work.

On 2026-07-09 10:30:17 +0800, Pan Chuang wrote:
> The devm_request_threaded_irq() now automatically logs detailed error
> messages on failure. This eliminates the need for driver-specific
> dev_err() calls that previously printed generic messages.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/renesas/rcar_thermal.c  | 4 +---
>  drivers/thermal/renesas/rzg3e_thermal.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> index 6e5dcac5d47a..cf80e2655416 100644
> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c
> @@ -446,10 +446,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  
>  		ret = devm_request_irq(dev, irq, rcar_thermal_irq,
>  				       IRQF_SHARED, dev_name(dev), common);
> -		if (ret) {
> -			dev_err(dev, "irq request failed\n");
> +		if (ret)
>  			goto error_unregister;
> -		}
>  
>  		/* update ENR bits */
>  		if (chip->irq_per_ch)
> diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
> index f0e29fe633db..c44f5b8858d0 100644
> --- a/drivers/thermal/renesas/rzg3e_thermal.c
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> @@ -461,10 +461,8 @@ static int rzg3e_thermal_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(dev, irq, rzg3e_thermal_irq,
>  					rzg3e_thermal_irq_thread,
>  					IRQF_ONESHOT, "rzg3e_thermal", priv);
> -	if (ret) {
> -		dev_err(dev, "Failed to request IRQ: %d\n", ret);
> +	if (ret)
>  		goto err_pm_put;
> -	}
>  
>  	/* Add hwmon sysfs interface */
>  	ret = devm_thermal_add_hwmon_sysfs(dev, priv->zone);
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

