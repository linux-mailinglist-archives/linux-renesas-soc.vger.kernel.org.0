Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA3C59C1D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235397AbiHVOpO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235272AbiHVOpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:45:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57760248C2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:45:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3BF12B3;
        Mon, 22 Aug 2022 16:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661179510;
        bh=kUfofvLeH8uml6Fx1n6jwXsoTitSWnbNX1ajEQc/+BI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASOBuPwEYy1Yu1vZNPYGFNe9Ghx5JRrnpDSUJ9JPwXkG+bjXh5OeLL1j53lpTYSi7
         294Z6kJ/SY6gWQepDYNV8XCA7IZ/k9arvRIfQipKpVyyhX0u0HSsEg/jkVdxglF/GX
         VW63Tp+ybmqxnJS7BHWl2rCricSecdqNDJGzxLyI=
Date:   Mon, 22 Aug 2022 17:45:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Message-ID: <YwOWc1pKM+vFK80P@pendragon.ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Aug 22, 2022 at 05:34:01PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
> or-operation to add the new values to the current value in the register,
> it should first make sure the fields are cleared.
> 
> Do this by using rcar_mipi_dsi_write() to write the VCLKSET_CKEN bit to
> VCLKSET before the rest of the VCLKSET configuration.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 06250f2f3499..b60a6d4a5d46 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -412,9 +412,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  			return ret;
>  	}
>  
> -	/* Enable DOT clock */
> -	vclkset = VCLKSET_CKEN;
> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +	/* Clear VCLKSET and enable DOT clock */
> +	rcar_mipi_dsi_write(dsi, VCLKSET, VCLKSET_CKEN);
> +
> +	vclkset = 0;
>  
>  	if (dsi_format == 24)
>  		vclkset |= VCLKSET_BPP_24;

You can replace one more set() with a write():

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 06250f2f3499..2744ea23e6f6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -414,7 +414,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,

 	/* Enable DOT clock */
 	vclkset = VCLKSET_CKEN;
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);

 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
@@ -429,7 +429,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
 		|  VCLKSET_LANE(dsi->lanes - 1);

-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);

 	/* After setting VCLKSET register, enable VCLKEN */
 	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);

I'll apply patches 1/5 to 4/5 to my tree already.

-- 
Regards,

Laurent Pinchart
