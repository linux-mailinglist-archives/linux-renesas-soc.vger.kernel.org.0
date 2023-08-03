Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E428076F640
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Aug 2023 01:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjHCXrB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 19:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjHCXrA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 19:47:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5567F211E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Aug 2023 16:46:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C8A8600;
        Fri,  4 Aug 2023 01:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691106352;
        bh=LARjasZKXZft1eWgt1tSbyHUhnPtYt7pNqPHGzxGghM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PYpxz9vJtP5aDkBKL4REcLWam5NVsJMvouKgtZRJUsKBQyM9ek0jey42AQA9hczZB
         WsMnLFx+44a7DfA4rVBPLWAlaR5eUDutNN7Jv50eRs6YoD4UqVcvHgQInyihwtxE0h
         J+l23EtECE3KbAv25bIQmtEmfXw+pdTOiqWwW+Ao=
Date:   Fri, 4 Aug 2023 02:47:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Damian Hobson-Garcia <dhobsong@igel.co.jp>
Cc:     kieran.bingham+renesas@ideasonboard.com, taki@igel.co.jp,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
Message-ID: <20230803234703.GJ9722@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230728200714.2084223-1-dhobsong@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Damian,

Thank you for the patch.

On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
> Add additional pixel formats for which blending is disabling when

Did you mean "disabled" instead of "disabling" ?

> DRM_MODE_BLEND_PIXEL_NONE is set.
> 
> Refactor the fourcc selection into a separate function to handle the
> increased number of formats.
> 
> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
>  1 file changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 45c05d0ffc70..96241c03b60f 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>  	DRM_FORMAT_Y212,
>  };
>  
> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
> +{
> +	u32 fourcc = state->format->fourcc;
> +
> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> +		switch (fourcc) {
> +		case DRM_FORMAT_ARGB1555:
> +			fourcc = DRM_FORMAT_XRGB1555;
> +			break;
> +
> +		case DRM_FORMAT_ARGB4444:
> +			fourcc = DRM_FORMAT_XRGB4444;
> +			break;
> +
> +		case DRM_FORMAT_ARGB8888:
> +			fourcc = DRM_FORMAT_XRGB8888;
> +			break;
> +
> +		case DRM_FORMAT_BGRA8888:
> +			fourcc = DRM_FORMAT_BGRX8888;
> +			break;
> +
> +		case DRM_FORMAT_RGBA1010102:
> +			fourcc = DRM_FORMAT_RGBX1010102;
> +			break;

Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
intentionally ?

> +		}
> +	}
> +
> +	return fourcc;
> +}
> +
>  static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  {
>  	struct rcar_du_vsp_plane_state *state =
> @@ -189,7 +220,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		.alpha = state->state.alpha >> 8,
>  		.zpos = state->state.zpos,
>  	};
> -	u32 fourcc = state->format->fourcc;
> +	u32 fourcc = rcar_du_vsp_state_get_format(state);
>  	unsigned int i;
>  
>  	cfg.src.left = state->state.src.x1 >> 16;
> @@ -206,22 +237,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
>  			   + fb->offsets[i];
>  
> -	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> -		switch (fourcc) {
> -		case DRM_FORMAT_ARGB1555:
> -			fourcc = DRM_FORMAT_XRGB1555;
> -			break;
> -
> -		case DRM_FORMAT_ARGB4444:
> -			fourcc = DRM_FORMAT_XRGB4444;
> -			break;
> -
> -		case DRM_FORMAT_ARGB8888:
> -			fourcc = DRM_FORMAT_XRGB8888;
> -			break;
> -		}
> -	}
> -
>  	format = rcar_du_format_info(fourcc);
>  	cfg.pixelformat = format->v4l2;
>  

-- 
Regards,

Laurent Pinchart
