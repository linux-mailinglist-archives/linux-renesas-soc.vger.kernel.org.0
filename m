Return-Path: <linux-renesas-soc+bounces-27475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKQREh2heGlQrgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 12:27:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C172A9394B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 12:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED79301AB8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB20346ACF;
	Tue, 27 Jan 2026 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PlyEHG9r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A2346AD8;
	Tue, 27 Jan 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513228; cv=none; b=noTRygUuRESS7MDMdVLHmSsJ2dh2xsqFC/QjRulFqHWTgyKHAyq05lwQFoZjyLODqfbXBz0YsV+TnH/57R1PUFiZtZkQPa4YQcwkjYGTCSUKcazps6Xs3Wc7vShWLdM7Zk9C96+UdNECH1ynVSp0NAs5HyqMD+7nsqQFbhXLH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513228; c=relaxed/simple;
	bh=kuLGigl0KaQst6MaNFjSUsHlWJSbxP8rpPDrtkscPrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXp8fQx293/DF0aR1gdc1P/uHe7DkohsMOTd9aQyAp5IUxtCS4B4NzH+gMWeqkzQn1L9/LksFQa+Uv8V0o15LK1+5tfjnF76rVwRIjmeMLsKEM9C/3skE0VeN6S1aNacFvJIyXz8iQvpC+GlGQiEmQyvc//ItG8CZp6scDxjKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PlyEHG9r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A82B78E;
	Tue, 27 Jan 2026 12:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769513181;
	bh=kuLGigl0KaQst6MaNFjSUsHlWJSbxP8rpPDrtkscPrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PlyEHG9rsuyx0qcl7sZz6CLG68lNaYw1Tubw3wXO4EJSigVG8QPvzfGeLDW4NOnwb
	 ASAhaVsBgo5cFEGbsUFefwSruuSv3c56LhQ8cqzM9mEyEZJl62KmfilXb8utz7DkGv
	 7kldByBJeE80g++VqcqSeyAje2/+jv8GMDYmf6oQ=
Message-ID: <c5760f24-56db-4475-b363-5b0d3330bcd6@ideasonboard.com>
Date: Tue, 27 Jan 2026 13:26:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Clean up VCLK divider calculation
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260105175250.64309-1-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260105175250.64309-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27475-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,glider.be,ideasonboard.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,suse.de:email,mailbox.org:email,ffwll.ch:email,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: C172A9394B
X-Rspamd-Action: no action

Hi,

On 05/01/2026 19:52, Marek Vasut wrote:
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
> ---

Thanks, pushed to drm-misc-next.

 Tomi

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


