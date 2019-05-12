Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2591AC81
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 15:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfELNtC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 09:49:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfELNtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 09:49:02 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF2412B6;
        Sun, 12 May 2019 15:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557668940;
        bh=S9q3cQX9PUs99WoceG4adVTm2IYoq1o8VisSrgnbI04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=beZsSotvqBL+n9M1P7HnuGY+biyEoOXYgeX3/h9sJ073eRoyg7KEBOKGbhgtwYT5e
         vSGDjwqhw/AHFjXgnATycIRrVG2FUMsahdA+dFlXLyWhZHf4TT3p28RszcNjpXHKT3
         shJFT7S0AVG8V3kRqrVWrBFyHycP8Lm//ButjOq0=
Date:   Sun, 12 May 2019 16:48:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] drm: rcar-du: Provide for_each_group helper
Message-ID: <20190512134843.GE4960@pendragon.ideasonboard.com>
References: <20190315170110.23280-1-kieran.bingham+renesas@ideasonboard.com>
 <20190315170110.23280-5-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190315170110.23280-5-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch?

On Fri, Mar 15, 2019 at 05:01:08PM +0000, Kieran Bingham wrote:
> Refactoring of the group control code will soon require more iteration
> over the available groups. Simplify this process by introducing a group
> iteration helper.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - no change
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h |  5 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 ++--------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 1327cd0df90a..1e9dd494e8ac 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -96,6 +96,11 @@ struct rcar_du_device {
>  	unsigned int vspd1_sink;
>  };
>  
> +#define for_each_rcdu_group(__rcdu, __group, __i) \
> +	for ((__i) = 0; (__group = &(rcdu)->groups[__i]), \
> +	     (__i) < DIV_ROUND_UP((rcdu)->num_crtcs, 2); \
> +	     __i++)

s/(rcdu)/(__rcdu)/

Assigning __group in the condition part of the for statement seems
weird, even if it should work. How about writing it as

#define for_each_rcdu_group(__rcdu, __group, __i) \
	for ((__i) = 0, (__group) = &(__rcdu)->groups[0]; \
	     (__i) < DIV_ROUND_UP((__rcdu)->num_crtcs, 2); \
	     __i++, __group++)

Apart from this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static inline bool rcar_du_has(struct rcar_du_device *rcdu,
>  			       unsigned int feature)
>  {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index e4befb1937f8..ece92cff2137 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -522,9 +522,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	struct drm_device *dev = rcdu->ddev;
>  	struct drm_encoder *encoder;
> +	struct rcar_du_group *rgrp;
>  	unsigned int dpad0_sources;
>  	unsigned int num_encoders;
> -	unsigned int num_groups;
>  	unsigned int swindex;
>  	unsigned int hwindex;
>  	unsigned int i;
> @@ -565,11 +565,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  		return ret;
>  
>  	/* Initialize the groups. */
> -	num_groups = DIV_ROUND_UP(rcdu->num_crtcs, 2);
> -
> -	for (i = 0; i < num_groups; ++i) {
> -		struct rcar_du_group *rgrp = &rcdu->groups[i];
> -
> +	for_each_rcdu_group(rcdu, rgrp, i) {
>  		mutex_init(&rgrp->lock);
>  
>  		rgrp->dev = rcdu;
> @@ -606,8 +602,6 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	/* Create the CRTCs. */
>  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
> -		struct rcar_du_group *rgrp;
> -
>  		/* Skip unpopulated DU channels. */
>  		if (!(rcdu->info->channels_mask & BIT(hwindex)))
>  			continue;

-- 
Regards,

Laurent Pinchart
