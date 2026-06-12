Return-Path: <linux-renesas-soc+bounces-33941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KgipGWYrLGrqMgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 17:53:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73267AA17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 17:53:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Z8S8P5jC;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FC113084333
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 15:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47266390239;
	Fri, 12 Jun 2026 15:53:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7D346AD5;
	Fri, 12 Jun 2026 15:53:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279587; cv=none; b=kS+iK2EAYCWuu4g0YZRu9/Udb9RzTsQAOlnVSBUGF99rXlzTUojJ17N9oay/szMuR1DPUubKD4EtYmRGeHlVrDZ0a9FvMTERSt2jM7yGrfLRy3TXiEc4VeauGJzdkLCe3aeiusI2XgGVLkFXuU/piQoeHmSpYVi1x0AJfDcFnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279587; c=relaxed/simple;
	bh=Xi4zr6K4kn0ZEMvzzLUuNwWw60sZlDm3SVBSJ/YtuQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4WPelPC+zaiw7v56z/s44mSJKgXKj5wA+9NXwfKLOgbeDMc9y4Prgty1eoA5rsIiF7FpjrR/dKj87Ph9ACLFUH4pMDArVibO0Hl1wFVbW1J2rq5CIBNPh8ty/zTkIfPzREGqVps4ci2r4I31Q+OnUsjlEHcqqild7zja1O62+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z8S8P5jC; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7554F497;
	Fri, 12 Jun 2026 17:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781279552;
	bh=Xi4zr6K4kn0ZEMvzzLUuNwWw60sZlDm3SVBSJ/YtuQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8S8P5jCFyTJtycXMMjLt/8TwqBV+eybltV90qrojoPBmml1+uvKj11t9HxOnmrmX
	 B0MOPpBIJsPGPWeh/6ZHZB9OWAvNXvY5ERFpaziK2fsszUVeqh8fdo+0W8uJoicdOL
	 p3qRuinDJo5SSUZ6aAxCQrkyjnpPiJHBcc8erDIg=
Date: Fri, 12 Jun 2026 18:53:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Message-ID: <20260612155301.GC1982714@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-4-164157820498@ideasonboard.com>
 <20260611000324.GH1632628@killaraus.ideasonboard.com>
 <11f27d38-0224-4fce-a975-7c3f7d8d1d38@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11f27d38-0224-4fce-a975-7c3f7d8d1d38@ideasonboard.com>
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-33941-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF73267AA17

On Fri, Jun 12, 2026 at 02:56:11PM +0300, Tomi Valkeinen wrote:
> On 11/06/2026 03:03, Laurent Pinchart wrote:
> > On Fri, May 15, 2026 at 12:09:29PM +0300, Tomi Valkeinen wrote:
> >> Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
> >> provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
> >> crtc, when enabling the crtc.
> >>
> >> With DSC (added in upcoming patch) in the pipeline, between the DU and
> >> the DSI, the above call path is broken as the crtc tries to call
> >> rcar_mipi_dsi_pclk_enable() on the DSC.
> >>
> >> Adjust the rcar_mipi_dsi_pclk_enable() so that it detects the DSC, and
> >> in that case gets the next bridge from the DSC, which is the DSI.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 36 +++++++++++++++++++++++--
> >>   1 file changed, 34 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> >> index 4ef2e3c129ed..085e229bcb0b 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> >> @@ -88,6 +88,8 @@ struct dsi_setup_info {
> >>   	const struct dsi_clk_config *clkset;
> >>   };
> >>   
> >> +static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops;
> >> +
> >>   static inline struct rcar_mipi_dsi *
> >>   bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
> >>   {
> >> @@ -844,15 +846,39 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> >>   	rcar_mipi_dsi_stop_video(dsi);
> >>   }
> >>   
> >> +/*
> >> + * We need to skip the DSC bridge when we have DSC in between the DU and
> >> + * the DSI. We detect the DSI bridge via bridge->funcs, and assume the
> >> + * next_bridge is the DSI bridge. If this is not the case, the DT data
> >> + * is wrong (so it shouldn't really happen).
> >> + */
> >> +static struct drm_bridge *
> >> +rcar_mipi_dsi_resolve_bridge(struct drm_bridge *bridge)
> >> +{
> >> +	if (bridge->funcs != &rcar_mipi_dsi_bridge_ops)
> >> +		bridge = bridge->next_bridge;
> >> +
> >> +	if (!bridge || bridge->funcs != &rcar_mipi_dsi_bridge_ops)
> >> +		return NULL;
> >> +
> >> +	return bridge;
> >> +}
> > 
> > Hmmmm... It's quite a bit of a hack. It would be nicer to do this in
> > rcar_du_crtc.c instead, where we cache the dsi bridge pointer. The
> 
> It's actually cached in rcar_du_encoder.c, but used in rcar_du_crtc.c.
> 
> If I understand right, you'd like to do the DSC detection in 
> rcar_du_crtc, and skip the DSC, if needed, before calling 
> rcar_mipi_dsi_pclk_enable()?

That would be the idea, yes. Knowledge that there's a DSC in the
pipeline would be in the DU driver, not the DSI driver. I think it would
be better, as the DU driver is the one that should have an overall view
of the display pipeline.

> > question is how to then identify the right bridge, as we won't have
> > access to rcar_mipi_dsi_bridge_ops. Should this driver set the bridge
> > type field to DRM_MODE_CONNECTOR_DSI ?
> 
> I'm not sure how that would help. Or, I can, as the dsi driver does not 
> set the bridge type, so only DSC would set it. But isn't that even more 
> hacky?
> 
> Or did you rather mean that the DSI driver would set the bridge type, 
> and DSC would not? We can then do:
> 
> 		if (bridge->type != DRM_MODE_CONNECTOR_DSI)
> 			bridge = bridge->next_bridge;

Yes that's what I meant.

> in the crtc driver. This works. It's still a bit hacky, but I think the 
> chances of the code getting it wrong are quite low. If the output port 
> is RCAR_DU_OUTPUT_DSIx, then the next bridge must be rcar-dsi or 
> rcar-dsc, so it's all under our control. Also, it's less code than this 
> patch, so I'll go with that.

Thanks.

-- 
Regards,

Laurent Pinchart

