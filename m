Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24029F2570
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 03:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732699AbfKGCbT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 21:31:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47404 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731985AbfKGCbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 21:31:19 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48B3329;
        Thu,  7 Nov 2019 03:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573093876;
        bh=FaOsKKRqnjdtla6VGKZJ8ZS4dIrIKm/aqwfxO6NMUPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zma5HXTvfEZD2d3ccsp1M/Ut7eHpZ4XYsLZCzr+LB7p0O0QSW3O48TmeQcbxOFNPg
         hYBd5kErlXe7Uvoe0W7d3ISyyYhmULWrZ4oa94h0Cvg7TaaKj6zEMAvmDOcaYUjmuZ
         YLksRHT4WkT34bpf/VR/UefkGzu2XbTvDieRHKcc=
Date:   Thu, 7 Nov 2019 04:31:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] drm: rcar-du: Recognize "renesas,vsps" in addition
 to "vsps"
Message-ID: <20191107023107.GL4878@pendragon.ideasonboard.com>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Nov 05, 2019 at 07:35:03PM +0100, Geert Uytterhoeven wrote:
> The Renesas-specific "vsps" property lacks a vendor prefix.
> Add a "renesas," prefix to comply with DT best practises.
> Retain backward compatibility with old DTBs by falling back to "vsps"
> when needed.
> 
> Fixes: 6d62ef3ac30be756 ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree (with a small change below).

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 186422ac552b2870..b14676f7a9f17501 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -544,6 +544,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
>  static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  {
>  	const struct device_node *np = rcdu->dev->of_node;
> +	const char *vsps_prop_name = "renesas,vsps";
>  	struct of_phandle_args args;
>  	struct {
>  		struct device_node *np;
> @@ -559,15 +560,21 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  	 * entry contains a pointer to the VSP DT node and a bitmask of the
>  	 * connected DU CRTCs.
>  	 */
> -	cells = of_property_count_u32_elems(np, "vsps") / rcdu->num_crtcs - 1;
> +	ret = of_property_count_u32_elems(np, vsps_prop_name);
> +	if (ret < 0) {
> +		/* Backward compatibility with old DTBs */

s/DTBs/DTBs./

> +		vsps_prop_name = "vsps";
> +		ret = of_property_count_u32_elems(np, vsps_prop_name);
> +	}
> +	cells = ret / rcdu->num_crtcs - 1;
>  	if (cells > 1)
>  		return -EINVAL;
>  
>  	for (i = 0; i < rcdu->num_crtcs; ++i) {
>  		unsigned int j;
>  
> -		ret = of_parse_phandle_with_fixed_args(np, "vsps", cells, i,
> -						       &args);
> +		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
> +						       cells, i, &args);
>  		if (ret < 0)
>  			goto error;
>  
> @@ -589,8 +596,8 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  
>  		/*
>  		 * Store the VSP pointer and pipe index in the CRTC. If the
> -		 * second cell of the 'vsps' specifier isn't present, default
> -		 * to 0 to remain compatible with older DT bindings.
> +		 * second cell of the 'renesas,vsps' specifier isn't present,
> +		 * default to 0 to remain compatible with older DT bindings.
>  		 */
>  		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
>  		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;

-- 
Regards,

Laurent Pinchart
