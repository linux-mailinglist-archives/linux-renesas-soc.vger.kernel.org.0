Return-Path: <linux-renesas-soc+bounces-31090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NKlIzuv12kORggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:52:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC863CB993
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CE873179F5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 13:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717A92C0323;
	Thu,  9 Apr 2026 13:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R/qN/4aq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9482C0303;
	Thu,  9 Apr 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740982; cv=none; b=WEZbmSmLyaDzRv8iWE5CTtFQf2YM9VncZ87ECbodecvCH3E40z3eCTmSPqcryN1tuD3LoBI+cpm2LpKIpRisP8EnQZorcwWd5oPIOciXVtnNoz21UIciCH/T96m2gnEgMuARVbdi7BVpMUiaR5hKZyIR7sYTBC9vb/mnPWfaJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740982; c=relaxed/simple;
	bh=2CaA/7gm/e0paPyu7TrFnn8tpuaqK/LzLGHY75YQfCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC2uw9omzganb6HTzXBcVJbM9rYh0dVJIUi33BhB6A7shd3rp+M2oK/tobR3OsNPuOSeE9+c7jJAz2FqzmCXqWxIEIM0IlvMZm5yQ8g1geS9Sfw1h4jupNXqSVZ3+49zoqp60lmnwR36vpJ07i/1jk379yUGurN5scjyIRqnblA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R/qN/4aq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B664D1123;
	Thu,  9 Apr 2026 15:21:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775740881;
	bh=2CaA/7gm/e0paPyu7TrFnn8tpuaqK/LzLGHY75YQfCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/qN/4aqy3xoyMwCWkUG6Gvwsdu2sRf7woqPcZALczW1507DhxIzqpZsBFtqKImau
	 MprauA00vQaZ9quZ48/hlXzYWcDf7P/NNbFch6dz73l3/pbjfvGNhKPHNFe5EaN0s4
	 XskDRiV71RLd3KYGvvHZeV65pQKQnfzmxw3/ficM=
Date: Thu, 9 Apr 2026 16:22:49 +0300
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
Subject: Re: [PATCH v6 13/21] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Message-ID: <20260409132249.GC2634584@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <9e0f64dd5e1efb0d27219416121c91a19da96ebd.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408123102.GA1960713@killaraus.ideasonboard.com>
 <b8ded729-5c22-4a47-bfb7-8bffeed76e98@bp.renesas.com>
 <20260408141719.GB1965119@killaraus.ideasonboard.com>
 <136a9922-48ae-48e2-8cb1-14559206e7af@bp.renesas.com>
 <20260408150807.GD1965119@killaraus.ideasonboard.com>
 <81165cf9-b1cc-4e75-b586-0e1ef7675b9d@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81165cf9-b1cc-4e75-b586-0e1ef7675b9d@bp.renesas.com>
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31090-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[ideasonboard.com:s=mail];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.053];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,0.0.0.1:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: EEC863CB993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:14:51PM +0200, Tommaso Merciai wrote:
> On 4/8/26 17:08, Laurent Pinchart wrote:
> > On Wed, Apr 08, 2026 at 04:58:01PM +0200, Tommaso Merciai wrote:
> >> On 4/8/26 16:17, Laurent Pinchart wrote:
> >>> On Wed, Apr 08, 2026 at 04:12:22PM +0200, Tommaso Merciai wrote:
> >>>> On 4/8/26 14:31, Laurent Pinchart wrote:
> >>>>> On Wed, Apr 08, 2026 at 12:36:58PM +0200, Tommaso Merciai wrote:
> >>>>>> The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
> >>>>>> based on the DU instance actually connected using the GPO0R register.
> >>>>>>
> >>>>>> Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
> >>>>>> the code accordingly to manage the vclk selection with the introduction
> >>>>>> of `rzg2l_mipi_dsi_get_input_port()`.
> >>>>>>
> >>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >>>>>> ---
> >>>>>> v5->v6:
> >>>>>>     - Moved rzg2l_mipi_dsi_link_write() into rzv2h_mipi_dsi_dphy_init()
> >>>>>>       + comments from HW Manual.
> >>>>>>
> >>>>>> v4->v5:
> >>>>>>     - No changes.
> >>>>>>
> >>>>>> v3->v4:
> >>>>>>     - No changes.
> >>>>>>
> >>>>>> v2->v3:
> >>>>>>     - No changes.
> >>>>>>
> >>>>>> v1->v2:
> >>>>>>     - No changes.
> >>>>>>
> >>>>>>     .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 71 +++++++++++++++++--
> >>>>>>     .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
> >>>>>>     2 files changed, 68 insertions(+), 6 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>>>>> index be6dbf19a24e..947c8e15fc4b 100644
> >>>>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>>>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>>>>> @@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
> >>>>>>     
> >>>>>>     #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
> >>>>>>     
> >>>>>> +#define RZ_MIPI_DSI_MAX_INPUT	2
> >>>>>>     #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
> >>>>>> +#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
> >>>>>>     
> >>>>>>     struct rzg2l_mipi_dsi;
> >>>>>>     
> >>>>>> @@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
> >>>>>>     	struct drm_bridge bridge;
> >>>>>>     	struct drm_bridge *next_bridge;
> >>>>>>     
> >>>>>> -	struct clk *vclk;
> >>>>>> +	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
> >>>>>>     	struct clk *lpclk;
> >>>>>>     
> >>>>>>     	enum mipi_dsi_pixel_format format;
> >>>>>>     	unsigned int num_data_lanes;
> >>>>>>     	unsigned int lanes;
> >>>>>>     	unsigned long mode_flags;
> >>>>>> +	u8 vclk_idx;
> >>>>>>     
> >>>>>>     	struct rzv2h_dsi_mode_calc mode_calc;
> >>>>>>     
> >>>>>> @@ -543,8 +546,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
> >>>>>>     	unsigned long vclk_rate;
> >>>>>>     	unsigned int bpp;
> >>>>>>     
> >>>>>> -	clk_set_rate(dsi->vclk, mode_freq * KILO);
> >>>>>> -	vclk_rate = clk_get_rate(dsi->vclk);
> >>>>>> +	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
> >>>>>> +	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
> >>>>>>     	if (vclk_rate != mode_freq * KILO)
> >>>>>>     		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
> >>>>>>     			mode_freq * KILO, vclk_rate);
> >>>>>> @@ -687,6 +690,19 @@ static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> >>>>>>     	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
> >>>>>>     				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
> >>>>>>     
> >>>>>> +	/*
> >>>>>> +	 * From RZ/G3E HW manual (Rev.1.15) section 9.5.3 Operation,
> >>>>>> +	 * 9.5.3.1 Power on Reset and Initial Settings for All Operations.
> >>>>>> +	 * Figure 9.5-4 Power On/Off Sequence show that after writing to
> >>>>>> +	 * GPO0R.VICH register we need to wait for more than 1 x tp before
> >>>>>> +	 * writing to PLLENR.PLLEN.
> >>>>>> +	 *
> >>>>>> +	 * Note: GPO0R is a link register, not a PHY register. This setting
> >>>>>> +	 * is specific to RZ/G3E.
> >>>>>> +	 */
> >>>>>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
> >>>>>> +		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
> >>>>>> +
> >>>>>>     	/*
> >>>>>>     	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
> >>>>>>     	 * (C) After write to D-PHY registers we need to wait for more than 1 x tp
> >>>>>> @@ -1005,6 +1021,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
> >>>>>>     	return ret;
> >>>>>>     }
> >>>>>>     
> >>>>>> +static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
> >>>>>> +{
> >>>>>> +	struct device_node *np = dsi->dev->of_node;
> >>>>>> +	struct device_node *remote_ep, *ep_node;
> >>>>>> +	struct of_endpoint ep;
> >>>>>> +	bool ep_enabled;
> >>>>>> +	int in_port;
> >>>>>> +
> >>>>>> +	/* DSI can have only one port enabled */
> >>>>>
> >>>>> Why is that ? The hardware supports dynamic input selection, why can't
> >>>>> it be supported at runtime ?
> >>>>
> >>>> For runtime/dynamic you mean using DT overlay??
> >>>> like, remove:
> >>>>
> >>>> Removing - DU0 --> DSI (input 0 | port@0 ) overlay and
> >>>> install  - DU1 --> DSI (input 1 | port@1 ) overlay and
> >>>> viceversa?
> >>>
> >>> No, I mean configurable by userspace, with two CRTCs sharing one DSI
> >>> encoder.
> >>
> >> Sorry, question:
> >>    - Is it possible to create CRTC from user space?
> > 
> > No, the CRTCs are created by the driver, but you can have one DRM device
> > that covers two LCDCs, with one CRTC each, both connected to the same
> > DSI encoder (and apparently this applies to the LVDS encoder too).
> > Userspace then selects which CRTC drives which connector.
> 
> Which user space tool would you suggest I use for testing this?

I usually use kmstest, part of https://github.com/tomba/kmsxx/. The
modetest application from libdrm should work fine too. This is standard
KMS API.

> And also, which user space tool is the user supposed to use at
> runtime on his final/production system to perform that selection?

Any compositor should support this. Multiple CRTCs with configurable
routing towards connectors is very standard.

> >>   From hardware point only one DSI input is selectable out of 2 LCDC's at
> >> a time.
> >>
> >> References:
> >>    - 9.5.2.2.3 9.5 MIPI DSI Interface (DSI)
> >>      General Purpose Output 0 Register (DSI_LINK_GPO0R)
> >>
> >>    - 9.5 MIPI DSI Interface (DSI)
> >>      9.5.1.2 Block Diagram
> >>      Figure 9.5-1 Video Input Interface
> >>
> >>>>>> +	for_each_endpoint_of_node(np, ep_node) {
> >>>>>> +		of_graph_parse_endpoint(ep_node, &ep);
> >>>>>> +		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
> >>>>>> +			break;
> >>>>>> +
> >>>>>> +		remote_ep = of_graph_get_remote_endpoint(ep_node);
> >>>>>> +		ep_enabled = of_device_is_available(remote_ep);
> >>>>>> +		of_node_put(remote_ep);
> >>>>>> +
> >>>>>> +		if (ep_enabled) {
> >>>>>> +			in_port = ep.port;
> >>>>>> +			break;
> >>>>>> +		}
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	if (!ep_enabled)
> >>>>>> +		return -EINVAL;
> >>>>>> +
> >>>>>> +	dev_dbg(dsi->dev, "input port@%d\n", in_port);
> >>>>>> +	return in_port;
> >>>>>> +}
> >>>>>> +
> >>>>>>     /* -----------------------------------------------------------------------------
> >>>>>>      * Bridge
> >>>>>>      */
> >>>>>> @@ -1425,9 +1472,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
> >>>>>>     	if (IS_ERR(dsi->mmio))
> >>>>>>     		return PTR_ERR(dsi->mmio);
> >>>>>>     
> >>>>>> -	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
> >>>>>> -	if (IS_ERR(dsi->vclk))
> >>>>>> -		return PTR_ERR(dsi->vclk);
> >>>>>> +	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
> >>>>>> +		if (IS_ERR(dsi->vclk[0]))
> >>>>>> +			return PTR_ERR(dsi->vclk[0]);
> >>>>>> +
> >>>>>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
> >>>>>> +		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
> >>>>>> +		if (IS_ERR(dsi->vclk[1]))
> >>>>>> +			return PTR_ERR(dsi->vclk[1]);
> >>>>>> +
> >>>>>> +		ret = rzg2l_mipi_dsi_get_input_port(dsi);
> >>>>>> +		if (ret < 0)
> >>>>>> +			return dev_err_probe(dsi->dev, -EINVAL,
> >>>>>> +					     "No available input port\n");
> >>>>>> +		dsi->vclk_idx = ret;
> >>>>>> +	}
> >>>>>>     
> >>>>>>     	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
> >>>>>>     	if (IS_ERR(dsi->lpclk))
> >>>>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> >>>>>> index 2bef20566648..cee2e0bc5dc5 100644
> >>>>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> >>>>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> >>>>>> @@ -83,6 +83,9 @@
> >>>>>>     #define LINKSR_SQCHRUN1			BIT(4)
> >>>>>>     #define LINKSR_SQCHRUN0			BIT(0)
> >>>>>>     
> >>>>>> +/* RZ/G3E General Purpose Output 0 Register */
> >>>>>> +#define GPO0R				0xc0
> >>>>>> +
> >>>>>>     /* Tx Set Register */
> >>>>>>     #define TXSETR				0x100
> >>>>>>     #define TXSETR_NUMLANECAP		(0x3 << 16)

-- 
Regards,

Laurent Pinchart

