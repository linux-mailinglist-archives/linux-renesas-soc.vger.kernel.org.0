Return-Path: <linux-renesas-soc+bounces-11148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85B9EAFA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 12:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9541D188CE10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CB422333F;
	Tue, 10 Dec 2024 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jonzwLt1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3222FE0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733829208; cv=none; b=pBFzzAP8KdE5RKOrHXzaYLme7+QuNk9Uh1nVA3H3tM1205o4d9yCdwfVORCaHhjv+J6aeTEqAu8CCG59+zofEClI2ZNYEGBYbMh/wwiF3XECI4HFitQtullXw3RNM9vo2v/1svGy/tYvqzqllshsbIV9IXKcdkNvMVGeMVfInxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733829208; c=relaxed/simple;
	bh=hPCDCY/RZqYfTWHTMRDlMEBiTSaxa6rs2fmrcjOAJ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6AfFevEt83bHkXLsHBTRbP+FQVG8jdRGctSEqt7Mmh8Etz/E0VkNycNo9/pin6ZeLHML5R2fLd9bcdWoCjYUzAWa59+k002eg7X47pRUKmnmLNlPsNrIA+UWvJFk/cLB6UBClDlBwAk8NWh3edKNmTzk+mjsK8iagcq/1qh2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jonzwLt1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58AAC496;
	Tue, 10 Dec 2024 12:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733829172;
	bh=hPCDCY/RZqYfTWHTMRDlMEBiTSaxa6rs2fmrcjOAJ2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jonzwLt15KHBuq7llkTJp03dz5Ggl6/dv8+qz8tOKrzMCIh0LgIg9ilRohG23E6C5
	 hCpEWZMjK0M170IIDjYLXTI0wSHMPrtkZR2XRorb0qZ/VrGH2wXiZczHsL+gSHqldU
	 3XJSakEyfTCrcJaGZhzyD2pRK8fhD12GbJFdeE1I=
Date: Tue, 10 Dec 2024 13:13:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max
 dot clock for DPI
Message-ID: <20241210111308.GF573@pendragon.ideasonboard.com>
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
 <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022082433.32513-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Oct 22, 2024 at 09:24:24AM +0100, Biju Das wrote:
> As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
> dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
> to reject modes greater than 83.5 MHz.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes in v2:
>  * Moved .mode_valid from crtc to encoder as the new state is not
>    available in crtc and instead, we could check renc->output for
>    .mode_valid() function of drm_encoder.
>  * Dropped rzg2l_du_crtc_atomic_check().
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 339cbaaea0b5..564ab4cb3d37 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/of.h>
>  
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
> @@ -24,6 +25,22 @@
>  static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
>  };
>  
> +static enum drm_mode_status
> +rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
> +
> +	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_funcs = {
> +	.mode_valid = rzg2l_du_encoder_mode_valid,
> +};
> +
>  int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  			  enum rzg2l_du_output output,
>  			  struct device_node *enc_node)
> @@ -48,6 +65,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  		return PTR_ERR(renc);
>  
>  	renc->output = output;
> +	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
>  
>  	/* Attach the bridge to the encoder. */
>  	ret = drm_bridge_attach(&renc->base, bridge, NULL,

-- 
Regards,

Laurent Pinchart

