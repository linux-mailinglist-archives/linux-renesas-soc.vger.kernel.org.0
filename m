Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C72672A20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 22:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjARVNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 16:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjARVNc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 16:13:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4297C62D10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 13:12:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0CA41056;
        Wed, 18 Jan 2023 22:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674076373;
        bh=zRzoLqB0W4Yjt4hwLvXC0DQFfJ3wVs3D7T1wyVBJHv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qd/g6dI2IfQbRRwb06Ze0w4npd/p8lBfY9dXzMup47rxhhoJrRRmLl+/b/oh1syNR
         qkjOcngSl9f02qcNPZtBezrihVePDC40o40EgDxcYlCoOWEmTr2rejB534aIni/UjP
         9+QyS4/A2gv0+Ve7qoIYv7ymHAhPc8/Wm+qAkuOk=
Date:   Wed, 18 Jan 2023 23:12:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 3/6] drm: rcar-du: Fix LVDS stop sequence
Message-ID: <Y8hg0m7cidkscHkN@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:51PM +0200, Tomi Valkeinen wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to H/W manual, LVDCR0 register must be cleared bit by bit when

s@H/W@the hardware/

> disabling LVDS.

I don't like this much, but I think I'll stop fighting :-)

> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: simplified the code a bit]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 674b727cdaa2..01800cef1c33 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -87,6 +87,11 @@ static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>  	iowrite32(data, lvds->mmio + reg);
>  }
>  
> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
> +{
> +	return ioread32(lvds->mmio + reg);
> +}

Could you please move read before write ?

> +
>  /* -----------------------------------------------------------------------------
>   * PLL Setup
>   */
> @@ -549,8 +554,28 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +	u32 lvdcr0;
> +
> +	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> +
> +	lvdcr0 &= ~LVDCR0_LVRES;
> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> +		lvdcr0 &= ~LVDCR0_LVEN;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> +		lvdcr0 &= ~LVDCR0_PWD;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
> +	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> +		lvdcr0 &= ~LVDCR0_PLLON;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}

This will leave LVDCR0_BEN and LVDCR0_LVEN on Gen2. Is that fine ?

>  
> -	rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  

-- 
Regards,

Laurent Pinchart
