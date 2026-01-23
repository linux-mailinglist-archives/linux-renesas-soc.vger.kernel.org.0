Return-Path: <linux-renesas-soc+bounces-27361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PpfBIaSc2ntxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:23:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0677C11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 16:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BD16301C145
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B2C2BD58A;
	Fri, 23 Jan 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MEO24Nzr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6970E25B1D2;
	Fri, 23 Jan 2026 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181762; cv=none; b=kZ40PVyEw5RfIMD27xwaDX+VH4QEcMMH745W6P71Xs1xlhy0HqliDW4s4ezuXIyekf4fwkLcE2aQMKx8+6NMnFfqqgD/pGR0drqt5pUIuG7xXO4cFk2XFThnL9hFvT6qJt0ZflDBiGJZEegPk23HxficCJ5A6U2F4/h1CCcVjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181762; c=relaxed/simple;
	bh=RlWol9UsYbbYEsR5X0M1jiANdJTLLyIN5+ubpdC6tJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slInpXpFLY4neRK9rATwBsgmaLsjzvlXw2pXbAKXj96ANa2e0t4eLOjnbWS6j5xi7SMlQTENzy/rZEVEzXMHAqQD/Wr7kXcRmHJGcM+SpVGfEkheWN20flMt2z6SUY4JZO89b/+li5mL5EiWFYOAz94OAgqtIzY/xqtE/uLZTTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MEO24Nzr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DF6E414C7;
	Fri, 23 Jan 2026 16:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769181724;
	bh=RlWol9UsYbbYEsR5X0M1jiANdJTLLyIN5+ubpdC6tJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEO24Nzr+qaFUIkZbsAoz4vipNvTAxVLizfJXgAczkgiBhO7dWf8GthE/C0KkxpbX
	 lhcU2bAux+kmew5EiIjPERa6TYK39xz2Sl1cc9ma9Mch1RDVr69WtHlinPWhbDvkD6
	 KoLZLHWecutYnlqUZGCr2zH+HvIdZjYGTQtW9o9c=
Date: Fri, 23 Jan 2026 17:22:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Clean up VCLK divider calculation
Message-ID: <20260123152235.GJ215800@killaraus>
References: <20260105175250.64309-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105175250.64309-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27361-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,intel.com,gmail.com,glider.be,ideasonboard.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,lists.freedesktop.org:email,glider.be:email,intel.com:email,ffwll.ch:email]
X-Rspamd-Queue-Id: 60D0677C11
X-Rspamd-Action: no action

Hi Marek,

Thank you for the patch.

On Mon, Jan 05, 2026 at 06:52:04PM +0100, Marek Vasut wrote:
> Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
> in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
> is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
> in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
> is passed to __ffs() to calculate back the divider out of the value again.
> 
> Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
> function and call the function from both rcar_mipi_dsi_parameters_calc()
> and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
> and avoid unnecessarily storing the divider value in setup_info at all.
> 
> This rework has a slight side-effect, in that it should allow the compiler
> to better evaluate the code and avoid compiler warnings about variable
> value overflows, which can never happen.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Tomi, could you please push this to drm-misc ?

> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Use BIT_U16()
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 35 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 4ef2e3c129ed7..508977b9e8926 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -84,7 +84,6 @@ struct dsi_setup_info {
>  	unsigned long fout;
>  	u16 m;
>  	u16 n;
> -	u16 vclk_divider;
>  	const struct dsi_clk_config *clkset;
>  };
>  
> @@ -335,10 +334,24 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
>   * Hardware Setup
>   */
>  
> +static unsigned int rcar_mipi_dsi_vclk_divider(struct rcar_mipi_dsi *dsi,
> +					       struct dsi_setup_info *setup_info)
> +{
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_V3U:
> +	default:
> +		return (setup_info->clkset->vco_cntrl >> 4) & 0x3;
> +
> +	case RCAR_DSI_V4H:
> +		return (setup_info->clkset->vco_cntrl >> 3) & 0x7;
> +	}
> +}
> +
>  static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>  				   unsigned long fin_rate,
>  				   unsigned long fout_target,
> -				   struct dsi_setup_info *setup_info)
> +				   struct dsi_setup_info *setup_info,
> +				   u16 vclk_divider)
>  {
>  	unsigned int best_err = -1;
>  	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>  			if (fout < info->fout_min || fout > info->fout_max)
>  				continue;
>  
> -			fout = div64_u64(fout, setup_info->vclk_divider);
> +			fout = div64_u64(fout, vclk_divider);
>  
>  			if (fout < setup_info->clkset->min_freq ||
>  			    fout > setup_info->clkset->max_freq)
> @@ -390,7 +403,9 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	unsigned long fout_target;
>  	unsigned long fin_rate;
>  	unsigned int i;
> +	unsigned int div;
>  	unsigned int err;
> +	u16 vclk_divider;
>  
>  	/*
>  	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
> @@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  
>  	fin_rate = clk_get_rate(clk);
>  
> +	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
> +
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
>  	default:
> -		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +		vclk_divider = BIT_U16(div);
>  		break;
>  
>  	case RCAR_DSI_V4H:
> -		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +		vclk_divider = BIT_U16(div + 1);
>  		break;
>  	}
>  
> -	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
>  
>  	/* Find hsfreqrange */
>  	setup_info->hsfreq = setup_info->fout * 2;
> @@ -439,7 +456,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	dev_dbg(dsi->dev,
>  		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
>  		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
> -		setup_info->vclk_divider, setup_info->fout, fout_target,
> +		vclk_divider, setup_info->fout, fout_target,
>  		err / 100, err % 100);
>  
>  	dev_dbg(dsi->dev,
> @@ -653,11 +670,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
>  	default:
> -		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
> +		vclkset |= VCLKSET_DIV_V3U(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
>  		break;
>  
>  	case RCAR_DSI_V4H:
> -		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> +		vclkset |= VCLKSET_DIV_V4H(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
>  		break;
>  	}
>  

-- 
Regards,

Laurent Pinchart

