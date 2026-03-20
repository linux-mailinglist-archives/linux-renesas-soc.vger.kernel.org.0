Return-Path: <linux-renesas-soc+bounces-30016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MoNE886vWkH8AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:17:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A87042DA06F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAC6430DA855
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECAA27EFEE;
	Fri, 20 Mar 2026 12:16:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A463AB29D;
	Fri, 20 Mar 2026 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008969; cv=none; b=k/OQC8YuiSpy3u4KWdySndhXSY77w0egfdYPFYUCJIXlmrHJZCW7l8Vin2PctDqw1Du0sXhiOEFvJuvZ+fZFR8PvkTzpUValpkBPARB2BkoL7cZzi4FRhVnxtWf05zK6gPtTfqCK9xqBjp6UWwUvdkZTHl0/X8u7HEsF5p4Z3lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008969; c=relaxed/simple;
	bh=MgpzbKhybOZYVIaamIxtjMJ0P1w05AVxvKtsPwA5G/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pszcz1DbMlYpbgJqONWV9MzbSp7LS9vosbbXdhJBh0BGZkeuQjLNCefGwFCXFi0DQDmGBAG/n8w/PdP5fQics8vJQ3nwCQXcoymVb+veM16W/Pk40fgk/Ys5XDzcK1GaBU/hzEpeXN7WaHFgK6+sdvZrBe4sjkb7R75ZBW/2oMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3F6A1682;
	Fri, 20 Mar 2026 05:16:00 -0700 (PDT)
Received: from [10.1.29.20] (e122027.cambridge.arm.com [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1344D3F7BD;
	Fri, 20 Mar 2026 05:16:03 -0700 (PDT)
Message-ID: <5bb58801-2851-4c7b-a8f0-d4b3cc2db474@arm.com>
Date: Fri, 20 Mar 2026 12:15:59 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panfrost: Add bus_ace optional clock support for
 RZ/G2L
To: Biju <biju.das.au@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
 <20260304134845.267030-4-biju.das.jz@bp.renesas.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260304134845.267030-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30016-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,collabora.com,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.601];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A87042DA06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/03/2026 13:48, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> On RZ/G2L SoCs, the GPU MMU requires a bus_ace clock to operate correctly.
> Without it, unbind/bind cycles leave the GPU non-operational, manifesting
> as an AS_ACTIVE bit stuck and a soft reset timeout falling back to hard
> reset. Add bus_ace_clock as an optional clock, wiring it into init/fini,
> and the runtime suspend/resume paths alongside the existing optional
> bus_clock.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 24 ++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 01e702a0b2f0..87dae0ed748a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -70,8 +70,23 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
>  			goto disable_clock;
>  	}
>  
> +	pfdev->bus_ace_clock = devm_clk_get_optional(pfdev->base.dev, "bus_ace");
> +	if (IS_ERR(pfdev->bus_ace_clock)) {
> +		err = PTR_ERR(pfdev->bus_ace_clock);
> +		dev_err(pfdev->base.dev, "get bus_ace_clock failed %ld\n",
> +			PTR_ERR(pfdev->bus_ace_clock));
> +		err = PTR_ERR(pfdev->bus_ace_clock);

You've assigned err twice (with the same value), and you can simplify
the dev_err() line by using err rather than the same PTR_ERR()
expression again.

With that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> +		goto disable_bus_clock;
> +	}
> +
> +	err = clk_prepare_enable(pfdev->bus_ace_clock);
> +	if (err)
> +		goto disable_bus_clock;
> +
>  	return 0;
>  
> +disable_bus_clock:
> +	clk_disable_unprepare(pfdev->bus_clock);
>  disable_clock:
>  	clk_disable_unprepare(pfdev->clock);
>  
> @@ -80,6 +95,7 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
>  
>  static void panfrost_clk_fini(struct panfrost_device *pfdev)
>  {
> +	clk_disable_unprepare(pfdev->bus_ace_clock);
>  	clk_disable_unprepare(pfdev->bus_clock);
>  	clk_disable_unprepare(pfdev->clock);
>  }
> @@ -432,6 +448,10 @@ static int panfrost_device_runtime_resume(struct device *dev)
>  		ret = clk_enable(pfdev->bus_clock);
>  		if (ret)
>  			goto err_bus_clk;
> +
> +		ret = clk_enable(pfdev->bus_ace_clock);
> +		if (ret)
> +			goto err_bus_ace_clk;
>  	}
>  
>  	panfrost_device_reset(pfdev, true);
> @@ -439,6 +459,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
>  
>  	return 0;
>  
> +err_bus_ace_clk:
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
> +		clk_disable(pfdev->bus_clock);
>  err_bus_clk:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
>  		clk_disable(pfdev->clock);
> @@ -462,6 +485,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>  	panfrost_gpu_power_off(pfdev);
>  
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
> +		clk_disable(pfdev->bus_ace_clock);
>  		clk_disable(pfdev->bus_clock);
>  		clk_disable(pfdev->clock);
>  		reset_control_assert(pfdev->rstc);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 0f3992412205..ec55c136b1b6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -136,6 +136,7 @@ struct panfrost_device {
>  	void __iomem *iomem;
>  	struct clk *clock;
>  	struct clk *bus_clock;
> +	struct clk *bus_ace_clock;
>  	struct regulator_bulk_data *regulators;
>  	struct reset_control *rstc;
>  	/* pm_domains for devices with more than one. */


