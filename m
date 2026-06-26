Return-Path: <linux-renesas-soc+bounces-34433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id duwEAHtfPmoDEwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 13:16:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 098BF6CC53F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 13:16:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=0k67a980;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="k Da5RLB";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFE38301F1A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 11:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0011137D124;
	Fri, 26 Jun 2026 11:13:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFF249E5;
	Fri, 26 Jun 2026 11:13:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472420; cv=none; b=ayuXGsG7oC1ObMMZhODb9PYeOumDu2B4eBRlzyuVjMrmBtHvEEzWSddgOhQwDikRKUh00DR+vSz7vashi25IY35Cpkl7qVn8JJVh+YTNGYHdI3Dtqt6jdzG0z+g9iRv4JEIxAC5CedIglqAD5c5Bwg11C39M7OmuUnddqSCId1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472420; c=relaxed/simple;
	bh=jYzUyNg2BzCyHCyljmNgyoGO/ZTdxbKiDL8aakP5lfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMBlwNe1ZXY6rnB2vnky5yU8upcfh2LAbdKnK6bjOh8NU6mn3OJzzO355v5q7jg9HVv37bsLfcofmdiFOppcE6WiIcnag3zy4Oy63GNIiD+gsbSxoCgdB6Y7f4+LGv4u4BGpDacJHs+hf9hIVrDWx9GTK6wAWcTkTgnkEJW0TMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=0k67a980; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kDa5RLBJ; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8937140007F;
	Fri, 26 Jun 2026 07:13:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 26 Jun 2026 07:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782472417;
	 x=1782558817; bh=DkIe6IIzIUkERQp92F7R/s+OmVtx8U2AcTyMiuEsWgU=; b=
	0k67a980kWftSOcF7jfkk1zO4cQ3IAv7isyRla7/0kKaAzli+CHbtlvLLNk3/2lB
	2F19i/kE/JwhdvyUW/xlQs4EAAtecznwywpm/18CF/i2IzzV369aB5O/cka2RIRF
	aRrojHOnT3/XfP0n4TSZGwtGs6Fk+l5yuEch93oETdoB1TfJImHhiyQQwI7D8QF9
	kzr3u8eY1+kofldTK89iADcssIshMb5trx8ChES2dJzwauRANxBOvTrJmk179N6z
	xm9i6BjxbqzVsZqZxQgyNp6E7LTY5cZAOwhuGWe2ecWEQcp9tI3Zajxa+549izfU
	Q51cViciQfLs0WejqKZZkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782472417; x=
	1782558817; bh=DkIe6IIzIUkERQp92F7R/s+OmVtx8U2AcTyMiuEsWgU=; b=k
	Da5RLBJ30pp3SCtYuJlm6WTd/m735dc9CI7N86GMMw4zA+HxnL28b17cgoUVGfkn
	JJZK50DXxHhZlPFQliRWsNR2kYKgiXQHpbod/eBGNlnlJ3/BQQeMPKNSn2l7hVb0
	2Cun0WDG+Y/nMIEqePUdVXoLZ8433aLbWaco+fXlKtIoMgS473nMkmuk5/Crh8V8
	IL/vte491PULcDAbs+J0FJ7EzUlp550nEFy3x2PBqof/y4yim1vxzPFJrQU+MOBH
	ueuKrbU9UhmaCNTPzrUi9XNIpHCKJBoWj7e0cLpxm5uDWQRGKZeqtBuZiD8dmjiW
	/BLJgLkFj3smmVXKGsJvw==
X-ME-Sender: <xms:4V4-aminitDdt67_kalg3Ns6470fTFqB2XFwz_3sRHV1-YXgnUYLBg>
    <xme:4V4-ai0igp4BO5UuA0BSrcp-Ixu4Fac2Aoe5bDdw7dA-FHUqimEkgYvVPH8rRB0oP
    eJbC8DjnOdFKirFyvmTAw7dIuJNkYyh38VQtSwr4wvwO5vnCb2AUcc>
X-ME-Received: <xmr:4V4-apc06rdRtg4oYIEd-qyNg0BY2ZRml0NtO33Yo_GP8sKHHADC2_O1UFEQLQ_s5W9W9scdBYZ8cEpeNewjAZzKXY2W17A>
X-ME-Proxy-Cause: dmFkZTEOMnDGdv4SKZybQRnJFhQ2b2puCOF8Gi4tPKLS+dShR42im2dB84oOC6xbbUbZIR
    EAsYI8B5frFZG2t2qhVZwlQJDMXLUiMZ+xxTO+ccsNzthSaLskYxfqb3iqNDQ74A1CYiiG
    AH7fqyXm0RXCv0VqwR33BNKqbcw4h0x9SCj2zKGiVjqQoO3bVSFG76CZrsf/zintw+aZNV
    b//WFjv+zsA3Uq9veav1RNTVAi92O5ul+fAdZntY0/l7qH3ej+dz66hjOOsGa/NlAqPNT3
    BW18REP4l61fxjXhBOav/dJR8DYSKqmz+Mz+zFyxpYtpGkJD3srV6tr7YWQ6pDtaxL4DHd
    0z0ow+ItPg+G2OCRG8gbDlINeoMDUnFBJYCg4e3jrklP1B/6v55AHfplVFm4HZIp+GyBfZ
    jjoCIm2jYmOfjcv+omWbwKx8rLjeQm7Lj4ZlhnOs3sGLYyONk3YQ++3DAH4t/ZSPBkN299
    goAOjB61iJuRSrUGa8fbo4/heWNfoteQb7JHGGHZwpCiDJSf44kOcL7W0V+XLLFEBn/17G
    USrkhUXVN0PGlGaJhySn50EwDrxLF2xXVbM+lAhvyY6oXG0dqqf1Xuo2K6HRunzHuImvKQ
    aSam3BYBtDrLspoD+nB61OzU9dRaO7IuDXFHnvhXuWBS8BCrkgKOSKoQGjJA
X-ME-Proxy: <xmx:4V4-aoxL2lnT0Weexu0o7yWyvTN8RJULMLGjBjVr2mvvSX60UKeMww>
    <xmx:4V4-ahyJbLWG-oCU0S51_Ys_sggBq6x-slo4hEaQnxv2XNjQon7fVA>
    <xmx:4V4-apZaNJv0ttRLLRnIWa3VRhYVHR1AzD4IxPqU12yjIXOscMnpvA>
    <xmx:4V4-aq1jjn5lfDK-YetlQ7Yto80wZIIiYliwh4auzcee5LmfHPU6ew>
    <xmx:4V4-avpRDZOWQO_lki_qF8JPsBMTHWIXT8vTHcjQCu3bR_AGxwjo7PN0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Jun 2026 07:13:36 -0400 (EDT)
Date: Fri, 26 Jun 2026 13:13:34 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Dan Carpenter <error27@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <20260626111334.GB1325538@ragnatech.se>
References: <aj5WnseULiwgmlWv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aj5WnseULiwgmlWv@stanley.mountain>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34433-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 098BF6CC53F

Hi Dan,

Thanks for your work.

On 2026-06-26 13:38:22 +0300, Dan Carpenter wrote:
> This code accidentally calls thermal_zone_device_enable() before checking
> whether thermal_zone_device_register_with_trips() failed.  Move the call
> until later to avoid an error pointer dereference of "priv->zone".
> 
> The driver works differently depending on if we are using OF thermal or
> not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> call thermal_zone_device_enable() if not.  We can share same error check
> for if either of these fail.
> 
> Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> The original code used a three step process to cleanup:
> 1. Call thermal_zone_device_unregister() to cleanup.
> 2. Set priv->zone to an error pointer to preserve the error code.
> 3. Set priv->zone to NULL to avoid a second call to
>    thermal_zone_device_unregister() in the rcar_thermal_remove()
>    function.
> 
> Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> handles the cleanup properly.
> 
> Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2: Use the correct fixes tag and re-write the check in a cleaner way.
> v3: Share the same error checking as a further cleanup.  The
>     thermal_add_hwmon_sysfs() and thermal_zone_device_enable() functions
>     really do serve the same purpose even though their names are
>     different.
> 
>  drivers/thermal/renesas/rcar_thermal.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> index 6e5dcac5d47a..fd686da9252e 100644
> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c
> @@ -492,12 +492,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
>  						&rcar_thermal_zone_ops, NULL, 0,
>  						idle);
> -
> -			ret = thermal_zone_device_enable(priv->zone);
> -			if (ret) {
> -				thermal_zone_device_unregister(priv->zone);
> -				priv->zone = ERR_PTR(ret);
> -			}
>  		}
>  		if (IS_ERR(priv->zone)) {
>  			dev_err(dev, "can't register thermal zone\n");
> @@ -506,11 +500,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  			goto error_unregister;
>  		}
>  
> -		if (chip->use_of_thermal) {
> +		if (chip->use_of_thermal)
>  			ret = thermal_add_hwmon_sysfs(priv->zone);
> -			if (ret)
> -				goto error_unregister;
> -		}
> +		else
> +			ret = thermal_zone_device_enable(priv->zone);
> +		if (ret)
> +			goto error_unregister;
>  
>  		rcar_thermal_irq_enable(priv);
>  
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund

