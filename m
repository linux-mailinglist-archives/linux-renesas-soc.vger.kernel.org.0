Return-Path: <linux-renesas-soc+bounces-33856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uMIBBVn7KWpfggMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 02:03:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F248066D781
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 02:03:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=KkynWMvH;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61B2B300B0B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 00:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C8DC2FF;
	Thu, 11 Jun 2026 00:03:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB84C92;
	Thu, 11 Jun 2026 00:03:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781136210; cv=none; b=BCZuZOrJVu0quO4JfwMEETMgHlCnuwHBtlTnQgw8QRu7U0ZStzh00oOYQsMcsZZlWwpEBR7eUxE/shkLUPjNMmuDgsM9FhklahjpT2vPSQobRxO4USBj/tATMA5t3khcnyBcthnCvSCc/mfO25ylD10d6mNF5YfC4kgn8MM/4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781136210; c=relaxed/simple;
	bh=7Lc1rx8Jp41JTvrcWNEo7iJ/+E/l8wCtqHTTiQ1kiKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRYNZYH17EvFGU35UJxpegyoCZUIxRngDqX46oWfQwhBKruZxLhDw7aIw4ppb9qBCCrAFPJ0oWGD2Yrv3mdltFqt8ursM18SEqMrjCCoefbh2eU8Pxp8nhgy+YZCgIGk6bJ47XONpUilB0vbfN1+KiQPhJ4gR+JoXPJTj0d/+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KkynWMvH; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80DE52D9;
	Thu, 11 Jun 2026 02:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781136176;
	bh=7Lc1rx8Jp41JTvrcWNEo7iJ/+E/l8wCtqHTTiQ1kiKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkynWMvH4/GKiABKartnvdELDg8NTpkhQD92fWte+U+KU7Tlt/JUY4Yc+8KJ7k0qG
	 cBLvV61QlTfXBUChPHMJhNSVPSBT4Aqt+gdcmkMEXhhJiagpstoGWC9nBuu5t3pauW
	 01H1kUOWt0IQOTdUvUA4AEbjtX6QtanSzrHSPBvY=
Date: Thu, 11 Jun 2026 03:03:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] drm/rcar-du: dsi: Support DSC in the pipeline
Message-ID: <20260611000324.GH1632628@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-4-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v3-4-164157820498@ideasonboard.com>
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-33856-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,ideasonboard.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F248066D781

Hi Tomi,

Thank you for the patch.

On Fri, May 15, 2026 at 12:09:29PM +0300, Tomi Valkeinen wrote:
> Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
> provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
> crtc, when enabling the crtc.
> 
> With DSC (added in upcoming patch) in the pipeline, between the DU and
> the DSI, the above call path is broken as the crtc tries to call
> rcar_mipi_dsi_pclk_enable() on the DSC.
> 
> Adjust the rcar_mipi_dsi_pclk_enable() so that it detects the DSC, and
> in that case gets the next bridge from the DSC, which is the DSI.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 36 +++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 4ef2e3c129ed..085e229bcb0b 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -88,6 +88,8 @@ struct dsi_setup_info {
>  	const struct dsi_clk_config *clkset;
>  };
>  
> +static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops;
> +
>  static inline struct rcar_mipi_dsi *
>  bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
>  {
> @@ -844,15 +846,39 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
>  	rcar_mipi_dsi_stop_video(dsi);
>  }
>  
> +/*
> + * We need to skip the DSC bridge when we have DSC in between the DU and
> + * the DSI. We detect the DSI bridge via bridge->funcs, and assume the
> + * next_bridge is the DSI bridge. If this is not the case, the DT data
> + * is wrong (so it shouldn't really happen).
> + */
> +static struct drm_bridge *
> +rcar_mipi_dsi_resolve_bridge(struct drm_bridge *bridge)
> +{
> +	if (bridge->funcs != &rcar_mipi_dsi_bridge_ops)
> +		bridge = bridge->next_bridge;
> +
> +	if (!bridge || bridge->funcs != &rcar_mipi_dsi_bridge_ops)
> +		return NULL;
> +
> +	return bridge;
> +}

Hmmmm... It's quite a bit of a hack. It would be nicer to do this in
rcar_du_crtc.c instead, where we cache the dsi bridge pointer. The
question is how to then identify the right bridge, as we won't have
access to rcar_mipi_dsi_bridge_ops. Should this driver set the bridge
type field to DRM_MODE_CONNECTOR_DSI ?

> +
>  void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
>  			       struct drm_atomic_state *state)
>  {
> -	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
> +	struct rcar_mipi_dsi *dsi;
>  	struct drm_crtc *crtc;
>  	int ret;
>  
> +	bridge = rcar_mipi_dsi_resolve_bridge(bridge);
> +	if (WARN_ON(!bridge))
> +		return;
> +
> +	dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
>  	connector = drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);
>  	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> @@ -885,7 +911,13 @@ EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_enable);
>  
>  void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
>  {
> -	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +	struct rcar_mipi_dsi *dsi;
> +
> +	bridge = rcar_mipi_dsi_resolve_bridge(bridge);
> +	if (WARN_ON(!bridge))
> +		return;
> +
> +	dsi = bridge_to_rcar_mipi_dsi(bridge);
>  
>  	rcar_mipi_dsi_shutdown(dsi);
>  	rcar_mipi_dsi_clk_disable(dsi);
> 

-- 
Regards,

Laurent Pinchart

