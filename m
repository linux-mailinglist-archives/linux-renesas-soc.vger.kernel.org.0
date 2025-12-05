Return-Path: <linux-renesas-soc+bounces-25604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466FCA77D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 13:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6FBF3007FC8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D56A32C927;
	Fri,  5 Dec 2025 12:00:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B6304BC4;
	Fri,  5 Dec 2025 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936001; cv=none; b=J3T4yIkdr3C5F0PX+HyL1UkMeG1hk831tUFa7tOtTzGJ07zPkFKrF91DubCxbd4nVJXS+QsgT1Y+7led2wXyXhGAe4nL+2xnQwSQ2vTv3q2aAu0+FoQVLFuZ69Zig/0BbR8m3CoRdKeGC7+Rl0iXtrohsTLbZ1xR0WmPPejOPVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936001; c=relaxed/simple;
	bh=SoPFXHmzsCu7TM02inF/OruxcGGNbnkeUM2DF9JRWgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRmDEi2FUItCfuDEqK9kLxtlaFeptNBK6AE0DPiPjcVxp1DQbUg8IbKthU9gn29ku6loq/H7fWV6hOa08RDeMKce1ifSGjtCMitmyTApx3IdBdifyT7UHwcQTTcQMSxLFUYxp9s3XZrFW6BX2orV/YKZvho3ljjv1/nkibciWUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B404339;
	Fri,  5 Dec 2025 03:59:49 -0800 (PST)
Received: from [10.1.32.26] (e122027.cambridge.arm.com [10.1.32.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B753F86F;
	Fri,  5 Dec 2025 03:59:53 -0800 (PST)
Message-ID: <cf42392f-8c00-40e6-bbc6-85010626cecc@arm.com>
Date: Fri, 5 Dec 2025 11:59:51 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
To: Biju <biju.das.au@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2025 12:51, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> RZ/G3E SoC is embedded with Mali-G52 GPU system. The system hangs after
> STR in the following condition:
> 
> STR -> Wakeup from STR -> Unload panfrost using 'modprobe -r panfrost'.
> 
> Fix this issue by asserting/deasserting the reset during suspend/resume.
> Rename the variable allwinner_h616_data->default_pm_rt_data for data
> reuse and make it as generic GPU PM runtime data.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7d8c7c337606..e553f183c780 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -976,7 +976,7 @@ static const struct panfrost_compatible default_data = {
>  	.pm_domain_names = NULL,
>  };
>  
> -static const struct panfrost_compatible allwinner_h616_data = {
> +static const struct panfrost_compatible default_pm_rt_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
>  	.num_pm_domains = 1,
> @@ -1056,6 +1056,7 @@ static const struct of_device_id dt_match[] = {
>  	  .data = &amlogic_data, },
>  	{ .compatible = "amlogic,meson-g12a-mali",
>  	  .data = &amlogic_data, },
> +	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
>  	{ .compatible = "arm,mali-t604", .data = &default_data, },
>  	{ .compatible = "arm,mali-t624", .data = &default_data, },
>  	{ .compatible = "arm,mali-t628", .data = &default_data, },
> @@ -1073,7 +1074,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>  	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
> -	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
> +	{ .compatible = "allwinner,sun50i-h616-mali", .data = &default_pm_rt_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);


