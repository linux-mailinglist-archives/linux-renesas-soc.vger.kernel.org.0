Return-Path: <linux-renesas-soc+bounces-25966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01406CD39A7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Dec 2025 02:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCD923008550
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Dec 2025 01:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6421F419F;
	Sun, 21 Dec 2025 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Vg04UThH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7501E9B37;
	Sun, 21 Dec 2025 01:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766281292; cv=pass; b=VJWVWp7g5Tn2nHJb0sukzZFzHTAPh231F0wohRGwgasgJ2nd5P85IvJtabNOw0To7jo+jlExafYEYLI+hA9x1gQ2ym6VL9xwHO7pmByj7MTAIek1P0sOSvV1xJnQWkk5Hoo0F182NkQRGNMgQ4DN+nQMuHdCt5doKJCCw5V6zbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766281292; c=relaxed/simple;
	bh=MKfrx9V+G36PbDeSwqx62BSbOXpnbhzQ4Ccy362wB9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THKh73ZCJDVYQWaFoNJMhdbrsBMGM9KFjKWSKAIln1F0Zbl+msaVEfBkUbV+FeBw9XwqLZGKQFsi8pOG/m/rSdh3fbVBmZBssuM4sNRawa/OqkakJKwO8/uyzbxoTCt8L6XNb+YO3UInCG2FNevYLauYH3L5EwTDHnx+O26zbs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Vg04UThH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1766281269; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TEdOqg6tSQMoH79xyoKLuLZKZ5jThMim+cPRuJMIoPI7Yq5LPCldJGCPY9/vdGbE3Xrq6o6EK2tIZ3E/St0Vvj5OivIaDbg82TYMcwtQnHDfG0UE7YILoC26zST3G5B9iR+GRMuRH/Gh4GdkpNzE6HawURZpVoGly+LZlMu7Ao8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766281269; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VEfJqgjlsfWkVlJ0bggK3IdexNGZVPJR2uryoKYi8W0=; 
	b=n6QRP7CQHCO8vhhjHJZaF2fsDMfjxBACvUIPjEuXt8ejtS/f39ZJtS86YE/pdmKUHR806kENJAv3C4FoKkO1LnRHLlgwzlgHwAcUQEStpOL5ecl2+SvCaspXuHMzoBScyHWZxH0zpBonkRyhwx09aUCfaS7XvoMQ3KMbiOJg6J4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766281269;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=VEfJqgjlsfWkVlJ0bggK3IdexNGZVPJR2uryoKYi8W0=;
	b=Vg04UThHjuat6bJDTPplWeYo3am+jML0tgIixPRCEPgp8k5M7mfVKG5n2rT3bWH7
	2DuZGAcVUVRaDN63SXGR64wY+DS3DeLsl7TJ02Gz4MnrHAM4Hs6Njh8qRVehQw6fXR9
	tGVw6dZOnR3UISCrxyxCJ0anzUD4fMKwgE0VGTKQ=
Received: by mx.zohomail.com with SMTPS id 1766281268614454.4595233985998;
	Sat, 20 Dec 2025 17:41:08 -0800 (PST)
Date: Sun, 21 Dec 2025 01:41:01 +0000
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
Message-ID: <7j5tokzlfv3sjmauuz6pwks5h7wys4j64spb2pdd7zph27cuan@v2q6tmehz6d7>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>

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

Queued to drm-misc-next.

