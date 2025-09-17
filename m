Return-Path: <linux-renesas-soc+bounces-21986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE4B81C20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 22:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720DB1C80567
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 20:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A91E29B8FE;
	Wed, 17 Sep 2025 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="WMHKRYg0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72122749E4;
	Wed, 17 Sep 2025 20:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140923; cv=none; b=LiXbAyvVxuHuiC2Hq9WHM2RBrg1Mkq8phUn5DNpml4ejyEggpdH0hdeGz++F6l6wtztUJeJ9SNwKZN2cl8WcisRZXa4Nyt+qwAYdVquwBBKJtg3d0PpPVYMlW8PSlkpCUjtPD468Q6rUKX+ZBbz1sUy84dr26OLtl6ARGbJGz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140923; c=relaxed/simple;
	bh=YLgIo5c7X1ba02ngiw2Wg7nFaRZv7SipElj7pjPkcl4=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=rIK9vIfGvHzcenqCszwfBHvgVTewWhW/9FymGGvkCi3ELEF24YEe7mjqziSjkUcehjB+alFDQNzqiFr8bf9PrOgG5SxeHFPF0kFD0PMHDYmnHBQ2QEGOL4EpcBHc+T8oeNz261vU6JO6OiGtxcaBUN5xa5I0enY/egNEUyX1f/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=WMHKRYg0; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=ct0pfBgou708CbHldBJRGWrscquV99zrYIMUesm+MtQ=; b=WMHKRYg058Q89mtu332OfvjRmF
	Tujo76idSyzm+jdE8ZOrw49NMb5IxsDk/T+NNF3NWL6XKH3B2Pct26Mw73qukzI5OPWwgUlARExuK
	l+KKSjj65hF4uW8Ecgnngd91QLHBI4AOLvdI50OONue+CQJAhUcuQZQS32BI+KkEZJLc=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:54348 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uyylV-0001xe-36; Wed, 17 Sep 2025 16:28:33 -0400
Date: Wed, 17 Sep 2025 16:28:32 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20250917162832.02100f4bbe896c878eccca8e@hugovil.com>
In-Reply-To: <20250912142056.2123725-3-chris.brandt@renesas.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
	<20250912142056.2123725-3-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -3.3 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Fri, 12 Sep 2025 10:20:56 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> Before the MIPI DSI clock source can be configured, the target divide
> ratio needs to be known.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> ---
> v1->v2:
> - Add spaces around '/' in comments
> - Add target argument in new API
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index f87337c3cbb5..ca0de93d5a1a 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> @@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	drm_bridge_add(&dsi->bridge);
>  
> +	/*
> +	 * Report required division ratio setting for the MIPI clock dividers

Add missing dot at end of sentence.

> +	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
> +	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
> +	 *
> +	 * pllclk / 2 = vclk * DSI divider
> +	 * pllclk = vclk * DSI divider * 2
> +	 *
> +	 * hsclk = (vclk * DSI divider * 2) / 16
> +	 *
> +	 * vclk * bpp = hsclk * 8 * num_lanes
> +	 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
> +	 *   which simplifies to...
> +	 * DSI divider = bpp / num_lanes
> +	 */
> +	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes, 1);

What is this "1" value meaning? This is hard to decipher.

If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_*
macros should be added to the renesas.h header file and used here.

> +
>  	return 0;
>  }
>  
> -- 
> 2.50.1
> 
> 


-- 
Hugo Villeneuve

