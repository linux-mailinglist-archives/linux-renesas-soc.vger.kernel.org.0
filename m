Return-Path: <linux-renesas-soc+bounces-32607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKG4IfoCBWopRgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 01:02:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF5953BB9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 01:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE6E53019064
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 23:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07223890E4;
	Wed, 13 May 2026 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jE3nXNqi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC93F411D;
	Wed, 13 May 2026 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713335; cv=none; b=pg3dzYXlFrpOCJ7LLJQowlA7RopE6TjLApzBQOv5zZB0JA/hZjbu4lGQMBFy5SfwO1sVLeD98OzSuBqbrvLbUZxNmOtIUWDIfA1UIKU7j5aNjRb3f5JJg7+SqUR5wUZDk4FtWTSo0l3GsxsmiTf2myxbKKA/IFOdo9NANvs/Xy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713335; c=relaxed/simple;
	bh=SHh2aALu1pl+Vmo9IUEZBoKhnQcX+ERSQJCsG5eFRCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/D81NZqa795A8fAI95EFu3ULfJrNE1c40ObciupY6xRyhwI9gC3inv1ZTLONztUYjYItl6nWDPdcM8jX+JKEM5+CLqb+Vh9/6i5bdj/YsF12W8sPqk3giSmHsU/JkAEM7ZmF5uL97uEENKPrzAnYat4+vQ8+odh2SzjBCLJTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jE3nXNqi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82B431254;
	Thu, 14 May 2026 01:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778713321;
	bh=SHh2aALu1pl+Vmo9IUEZBoKhnQcX+ERSQJCsG5eFRCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jE3nXNqiVNqQbeutRQwWOxeZdyD81bjETBDtL2BpX87UEdv3f1z0XUXICMHnntdbg
	 pCDmiHJnsfkpQQr4F/tcCTmTdr5Kx4RtnH1KqjLAYKnmb0B5/Xx7eDQLCtDCk/W1Tt
	 37bmPQhugTzx/HRfhzhtE1n9SzJcU4N9Q6mtWkV8=
Date: Thu, 14 May 2026 02:02:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
Message-ID: <20260513230208.GB291825@killaraus.ideasonboard.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: DFF5953BB9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32607-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Prabhakar,

Thank you for the patch.

On Tue, May 12, 2026 at 03:41:03PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Move pixel clock validation from a fixed encoder check to per-output
> constraints stored in rzg2l_du_output_routing.
> 
> Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5 MHz
> upper limit specifically for DPAD0. This approach cannot scale across the
> RZ DU family because pixel clock limits vary per SoC and per output
> interface.
> 
> Add mode_clock_min and mode_clock_max fields to rzg2l_du_output_routing
> so that clock constraints are expressed at the granularity of individual
> output interfaces rather than globally per SoC. Update
> rzg2l_du_encoder_mode_valid() to look up the routing entry for the active
> output and return MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the pixel clock
> falls outside the declared range. A value of 0 for either field means no
> bound is enforced in that direction.
> 
> Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875 MHz
> minimum and 83.5 MHz maximum. RZ/G2L and RZ/G2LC (R9A07G044) share the
> same DPAD0 pixel clock limits.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Moved clock limits from device_info to output_routing to allow
>   per-output constraints.

Given that the DU has a single output, connected to multiple encoders,
is the clock frequency limitation really a *per-output* property of the
DU ? Clock constraints coming from encoders can be expressed in the
respective bridge drivers (and the DSI encoder driver does so already).

> - Updated commit message to reflect the change in approach.
> 
> v1->v2:
> - Dropped storing info pointer in struct rzg2l_du_encoder as it's not needed.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 4 ++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 0fef33a5a089..d1bc205eb5f8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -33,6 +33,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
>  		[RZG2L_DU_OUTPUT_DPAD0] = {
>  			.possible_outputs = BIT(0),
>  			.port = 0,
> +			.mode_clock_min = 20875,
> +			.mode_clock_max = 83500,
>  		},
>  	},
>  };
> @@ -47,6 +49,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  		[RZG2L_DU_OUTPUT_DPAD0] = {
>  			.possible_outputs = BIT(0),
>  			.port = 1,
> +			.mode_clock_min = 20875,
> +			.mode_clock_max = 83500,
>  		}
>  	}
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..307ae70dd382 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -30,6 +30,8 @@ enum rzg2l_du_output {
>   * struct rzg2l_du_output_routing - Output routing specification
>   * @possible_outputs: bitmask of possible outputs
>   * @port: device tree port number corresponding to this output route
> + * @mode_clock_min: minimum pixel clock in kHz
> + * @mode_clock_max: maximum pixel clock in kHz
>   *
>   * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
>   * specify the valid SoC outputs, which CRTC can drive the output, and the type
> @@ -38,6 +40,8 @@ enum rzg2l_du_output {
>  struct rzg2l_du_output_routing {
>  	unsigned int possible_outputs;
>  	unsigned int port;
> +	int mode_clock_min;
> +	int mode_clock_max;
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 0e567b57a408..4af2ae09ff39 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
>  			    const struct drm_display_mode *mode)
>  {
>  	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
> +	struct rzg2l_du_device *rcdu = to_rzg2l_du_device(renc->base.dev);
> +	const struct rzg2l_du_output_routing *route = &rcdu->info->routes[renc->output];
>  
> -	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
> +	if (route->mode_clock_min && mode->clock < route->mode_clock_min)
> +		return MODE_CLOCK_LOW;
> +	if (route->mode_clock_max && mode->clock > route->mode_clock_max)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;

-- 
Regards,

Laurent Pinchart

