Return-Path: <linux-renesas-soc+bounces-25912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E03CCF443
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 11:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F533300942A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83DA1ADC97;
	Fri, 19 Dec 2025 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Eyy50hoU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24692296BD6;
	Fri, 19 Dec 2025 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138519; cv=pass; b=KVlcD4LgqL7DfWKaEajzbhmh87haWSjeEInjtFcEzexfFJUwkZ3Ki8PO0sFNSJ7a/aIOmSji8Ton7qFjx9YcOJAnrPfrbXYnPQyzdrxkHB/SA7kyhgZfppOLLXEDrGwe/UCsF9UJAeuJ4f37RA/QH0K4WO2uaZLMxATQ6utIlDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138519; c=relaxed/simple;
	bh=fT0tzLM42coyJ10Bogumd8hHZFB8bMwg+RNNXP7XdME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhNXMZL04hCwgYz8IxpGRAoeVsF6vyg4nt1YSzvAfRwjb5nNXf/Yf8FjCbjdoYJ1k22S6qCx3sgJq0WnRxxJBf3c/zz3rehnwDOazgtIhxFY3eMElqpNENuzU5WjbxG1m90VWhnDGs0W//5ZAeCO3eXLMqp+zka7Mpp+owsq2Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Eyy50hoU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1766138502; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AlVM9WqhXYWZJD1uYw2FGVXwKUWGUj2qFBziL/Pxw7zLd0BRYMb7yW9IJQVJDFoaIDANEiST7bBxKdGSdcVac9gpxYCdoF6aOl0U0hoc8sPjNVDBPKSfDdL0mUowpdQU4iCX5T7f4ZaivcU++JL0w+Pgld6PqgfC8BAB4cu+fGo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766138502; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U4pyqNvZb10Cml+duGlrsoOGzg1gV8V0VtUa+RB3c4Q=; 
	b=mK+yQyKIxYwa/CRucM1Lj9mIrvEAko2w/+gxy2CawUAZKLt+BcEhRpjRojM9/2SUBTe5OVG8qu3wcm4nX+lfAfGT3cnDO9cxmSByZj3Yxyp4sOnFviEK88oGyHvx/HvA/HZjYx4k7bqvNl53IfWgzKPQnJxvyF2ytVJlVY2HdzU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766138502;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=U4pyqNvZb10Cml+duGlrsoOGzg1gV8V0VtUa+RB3c4Q=;
	b=Eyy50hoU1A20bDikzXCU0sZ8eFb4iLDJ3t9h0GcZfx5ozsDMdBqVyuzZEk93uHxz
	hy9kYXn/cHyt9tPJHAIfjMAsKPffqbaIEUI94COZiedazPsO+77dYmgxJ0EXvDz7bC9
	8RTiHTPSd2Xx3SOUj51UnwcfWj19RRtrXZ7tYmzE=
Received: by mx.zohomail.com with SMTPS id 1766138500498463.62514872059285;
	Fri, 19 Dec 2025 02:01:40 -0800 (PST)
Date: Fri, 19 Dec 2025 10:01:35 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, 
	Steven Price <steven.price@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Message-ID: <zdeak3e65wt2jw7n6rcskyeokmyt7cxhsrvwaeqodp2yjxw7kg@vbqza5hpnrym>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>

Hi Biju,

I'll be merging your patch. It'll be my first time as a Panfrost maintainer, so bear me with me
while I become familiar with the process.

Kind Regards,
Adrian

On 19.12.2025 09:49, Biju Das wrote:
> Hi All,
>
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 03 December 2025 12:51
> > Subject: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > RZ/G3E SoC is embedded with Mali-G52 GPU system. The system hangs after STR in the following
> > condition:
> >
> > STR -> Wakeup from STR -> Unload panfrost using 'modprobe -r panfrost'.
> >
> > Fix this issue by asserting/deasserting the reset during suspend/resume.
> > Rename the variable allwinner_h616_data->default_pm_rt_data for data reuse and make it as generic GPU
> > PM runtime data.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 7d8c7c337606..e553f183c780 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -976,7 +976,7 @@ static const struct panfrost_compatible default_data = {
> >  	.pm_domain_names = NULL,
> >  };
> >
> > -static const struct panfrost_compatible allwinner_h616_data = {
> > +static const struct panfrost_compatible default_pm_rt_data = {
> >  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> >  	.supply_names = default_supplies,
> >  	.num_pm_domains = 1,
> > @@ -1056,6 +1056,7 @@ static const struct of_device_id dt_match[] = {
> >  	  .data = &amlogic_data, },
> >  	{ .compatible = "amlogic,meson-g12a-mali",
> >  	  .data = &amlogic_data, },
> > +	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data
> > +},
> >  	{ .compatible = "arm,mali-t604", .data = &default_data, },
> >  	{ .compatible = "arm,mali-t624", .data = &default_data, },
> >  	{ .compatible = "arm,mali-t628", .data = &default_data, }, @@ -1073,7 +1074,7 @@ static const
> > struct of_device_id dt_match[] = {
> >  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
> >  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> >  	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
> > -	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
> > +	{ .compatible = "allwinner,sun50i-h616-mali", .data =
> > +&default_pm_rt_data },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, dt_match);
> > --
> > 2.43.0
>
> Gentle ping.
>
> Cheers,
> Biju

