Return-Path: <linux-renesas-soc+bounces-8160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA395CD71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 15:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DBD6284942
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EAD185922;
	Fri, 23 Aug 2024 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k1FN2gz9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE341865E6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418700; cv=none; b=rs/zt0WLDcmHX3JvFXTySJ3R4qbpprjd+wPcg81GlQ6PSMMug82tJ6BF5ePvA6linoEh/qo46LAzfxVbvmY0hy2hPgtr1Sh2bKoRglHKuccl7d958ffxbffScgFK97bftbVqtZd9iiGDNKXqtRg2mNw9MOTXzgISo3rarL7k3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418700; c=relaxed/simple;
	bh=rhdU1H8EvK6K/0uaXmgS/14h7xis+RW9n+bZtMJoRPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlQwdA0zOdZLEpFU0zcvIzO/HV4UEfMPMVJev7guBh+PfdPbDL0kLwjoHpbwgAI8T8uNG/KLb4XVOOberRvJDnbmoF9Oh9rGeXv6v47QvpWa1lSMLQdoxrAJgdfrrzw8sEHYvRsgFznf680wCiUmtLQiwyFmfwBiC60SNBWEupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k1FN2gz9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9096F2D5;
	Fri, 23 Aug 2024 15:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724418633;
	bh=rhdU1H8EvK6K/0uaXmgS/14h7xis+RW9n+bZtMJoRPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1FN2gz9zytFzYkENvy1xEpiiMoCgvp0b3bLLZhHhisky6cJlsQXg+WnabKB/IxmZ
	 OwJXoDtSVf/cd0ZlWgVe9EdzyApvZXiGr9MPWD4yo/vWYV1nMl3u/InqeX9XL/7M2J
	 LX2AeqaFku4rA62H//lsWli0F9CK/PKxiw51a0xc=
Date: Fri, 23 Aug 2024 16:11:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Message-ID: <20240823131135.GC26098@pendragon.ideasonboard.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240822162320.5084-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822162320.5084-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Thu, Aug 22, 2024 at 05:23:15PM +0100, Biju Das wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
> 
> It has DPI interface and supports a maximum resolution of WXGA along
> with 2 RPFs to support the blending of two picture layers and raster
> operations (ROPs).
> 
> The DU module is connected to VSPD. Add RZ/G2UL DU support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v3->v4:
>  * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
>  * Restored port variable in struct rzg2l_du_output_routing
>  * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
> v2->v3:
>  * Avoided the line break in rzg2l_du_start_stop() for rstate.
>  * Replaced port->du_output in  struct rzg2l_du_output_routing and
>    dropped using the port number to indicate the output type in
>    rzg2l_du_encoders_init().
>  * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info
> v1->v2:
>  * No change.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  8 +++++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 11 +++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 ++-
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..c4c1474d487e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,6 +28,7 @@
>  #include "rzg2l_du_vsp.h"
>  
>  #define DU_MCR0			0x00
> +#define DU_MCR0_DPI_OE		BIT(0)
>  #define DU_MCR0_DI_EN		BIT(8)
>  
>  #define DU_DITR0		0x10
> @@ -216,9 +217,14 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
>  
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> +	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> +	u32 val = DU_MCR0_DI_EN;
>  
> -	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> +	if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
> +		val |= DU_MCR0_DPI_OE;
> +
> +	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
>  }
>  
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index e5eca8691a33..bc7c381f92ac 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -25,6 +25,16 @@
>   * Device Information
>   */
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DPAD0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 0,
> +		},
> +	},
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  	.channels_mask = BIT(0),
>  	.routes = {
> @@ -40,6 +50,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  };
>  
>  static const struct of_device_id rzg2l_du_of_table[] = {
> +	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index 07b312b6f81e..b99217b4e05d 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -183,7 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
>  
>  		/* Find the output route corresponding to the port number. */
>  		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
> -			if (rcdu->info->routes[i].port == ep.port) {
> +			if (rcdu->info->routes[i].possible_outputs &&
> +			    rcdu->info->routes[i].port == ep.port) {
>  				output = i;
>  				break;
>  			}

-- 
Regards,

Laurent Pinchart

