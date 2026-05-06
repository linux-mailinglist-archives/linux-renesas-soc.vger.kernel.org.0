Return-Path: <linux-renesas-soc+bounces-32181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJBnMg+h+2lcegMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 22:14:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF34E015F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 22:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA4AB30071E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 20:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE7834CFD6;
	Wed,  6 May 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SigQyGfH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015863128BE;
	Wed,  6 May 2026 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778098445; cv=none; b=noIaiyUHgP+w1YrVU2R843we1YRcT65ObkoLOw6v6ttCVNtURsVh4j1Fa2Ryk1uWiLSOGLopZY0O3ADMIvWEYMRHFNxzXoy4ZzaArNvyo6Zd9HM73T9+50Tm5PCaSPGa9Auo3BOp1gRwyDHZVspRmuQEC2HbWa3nql6ShTZamE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778098445; c=relaxed/simple;
	bh=FUm8+ysvd/+e3sYNe+JNTRNIOMvaud1xD5TiGVrDrtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioNt7c4G2xBKoin2efnWwh9yqtyDDzUyzodu/zIU+1r3aQXev17TfgsOSsn0Me63z71DytQYlsO04ZjBt+yf4mMnAROPjHiRIOfO4PNUL+b9TKUZ5rhhYowsmiWjVlI57cjfgVipPurvFKoP2pIzHeTfCwdFN7pFnPxBpuVAz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SigQyGfH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76B0E63D;
	Wed,  6 May 2026 22:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778098438;
	bh=FUm8+ysvd/+e3sYNe+JNTRNIOMvaud1xD5TiGVrDrtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SigQyGfHkvWersK1lB3KPCjHnSXYHP18pPOz0Zv//uB7yyoL73oH0xtX1wjYCISE2
	 yNHuDcoXmayPjxn099yTBIbHn8brT/s9wqqFVcyijy5TE2EPGJ9yc3gkuFo+PXR9W7
	 qiQJmPXD261jSsb+5oDIs1AAW6fZQCiEsfv1ueQw=
Date: Wed, 6 May 2026 23:14:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/4] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Message-ID: <20260506201400.GC1652535@killaraus.ideasonboard.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429170012.366537-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: 23FF34E015F
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32181-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 06:00:11PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Move pixel clock validation from a fixed encoder check to per SoC
> constraints stored in rzg2l_du_device_info.
> 
> Pixel clock limits differ across SoCs in the RZ DU family and cannot be
> expressed by a single shared rule. For example, RZ/G2UL (R9A07G043U)
> limits the DPAD0 pixel clock to 83.5 MHz, while other SoCs such as
> RZ/T2H require a wider operating range.
> 
> Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to
> describe the supported pixel clock range for each SoC. Update
> rzg2l_du_encoder_mode_valid() to return MODE_CLOCK_LOW when the pixel
> clock falls below mode_clock_min and MODE_CLOCK_HIGH when it exceeds
> mode_clock_max.
> 
> Set the pixel clock limits for RZ/G2UL(R9A07G043U) to 20.875MHz minimum
> and 83.5MHz maximum.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 2 ++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h | 2 ++
>  4 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 0fef33a5a089..3b7162c6e1f4 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -35,6 +35,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
>  			.port = 0,
>  		},
>  	},
> +	.mode_clock_min = 20875,
> +	.mode_clock_max = 83500,
>  };
>  
>  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..885558eb9547 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -44,10 +44,14 @@ struct rzg2l_du_output_routing {
>   * struct rzg2l_du_device_info - DU model-specific information
>   * @channels_mask: bit mask of available DU channels
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
> + * @mode_clock_min: minimum pixel clock in kHz
> + * @mode_clock_max: maximum pixel clock in kHz
>   */
>  struct rzg2l_du_device_info {
>  	unsigned int channels_mask;
>  	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> +	u32 mode_clock_min;
> +	u32 mode_clock_max;
>  };
>  
>  #define RZG2L_DU_MAX_CRTCS		1
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index d53068733c66..ad02efec1c23 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -50,8 +50,11 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
>  			    const struct drm_display_mode *mode)
>  {
>  	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
> +	const struct rzg2l_du_device_info *info = renc->info;

You could use

	struct rzg2l_du_device *rcdu = to_rzg2l_du_device(renc->base.dev);
	const struct rzg2l_du_device_info *info = rcdu->info;

and avoid the info pointer in struct rzg2l_du_encoder. Up to you.

>  
> -	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
> +	if (info->mode_clock_min && mode->clock < info->mode_clock_min)
> +		return MODE_CLOCK_LOW;
> +	if (info->mode_clock_max && mode->clock > info->mode_clock_max)
>  		return MODE_CLOCK_HIGH;

The new check now applies to all outputs, not just the DPAD0 output. Is
that intentional ?

>  
>  	return MODE_OK;
> @@ -107,6 +110,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  	if (IS_ERR(renc))
>  		return PTR_ERR(renc);
>  
> +	renc->info = rcdu->info;
>  	renc->output = output;
>  	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> index 3e430c1f6132..39a1d178b856 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> @@ -14,10 +14,12 @@
>  #include <linux/container_of.h>
>  
>  struct rzg2l_du_device;
> +struct rzg2l_du_device_info;
>  
>  struct rzg2l_du_encoder {
>  	struct drm_encoder base;
>  	enum rzg2l_du_output output;
> +	const struct rzg2l_du_device_info *info;

If you want to keep a pointer here to avoid going through
to_rzg2l_du_device(), I would store a backpointer to rzg2l_du_device
instead of just an info pointer, it could come handy in other places.

>  };
>  
>  static inline struct rzg2l_du_encoder *to_rzg2l_encoder(struct drm_encoder *e)

-- 
Regards,

Laurent Pinchart

