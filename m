Return-Path: <linux-renesas-soc+bounces-31006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJuIGaxO1mm8DQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:48:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CD3BC607
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A6C5306963F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 12:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BDB270EC3;
	Wed,  8 Apr 2026 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DXldEooM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383162367B5;
	Wed,  8 Apr 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651425; cv=none; b=s0i6XQzwASdW8n5Ha4KO805vV3okMl3IXtFnRMqGtJUFje5Kw3WDB/spWAoJSZsJXiA7QLqkaz+fjNuznUAiOztPHPSKCHfkdThyFCsRMhRfazenCcb4ILZjTrqT9M2pkWDUdFnumYIisQAzHsVLViIlSjfYlkLSFhJ+5R9rlMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651425; c=relaxed/simple;
	bh=6uvb7OUW6i42Bvg/O8m3aUhDrz+n+1WHF5KKTmrILBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/fZ+dr/vqH3oGgE3kUxnBAJ02qh1ruItC15+wPe3egF9f8v1SuTeqGVfu9jdACewtPA2DVvcevhr1q7i0bi+hUjYkrqq6gq4/2Nv90/5Pr/BNeyvw8ebX2R/HkPksqJYFFr1vo/tdq+gkuVQgAHgkzz+KCT1/t05y5eZRJ+YgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DXldEooM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02C661121;
	Wed,  8 Apr 2026 14:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775651333;
	bh=6uvb7OUW6i42Bvg/O8m3aUhDrz+n+1WHF5KKTmrILBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXldEooMD5SHalyxaZbLCO2mCPKkEKogesOSM8YCD9KJRf2PP3n8jjQC4Akvg5egW
	 RrcKM+LStPziVfXIz4osGfphioQmP/Be1I4sl6NU7mCQWziwAf/AWtoLD6bw4PcBp8
	 ZGxVNHfsxmxYJsUUwCYmeBVDoKbnUE4mjbOSqtB4=
Date: Wed, 8 Apr 2026 15:30:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 12/21] drm: renesas: rz-du: mipi_dsi: Add out_port to
 OF data
Message-ID: <20260408123019.GI1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <d4d1d75183944f17d392256d9123523a6bd1a3c0.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4d1d75183944f17d392256d9123523a6bd1a3c0.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31006-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.2:email,renesas.com:email]
X-Rspamd-Queue-Id: 6B6CD3BC607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 12:36:57PM +0200, Tommaso Merciai wrote:
> Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
> the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
> output, while RZ/G3E uses port 2.
> 
> Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
> use this `out_port` from the OF data, facilitating future support for
> RZ/G3E SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Another option would be to add the second input port for G3E as port@2,
keeping port@1 as the output port on all SoCs. Both options work.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - No changes.
> 
> v3->v4:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - No changes.
> 
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 715872130780..be6dbf19a24e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u32 link_reg_offset;
>  	unsigned long min_dclk;
>  	unsigned long max_dclk;
> +	u8 out_port;
>  	u8 features;
>  };
>  
> @@ -1158,7 +1159,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->mode_flags = device->mode_flags;
>  
>  	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
> -						  1, 0);
> +						  dsi->info->out_port, 0);
>  	if (IS_ERR(dsi->next_bridge)) {
>  		ret = PTR_ERR(dsi->next_bridge);
>  		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
> @@ -1411,7 +1412,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  
>  	dsi->info = of_device_get_match_data(&pdev->dev);
>  
> -	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
> +	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
> +					     dsi->info->out_port,
> +					     0, 1, 4);
>  	if (ret < 0)
>  		return dev_err_probe(dsi->dev, ret,
>  				     "missing or invalid data-lanes property\n");
> @@ -1525,6 +1528,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
>  	.link_reg_offset = 0,
>  	.min_dclk = 5440,
>  	.max_dclk = 187500,
> +	.out_port = 1,
>  	.features = RZ_MIPI_DSI_FEATURE_16BPP,
>  };
>  
> @@ -1535,6 +1539,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
>  	.link_reg_offset = 0x10000,
>  	.min_dclk = 5803,
>  	.max_dclk = 148500,
> +	.out_port = 1,
>  };
>  
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {

-- 
Regards,

Laurent Pinchart

