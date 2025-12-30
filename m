Return-Path: <linux-renesas-soc+bounces-26179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2ECE96A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6934630285C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB552E7F1D;
	Tue, 30 Dec 2025 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F/0zcYr0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7212857EE;
	Tue, 30 Dec 2025 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090682; cv=none; b=TD7IiGi0xFRTQWBbnIRKi7OxDCv2jbao0zABYRh5vlu4WgrD4X87FcQ/XS1mTE2pzy1pH70IJyHYKk95wcur/lwHYe7m85nkg7mY22ubgbag9KxpkJxOHZyD8Vw5X/Fzt9SH/4vemSnGSeFEr3+Olh2Vwlf24W40A03QU/L4dXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090682; c=relaxed/simple;
	bh=2mwLNf6Lhb9Ur9sWuHvTK+C1C0smKO6rNEkjt9bfY8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o92A9EQXt+iwqEZGaXaeEw5UVt+RkK03zLtwIPYjvFoy6LvRNNoDHFORkb6rJsIU+IAz6Qv3OPacagRrUyNc8SY3wC5SByZpsTDTsFCRlGbW9A02vDYv/WcD1JbvK6WErA60ncIMa2bW4bifoZK3CfuTFefR4hoL4ANyLixtdlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F/0zcYr0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E6B7E6A8;
	Tue, 30 Dec 2025 11:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767090660;
	bh=2mwLNf6Lhb9Ur9sWuHvTK+C1C0smKO6rNEkjt9bfY8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/0zcYr0Qz7IU7PuuuyvLKa0OkXhXR9d/dqR7sdaey/D3PKlIR6Ksx3SrJS5pUAQo
	 7r6DHYdh58ZM06kImyI8Wpn5oRfyFd2dwiRSQdCFf3bQwhNEpTeewUcmMgGa2GB5es
	 sdw57s0BFoemgcInDPu6PAkizrBs2nSXAi7iCrzU=
Date: Tue, 30 Dec 2025 12:30:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: kernel test robot <lkp@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <20251230103058.GE6598@pendragon.ideasonboard.com>
References: <202512051834.bESvhDiG-lkp@intel.com>
 <84f21e62-c167-4b7f-8727-bdca04eede5e@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84f21e62-c167-4b7f-8727-bdca04eede5e@mailbox.org>

On Tue, Dec 30, 2025 at 03:47:17AM +0100, Marek Vasut wrote:
> On 12/5/25 11:16 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
> > commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> > date:   5 weeks ago
> > config: arc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/config)
> > compiler: arc-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from <command-line>:
> >     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.4':
> >>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value too large for the field
> 
> [...]
> 
> >     rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
> >        vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> >                   ^~~~~~~~~~~~~~~
> I don't think this condition can occur.
> 
> In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
> - rcar_mipi_dsi_startup() calls rcar_mipi_dsi_parameters_calc() which is 
> the only site that assigns setup_info.vclk_divider this way:
> 
>   415         switch (dsi->info->model) {
>   416         case RCAR_DSI_V3U:
>   417         default:
>   418                 setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
>   419                 break;
>   420
>   421         case RCAR_DSI_V4H:
>   422                 setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
>   423                 break;
>   424         }
> 
> In case of V3U, vclk_divider is 1 << (0..3) .
> In case of V4H, vclk_divider is 1 << (1..8) .
> 
> In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
> - rcar_mipi_dsi_startup() later contains the offending code:
> 
>   653         switch (dsi->info->model) {
>   654         case RCAR_DSI_V3U:
>   655         default:
>   656                 vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
>   657                 break;
>   658
>   659         case RCAR_DSI_V4H:
>   660                 vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>   661                 break;
>   662         }
> 
> This does the reverse of the code that assigned the value above, so:
> 
> In case of V3U, field value is (0..3) .
> In case of V4H, field value is (0..7) .
> 
> Finally in drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h :
> 
> 256 #define VCLKSET_DIV_V3U_MASK            GENMASK_U32(5, 4)
> 257 #define VCLKSET_DIV_V3U(n) 
> FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
> 258 #define VCLKSET_DIV_V4H_MASK            GENMASK_U32(6, 4)
> 259 #define VCLKSET_DIV_V4H(n) 
> FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
> 
> The masks fit exactly. For V3U the mask is 2-bit, or V4H the mask is 3-bit .
> 
> ...
> 
> I can however rewrite the code in this way, which should also mitigate 
> this warning. Do you think this makes the code any better ?

The datasheet says that the VCLKSET.DIV field "should be same as the
CLOCKSET2.vco_cntrl[5:3]". The change below makes this explicit, which
may not be a bad thing, even if it duplicates the small calculation.

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c 
> b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 4ef2e3c129ed7..20e2a4cae5b86 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -84,7 +84,6 @@ struct dsi_setup_info {
>   	unsigned long fout;
>   	u16 m;
>   	u16 n;
> -	u16 vclk_divider;
>   	const struct dsi_clk_config *clkset;
>   };
> 
> @@ -338,7 +337,8 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct 
> rcar_mipi_dsi *dsi,
>   static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>   				   unsigned long fin_rate,
>   				   unsigned long fout_target,
> -				   struct dsi_setup_info *setup_info)
> +				   struct dsi_setup_info *setup_info,
> +				   u16 vclk_divider)
>   {
>   	unsigned int best_err = -1;
>   	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> @@ -391,6 +391,7 @@ static void rcar_mipi_dsi_parameters_calc(struct 
> rcar_mipi_dsi *dsi,
>   	unsigned long fin_rate;
>   	unsigned int i;
>   	unsigned int err;
> +	u16 vclk_divider;
> 
>   	/*
>   	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
> @@ -415,15 +416,15 @@ static void rcar_mipi_dsi_parameters_calc(struct 
> rcar_mipi_dsi *dsi,
>   	switch (dsi->info->model) {
>   	case RCAR_DSI_V3U:
>   	default:
> -		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +		vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
>   		break;
> 
>   	case RCAR_DSI_V4H:
> -		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +		vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
>   		break;
>   	}
> 
> -	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
> 
>   	/* Find hsfreqrange */
>   	setup_info->hsfreq = setup_info->fout * 2;
> @@ -439,7 +440,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>   	dev_dbg(dsi->dev,
>   		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
>   		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
> -		setup_info->vclk_divider, setup_info->fout, fout_target,
> +		vclk_divider, setup_info->fout, fout_target,
>   		err / 100, err % 100);
> 
>   	dev_dbg(dsi->dev,
> @@ -653,11 +654,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>   	switch (dsi->info->model) {
>   	case RCAR_DSI_V3U:
>   	default:
> -		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
> +		vclkset |= VCLKSET_DIV_V3U((clk_cfg->vco_cntrl >> 4) & 0x3);
>   		break;
> 
>   	case RCAR_DSI_V4H:
> -		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> +		vclkset |= VCLKSET_DIV_V4H((clk_cfg->vco_cntrl >> 3) & 0x7);
>   		break;
>   	}

Laurent Pinchart

