Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE345028D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 13:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352653AbiDOLWk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 07:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351996AbiDOLWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 07:22:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C134B8879F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Apr 2022 04:20:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-129-nat.elisa-mobile.fi [85.76.5.129])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE011482;
        Fri, 15 Apr 2022 13:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650021608;
        bh=lzZqBsd39R8/2knaCdVzkz5aZRxffo3aGLAgHjCtMKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ROKE4Io/ISY192EkqppDzhnTv4eaBgLhdDzYrX3LBMExU9ADR9tYNr3TQ0CicWJD4
         VjbXIqD8HHaxSa/bqVi1LFFxCKXLemT96n3xMiWukz4/xRDFm8td/4+O3sEp6aEaUI
         m+24DDfhEh03cs2SuNWWFl6L1XWsUp516/1yi3fE=
Date:   Fri, 15 Apr 2022 14:20:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 3/7] drm: rcar-du: Add max_width and max_height to
 struct rcar_du_device_info
Message-ID: <YllU5CReP7Y6iRVE@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Mar 16, 2022 at 01:10:56PM +0000, Biju Das wrote:
> There are some differences related to max frame size supported by different
> R-Car/RZ-G family of SoC's
> 
> Max frame size supported by R-Car Gen1 & R-Car Gen2 is 4095x2047
> Max frame size supported by R-Car Gen3 is 8190x8190
> Max frame size supported by RZ/G2L is 1920x1080
> 
> Add max_width and max_height to struct rcar_du_device_info to support later
> SoC without any code changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No Change
> RFC->V1:
>  * No Change
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-13-biju.das.jz@bp.renesas.com/
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 36 +++++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h |  4 +++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 +++++--------
>  3 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 1bc7325aa356..4640c356a532 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -56,6 +56,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
> @@ -79,6 +81,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
>  		},
>  	},
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
> @@ -107,6 +111,8 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
>  		},
>  	},
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
> @@ -137,6 +143,8 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -168,6 +176,8 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -196,6 +206,8 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
>  	},
>  	.num_lvds = 2,
>  	.num_rpf = 4,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> @@ -227,6 +239,8 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -249,6 +263,8 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>  			.port = 1,
>  		},
>  	},
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7790_info = {
> @@ -280,6 +296,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>  	},
>  	.num_lvds = 2,
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
> @@ -306,6 +324,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7792_info = {
> @@ -327,6 +347,8 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
>  		},
>  	},
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7794_info = {
> @@ -351,6 +373,8 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
>  		},
>  	},
>  	.num_rpf = 4,
> +	.max_width = 4095,
> +	.max_height = 2047,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7795_info = {
> @@ -385,6 +409,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dpll_mask =  BIT(2) | BIT(1),
>  };
>  
> @@ -416,6 +442,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -447,6 +475,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dpll_mask =  BIT(1),
>  };
>  
> @@ -474,6 +504,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  	},
>  	.num_lvds = 1,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  };
>  
>  static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> @@ -502,6 +534,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	},
>  	.num_lvds = 2,
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> @@ -522,6 +556,8 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>  		},
>  	},
>  	.num_rpf = 5,
> +	.max_width = 8190,
> +	.max_height = 8190,
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 68c5de59d18d..b0553b43363b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -70,6 +70,8 @@ struct rcar_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
>   * @num_lvds: number of internal LVDS encoders
>   * @num_rpf: max number of RPFs in VSP
> + * @max_width: max frame width
> + * @max_height: max frame height
>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
>   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
> @@ -82,6 +84,8 @@ struct rcar_du_device_info {
>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>  	unsigned int num_lvds;
>  	unsigned int num_rpf;
> +	unsigned int max_width;
> +	unsigned int max_height;
>  	unsigned int dpll_mask;
>  	unsigned int dsi_clk_mask;
>  	unsigned int lvds_clk_mask;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 190dbb7f15dd..5857705aac20 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -834,17 +834,12 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
>  
> -	if (rcdu->info->gen < 3) {
> -		dev->mode_config.max_width = 4095;
> -		dev->mode_config.max_height = 2047;
> -	} else {
> -		/*
> -		 * The Gen3 DU uses the VSP1 for memory access, and is limited
> -		 * to frame sizes of 8190x8190.
> -		 */
> -		dev->mode_config.max_width = 8190;
> -		dev->mode_config.max_height = 8190;
> -	}
> +	/*
> +	 * The Gen3 DU uses the VSP1 for memory access, and is limited
> +	 * to frame sizes of 8190x8190.
> +	 */

This comment doesn't make much sense here anymore, but I think it's
useful to keep the information. How about defining macros for the
maximum width and height on different platforms, and moving the comment
just before the macro definitions ?

> +	dev->mode_config.max_width = rcdu->info->max_width;
> +	dev->mode_config.max_height = rcdu->info->max_height;
>  
>  	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
>  

-- 
Regards,

Laurent Pinchart
