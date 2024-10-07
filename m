Return-Path: <linux-renesas-soc+bounces-9545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0291993649
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E66EB20E90
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE421D7E52;
	Mon,  7 Oct 2024 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jY9AcaH/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FB1DD52D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326082; cv=none; b=HzJC9j53izkFKjc/MiA0oyCIoODP10z+DbGZSEiYX9nd87UACYmheZ0tRfuHmTR7gP/I6kLiYHGOsOY/QGT4nu636Aw5wYiis0oZ2e2GymeWD6EmsSIOHKpCTzy0ZxgwwNJVH+vgQ/s5AQkCnaWm2Ss1kbJvyyP+bhstBhV+wiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326082; c=relaxed/simple;
	bh=q5D66AwD7t/MDxnLc31Tb4jBA2nqUWIbHJSQpklINi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKzMnLi3MOFl619pJW6ZLRpToecUA+wRuhE4jxnfOyadXcgB7BTccyr/7d7jjpaNc5LqXaHhA/+9rODAnXnn0t5LKzXIxWXOc9t6K1Je/WfPpb1lqeOj2Yps7+UphjO7GzEQOkJF53+nDgFve02bGoANoLw8mQtJ6jcfIzwzQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jY9AcaH/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A362AD49;
	Mon,  7 Oct 2024 20:33:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728325983;
	bh=q5D66AwD7t/MDxnLc31Tb4jBA2nqUWIbHJSQpklINi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jY9AcaH/pV+T/arx8r0RJDeLeQX7CoF1BKXKBUHIQ0aJpznqKB2Sm24yk2YZZPEZm
	 YAyqoaqZJIHHfO0sy6UlgluOtS/cPTK9VfR4/NnahCR+sXcdxqfE7FN1yfFLYQAgT9
	 OvS/qXnzUKl0OuA1tb2KU0WGkK/hK5+yRlc0YwFk=
Date: Mon, 7 Oct 2024 21:34:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: rzg2l_du_crtc: Fix max dot clock
 for DPI
Message-ID: <20241007183433.GE14766@pendragon.ideasonboard.com>
References: <20241005153733.109607-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241005153733.109607-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Sat, Oct 05, 2024 at 04:37:31PM +0100, Biju Das wrote:
> As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
> dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
> to reject modes greater than 83.5 MHz.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Before applying the patch:
> root@smarc-rzg2ul:~# modetest -M rzg2l-du
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 37      36      none    0x00000001      0x00000001
> 
> Connectors:
> id      encoder status          name            size (mm)       modes   encoders
> 38      37      connected       HDMI-A-1        520x320         30      37
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000 flags: phsync, nvsync; type: preferred, driver
>   #1 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: driver
>   #2 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
>   #3 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
>   #4 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags: phsync, pvsync; type: driver
>   #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync, pvsync; type: driver
>   #6 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags: phsync, pvsync; type: driver
>   #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: userdef, driver
>   #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
>   #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
>   ...
> After applying the patch:
> root@smarc-rzg2ul:~# modetest -M rzg2l-du
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 37      36      none    0x00000001      0x00000001
> 
> Connectors:
> id      encoder status          name            size (mm)       modes   encoders
> 38      37      connected       HDMI-A-1        520x320         23      37
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: driver
>   #1 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
>   #2 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
>   #3 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
>   #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync, pvsync; type: driver
>   #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags: nhsync, nvsync; type: driver
>   #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
>   #7 1080x607 59.97 1080 1120 1232 1384 607 608 611 629 52210 flags: nhsync, pvsync; type:
>   #8 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: nhsync, nvsync; type: driver
>   #9 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: phsync, pvsync; type: driver
>   ...
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..650a2e40caf5 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -248,6 +248,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
>   * CRTC Functions
>   */
>  
> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
> +	struct drm_encoder *encoder;
> +
> +	/* Store the routes from the CRTC output to the DU outputs. */
> +	rstate->outputs = 0;
> +
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc_state->encoder_mask) {
> +		struct rzg2l_du_encoder *renc;
> +
> +		/* Skip the writeback encoder. */
> +		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +
> +		renc = to_rzg2l_encoder(encoder);
> +		rstate->outputs |= BIT(renc->output);
> +	}
> +
> +	return 0;
> +}

rstate->outputs is used in rzg2l_du_start_stop() but is never
initialized. It looks like adding this function is a bug fix by itself,
I'd split it to a separate patch.

> +
>  static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  					struct drm_atomic_state *state)
>  {
> @@ -295,10 +321,27 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
>  	rzg2l_du_vsp_atomic_flush(rcrtc);
>  }
>  
> +static enum drm_mode_status
> +rzg2l_du_crtc_mode_valid(struct drm_crtc *crtc,
> +			 const struct drm_display_mode *mode)
> +{
> +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> +	struct rzg2l_du_crtc_state *rstate =
> +					to_rzg2l_crtc_state(rcrtc->crtc.state);

I'm not sure that's the right state. When .move_valid() is called from
mode_valid_path(), the state you need is I believe the new state, not
the current state. The issue is that you don't have access to the new
state here.

Wouldn't it be simpler to implement the .mode_valid() function of
drm_encoder ? Then you could check renc->output, you wouldn't have to
deal with the state.

> +
> +	if ((rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0)) &&
> +	    mode->clock > 83500)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
> +	.atomic_check = rzg2l_du_crtc_atomic_check,
>  	.atomic_flush = rzg2l_du_crtc_atomic_flush,
>  	.atomic_enable = rzg2l_du_crtc_atomic_enable,
>  	.atomic_disable = rzg2l_du_crtc_atomic_disable,
> +	.mode_valid = rzg2l_du_crtc_mode_valid,
>  };
>  

-- 
Regards,

Laurent Pinchart

