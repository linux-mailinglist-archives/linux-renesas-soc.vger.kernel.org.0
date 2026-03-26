Return-Path: <linux-renesas-soc+bounces-30372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGK6KvlXxWkk9gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:59:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0533802F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C2AE30607D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83163391846;
	Thu, 26 Mar 2026 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cCb+31Yk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696D2367CF;
	Thu, 26 Mar 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539200; cv=pass; b=fTCuJeMHegs15vGsHlivy/XqygLjDpKKHVunenpKeN811VIVOd4jUuHwL2t4mOmkyCFRf7eCUEbNmy9Khwooe+Va3KdZdXKBQPSVgLw0pfv5tNrYwYI9xyMVABe1HHYq6fApMiLYk1n4X1xsM1kwf6Oinj7H7VqE98v/bjc7bvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539200; c=relaxed/simple;
	bh=nPTIEhop1meTtdd2LrXotUz3HMuGHlfnq4OnFOPW3Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raMhC2TXVPfQsR1iA3M1/HnhLHsxYhw23xte4dkJXo70yW2mDSAzBytLDMYz0s96fCdNEMxqQpRf+AuddpZo3mcLgU+cDCTLHN5a/FIPwIfTeIAmVPewxMDFVLIIDJmnPJeesbxennuHMFe46qkcWDA/aRU6RRkeNnt69wtZJN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=cCb+31Yk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774539184; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XHe1iN5XbrLfPUKbsOl/hD1TQFrLh1uPvI4V5GVbbLigm4FBNvjgTH9PqM/+JEa28c8lkgfiqiKVt2VBzpkZsfC6XPWLoqZ3dOAfGCo1/rK8ddwlKq9fDTFy0gCexjcCFRilrr6lXW3xyxHoV9WfZjvq6gbSVGAEgM35+mudeZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774539184; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JRNyXHVtn2PpTLiAjNMNPkrrImzdHX7B3U+BewJhPEU=; 
	b=IXYZQGCE2Jp2cvjZ62z3X6ekCwHWnn7nb93S0PSIptOdEbEkI6Mzrw3vPju9Kcs1GYKd5sx04/5tMJzQuh3EY2bYhI8t543DyUfNIyYXErvf9fXC9LIW14T1TBUxLvoZejSuTE3p7fR5IGkhMtufH23uuppBjXjnY123xL0cjJo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774539184;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=JRNyXHVtn2PpTLiAjNMNPkrrImzdHX7B3U+BewJhPEU=;
	b=cCb+31YkhLABm4GsQVdAzc+C88ErWwAkKpMMQSRyp2ulQkE09Xx41/lsNuNH13ID
	pZ/97HpGZdD0QsupyRQiuDGzGSwvOsDQCiGGAfpJW2Di+z7EM4YAJi96oQmZ22JaXTc
	KyZTTbkGSg1DBvjZBATogRnJ+imcdwiWQvDdh8wU=
Received: by mx.zohomail.com with SMTPS id 1774539182534803.1431305674896;
	Thu, 26 Mar 2026 08:33:02 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:32:57 +0000
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
Subject: Re: [PATCH v2 3/4] drm/panfrost: Add bus_ace optional clock support
 for RZ/G2L
Message-ID: <acVRoZkXyINAVHbe@sobremesa>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320164158.487406-4-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30372-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,renesas.com:email,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: B3A0533802F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 20.03.2026 16:41, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> On RZ/G2L SoCs, the GPU MMU requires a bus_ace clock to operate correctly.
> Without it, unbind/bind cycles leave the GPU non-operational, manifesting
> as an AS_ACTIVE bit stuck and a soft reset timeout falling back to hard
> reset. Add bus_ace_clock as an optional clock, wiring it into init/fini,
> and the runtime suspend/resume paths alongside the existing optional
> bus_clock.
>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped duplicate err assignment
>  * Changed the format string of dev_err to "%d" and simplify the dev_err()
>    line by using err rather than the same PTR_ERR().
>  * Collected tag
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 01e702a0b2f0..7fed22d555a5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -70,8 +70,21 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
>  			goto disable_clock;
>  	}
>
> +	pfdev->bus_ace_clock = devm_clk_get_optional(pfdev->base.dev, "bus_ace");
> +	if (IS_ERR(pfdev->bus_ace_clock)) {
> +		err = PTR_ERR(pfdev->bus_ace_clock);
> +		dev_err(pfdev->base.dev, "get bus_ace_clock failed %d\n", err);
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
> @@ -80,6 +93,7 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
>
>  static void panfrost_clk_fini(struct panfrost_device *pfdev)
>  {
> +	clk_disable_unprepare(pfdev->bus_ace_clock);
>  	clk_disable_unprepare(pfdev->bus_clock);
>  	clk_disable_unprepare(pfdev->clock);
>  }
> @@ -432,6 +446,10 @@ static int panfrost_device_runtime_resume(struct device *dev)
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
> @@ -439,6 +457,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
>
>  	return 0;
>
> +err_bus_ace_clk:
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
> +		clk_disable(pfdev->bus_clock);
>  err_bus_clk:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
>  		clk_disable(pfdev->clock);
> @@ -462,6 +483,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
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
> --
> 2.43.0


Adrian Larumbe

