Return-Path: <linux-renesas-soc+bounces-25965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF44CD395B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Dec 2025 02:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37FA3300BBB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Dec 2025 01:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26AF145FE0;
	Sun, 21 Dec 2025 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Myhlk4n9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262721373;
	Sun, 21 Dec 2025 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766279262; cv=pass; b=MqBosCrW2SQq+JoSsbVyhFMOVvM689G7aqazIm0kO3n0wYWyAaK9KPnFkrgmkGqW2c7Ms4z64RmvZY0QBpza4GrpqQNzD/+JUtUnXCKdrnLCa4vPvc+1gdLffH4qjrV05QvgyENnpv8z0zrj6q4iQVOcYfbNIKbn2OYtMk1YnTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766279262; c=relaxed/simple;
	bh=KxmrEXFJjx9+tlOH1vBJkYXI+0Zx0cTuHm9pI4iF7zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaFyyis8gD00rOt9lPTLOepu2JCI1Ipdc8r65taj6woGecZYmL1ibMQY7J6brka0qdWxyWUulPnX41zrKaf5ro2t9FK08J7DALDIwrXz9B2rYnTkq2JYMhj65exL/9ovRvycnV9SojENgOT5Aj9coPi+0bBow7K4rLn8a7to6iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Myhlk4n9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1766279245; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QZnLQNGdVyoQJ+L4KY8WbAt+JSLVFQaT23vFJi1sHeUKPP1ijm14JysmRvbcobsgEdMECndtQrRWcl2YFLLQDjmF/EnIm8u1VPYEZ2Sy/XH7LPabYHgglkdwXqLtrvzi6J412QKrTqhEISeqFyptj2aPdWx7A0MlbGtlr1zEbXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766279245; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=A9fJqfpYI2qxigAQq59smi7UaMgRgfQCz1t0OlIcykg=; 
	b=eNxh5LX9zEI6w+ntBA2h5y9IptzzsQxC4y3WdbvROVO3irWEdjZi0x1Q9jGfvy22PqBDswbPcH0LsQsz6iakoBFkGdAsaHi5t2BLoZWg6Mycd9oLurIQmXjRvS06kGP1acSdoTZKpiyehYRzJdWjaM2WNzsa4JDcP0m93AW49AM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766279245;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=A9fJqfpYI2qxigAQq59smi7UaMgRgfQCz1t0OlIcykg=;
	b=Myhlk4n9tb7M3+vdSHvVonu6HpXdPnKR/g3uop218rf5Errs7GtBEp1utt7QFAcp
	Yb6W73xiQ1m8x3H+QV8c8j3LUVDaSmK+OD39BbU8KOJeg83k99UoskfPh/bPz4gbtyA
	ffH8gfP7fvnefGGKGh70aclD0TpBT34iA/6ijf2Y=
Received: by mx.zohomail.com with SMTPS id 1766279244031661.7082314337193;
	Sat, 20 Dec 2025 17:07:24 -0800 (PST)
Date: Sun, 21 Dec 2025 01:07:19 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju <biju.das.au@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Message-ID: <kwtddnnpi3s3uvq5f7u2nevyiagr7fyqz5yohcbz6vs3uldccw@5gxjmkvwzyrj>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 03.12.2025 12:51, Biju wrote:
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
> --
> 2.43.0

Adrian Larumbe

