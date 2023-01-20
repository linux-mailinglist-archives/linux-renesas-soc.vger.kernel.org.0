Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44CB26759BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 17:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjATQTU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 11:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjATQTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 11:19:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053B130F0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 08:19:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37895514;
        Fri, 20 Jan 2023 17:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674231556;
        bh=Hg/04fLGcBELgEBvbgtX/Sky963evfJEH75/r2EiALw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cvCgRC+OYgU/Fr+7Vi1LsnY3LoNTvwC6KFa1Fyd1eykHnauceFlO+VyWRUj54RJn6
         YBeP4y75H4au/a93ewHUsahVS0uf347HlXwawXa7YRMhdGHxD9FGzQEra+hzFiOJr7
         P55V4c6wotvxsY6YQ8uCy/dGbui9oZxjLME4GfIY=
Date:   Fri, 20 Jan 2023 18:19:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH v2 4/7] drm: rcar-du: lvds: Fix stop sequence
Message-ID: <Y8q/AU/ly6/LUL+Z@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-5-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120085009.604797-5-tomi.valkeinen+renesas@ideasonboard.com>
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

On Fri, Jan 20, 2023 at 10:50:06AM +0200, Tomi Valkeinen wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to hardware manual, LVDCR0 register must be cleared bit by bit
> when disabling LVDS.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: simplified the code a bit]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 668604616bfd..8fa5f7400179 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -83,6 +83,11 @@ struct rcar_lvds {
>  #define bridge_to_rcar_lvds(b) \
>  	container_of(b, struct rcar_lvds, bridge)
>  
> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
> +{
> +	return ioread32(lvds->mmio + reg);
> +}
> +
>  static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>  {
>  	iowrite32(data, lvds->mmio + reg);
> @@ -544,6 +549,27 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
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
>  
>  	rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);

-- 
Regards,

Laurent Pinchart
