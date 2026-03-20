Return-Path: <linux-renesas-soc+bounces-30038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wT0SNXe7vWl4BAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:26:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16D2E157D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C8DE30AEE55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 21:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520A3D3CE0;
	Fri, 20 Mar 2026 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="bYC0V5FN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9515A36EAA8;
	Fri, 20 Mar 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041594; cv=pass; b=P6gJyHan60G0XJiBbHeYaZu2K0U4P/Un0/6kJs238SxEVDKvdffYX3R6qqEq/3PdEt9Oq2dNqN8r2NJwk2JeyNaVPTj9u0dk7SVAYqDwSjoSVvr/id4zQxJYhl3MCxuGJzsdttWtlNhKqgpRK6WkJttsy6B9H1x12+KR0TN58Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041594; c=relaxed/simple;
	bh=b8SNQJxND6/ZfHNk86plWX24Y+Zz7ydHBVZ0oUhx6SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3EYa+JeSl1xfAsYZHGkwrO5J/R+B45MHZEb1WdT2SI1LsHgPshhjB+hVRBDr7Qrugp4S/gWZOCBqjTBk3Xejh7Q62/sdXRO5D1tIVj/jXZCyW1wLINzx2i0dxvyW5/2rHNVaNp7rpyrg2ARS8LprBQwHNBCZNSm/xt+rqcP3NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=bYC0V5FN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774041580; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aaGoaHjUhMxHWMRhSnCTwGTZXHSkaWmeBtppZjPj2JcgBIqOAPCmy6+Ch+DNGSdpHw/HEqWKTnOXHFN0yh+D8Ld1La3UFBPd/+b9tEJCPkWJY+EPw7FzsPoJw+uezZ9nwm1K4DJLm+QoT44nuI1OdYVeWj6s9/73R0cWYedWKLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774041580; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SrfGOzwOsuPkIZyE7B3D3aXPgdDWl5kgcEWkFVxwrEQ=; 
	b=WUeqECfRzS/V0D5qyT6CYMLhZ6qeL7qDctB9bOzLW7fJdCm0f2YkEGF+Koa3DCsDnMslEFA1T4/9JAoDpuFlOKCTFkMQpm+6BcMziPKnkFHroqbYB93If4E2S2UvzVb3OLQyCQK84TGZH/63TQ45SaDj6GwuBBKNoEZSpwBkg0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774041580;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=SrfGOzwOsuPkIZyE7B3D3aXPgdDWl5kgcEWkFVxwrEQ=;
	b=bYC0V5FNA3b8oq4/6TtvmOMNoFX1Qkx3hdVgBKMZrUNsNsc/QXLZtRr5feqWtF+4
	Ln2rpjk1p+8rxFbq3x+7daytFmV1/HG8F2775AQpApDYmoNNQlWc1ekUJTEuSrqSocB
	qvciEUtRbNaQ5AOReCHvGvxH4jAhdfYuddHmVQiI=
Received: by mx.zohomail.com with SMTPS id 1774041578365880.9401943068087;
	Fri, 20 Mar 2026 14:19:38 -0700 (PDT)
Date: Fri, 20 Mar 2026 21:19:31 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju <biju.das.au@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock
 checks in runtime PM
Message-ID: <ab25E0kTBA4EjZ3Y@sobremesa>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320164158.487406-3-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30038-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.larumbe@collabora.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,arm.com:email]
X-Rspamd-Queue-Id: 3F16D2E157D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On 20.03.2026 16:41, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The clk_enable() and clk_disable() APIs already handle NULL clock pointers
> gracefully — clk_enable() returns 0 and clk_disable() returns immediately
> when passed a NULL or optional clock. The explicit if (pfdev->bus_clock)
> guards around these calls in the runtime suspend/resume paths are
> therefore unnecessary. Remove them to simplify the code.
>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index dedc13e56631..01e702a0b2f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -429,11 +429,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
>  		if (ret)
>  			goto err_clk;
>
> -		if (pfdev->bus_clock) {
> -			ret = clk_enable(pfdev->bus_clock);
> -			if (ret)
> -				goto err_bus_clk;
> -		}
> +		ret = clk_enable(pfdev->bus_clock);
> +		if (ret)
> +			goto err_bus_clk;
>  	}

It seems clk_prepare_enable() can also deal with NULL clock device pointers gracefully,
so maybe you could also do away with pointer checks in panfrost_clk_init?

Other than that,

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

>  	panfrost_device_reset(pfdev, true);
> @@ -464,9 +462,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>  	panfrost_gpu_power_off(pfdev);
>
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
> -		if (pfdev->bus_clock)
> -			clk_disable(pfdev->bus_clock);
> -
> +		clk_disable(pfdev->bus_clock);
>  		clk_disable(pfdev->clock);
>  		reset_control_assert(pfdev->rstc);
>  	}
> --
> 2.43.0


Adrian Larumbe

