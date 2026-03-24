Return-Path: <linux-renesas-soc+bounces-30191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLROHETowmnnnAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 20:38:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA431BA29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 20:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DBE93005D12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 19:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A6A30595C;
	Tue, 24 Mar 2026 19:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KRekaKKZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505F2EBBB9;
	Tue, 24 Mar 2026 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380798; cv=none; b=kkxTEfts6TjpWH9ZI4Y7bTriW8FnBAD25YF1PB9SQtf4iXej/v6gdfChl7q4mbhd1ceiJc0ZhCWeCyhchQjMgt8fHjPurrfMoMn3CFaQbsU9IQwInmn1qtg0t4SVsqlCwoXW2bN+ok9/e8afmfSF+r4Dx7FC1rWnRiCu0n12T8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380798; c=relaxed/simple;
	bh=8SHW4vqyRDiHZ525hvVTra1ahe2CRERg8tA7pJuY1Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSfDicb1Li9T1pQ4aKUjhVh7rvaORfYs5zdSZVR6Onp1gkF/xYCtI6CGyhyc9s96hcTbPIXcM6v8z1uE0VZr8I3fw3M2KUsSQJMJHR6A0qBTLAxSCy5bkf/YFD+7qtfkn8g8BuQds8AVpvbNwSbNpeXmm3uBvgakvvZlXIdQ9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KRekaKKZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 81622591;
	Tue, 24 Mar 2026 20:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774380716;
	bh=8SHW4vqyRDiHZ525hvVTra1ahe2CRERg8tA7pJuY1Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRekaKKZ0NZXiT6ogz3MmxbJbJPUYJqD498up6STRhgg9quAl1HjEsPYdIHUx9RLu
	 rxv2ecV1oSut79aw92UHOyXRfKWzNThm/jcn3MKv6FKPuTiWFyTOuzRQfTm6vzZ8UX
	 6n/WPzzZLvIHnJbio9cdOUjb9uHosTUeP687GNKo=
Date: Tue, 24 Mar 2026 21:33:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: rz-du: Ensure correct suspend/resume ordering with
 VSP
Message-ID: <20260324193311.GB2461076@killaraus.ideasonboard.com>
References: <20260324180512.2277875-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324180512.2277875-1-tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30191-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C1FA431BA29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 07:05:05PM +0100, Tommaso Merciai wrote:
> The VSP serves as an interface to memory and a compositor to the DU. It
> therefore needs to be suspended after and resumed before the DU, to be
> properly stopped and restarted in a controlled fashion driven by the DU
> driver. This currently works by chance. Avoid relying on luck by
> enforcing the correct suspend/resume ordering with device links.
> 
> Based on similar work done by Laurent Pinchart for R-Car DU.

If the R-Car DU patch gets merged before this one, you could mention the
commit ID here.

> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 16 ++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h |  2 ++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> index bd486377f037..eb626c3cc421 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_vblank.h>
>  
>  #include <linux/bitops.h>
> +#include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -293,6 +294,9 @@ static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)
>  {
>  	struct rzg2l_du_vsp *vsp = res;
>  
> +	if (vsp->link)
> +		device_link_del(vsp->link);
> +
>  	put_device(vsp->vsp);
>  }
>  
> @@ -317,6 +321,18 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>  	if (ret < 0)
>  		return ret;
>  
> +	/*
> +	 * Enforce suspend/resume ordering between the DU (consumer) and the
> +	 * VSP (supplier). The DU will be suspended before and resume after the
> +	 * VSP.
> +	 */
> +	vsp->link = device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
> +	if (!vsp->link) {
> +		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
> +			dev_name(vsp->vsp));
> +		return -EINVAL;
> +	}
> +
>  	ret = vsp1_du_init(vsp->vsp);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> index 322eb80dcbaf..a22aaf0843ed 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> @@ -15,6 +15,7 @@
>  #include <linux/scatterlist.h>
>  
>  struct device;
> +struct device_link;
>  struct drm_framebuffer;
>  struct rzg2l_du_device;
>  struct rzg2l_du_format_info;
> @@ -29,6 +30,7 @@ struct rzg2l_du_vsp_plane {
>  struct rzg2l_du_vsp {
>  	unsigned int index;
>  	struct device *vsp;
> +	struct device_link *link;
>  	struct rzg2l_du_device *dev;
>  };
>  

-- 
Regards,

Laurent Pinchart

