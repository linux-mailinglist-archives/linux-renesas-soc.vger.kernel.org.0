Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E3A59C061
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 15:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiHVNUe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 09:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234750AbiHVNUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 09:20:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BE124F24
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 06:20:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B73B2B3;
        Mon, 22 Aug 2022 15:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661174430;
        bh=T3xjb+9Jx29xj6VPguf1lXxrZ++lLKuha4NYqNKcs48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XScdmiSfT/cY7RPPh5ccp81wWZCFld9+FsSN0k2yHXbxBNT1LVZvbVEkcYZO7474v
         c1L74SNGSqRpLyciKS2Acu4we+gwFnb2LHVVBn4X3tW0DLMdi9MNv0oUIJRLZTQyPh
         Xsh4pULi3BPfG+1STGwc5JHvtWPSozCTo8TauUZM=
Date:   Mon, 22 Aug 2022 16:20:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] drm: rcar-du: dsi: Improve DSI shutdown
Message-ID: <YwOCmqcZfU4zfr3D@pendragon.ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
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

On Mon, Aug 22, 2022 at 04:05:10PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Improve the DSI shutdown procedure by clearing various bits that were
> set while enabling the DSI output. There has been no clear issues caused
> by these, but it's safer to ensure that the features are disabled at the
> start of the next DSI enable.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 7f2be490fcf8..6a10a35f1122 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  
>  static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
>  {
> +	/* Disable VCLKEN */
> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
> +
> +	/* Disable DOT clock */
> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);

I think you can write 0 to those two registers, this will also be safer.
With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I think there's a bug in rcar_mipi_dsi_startup() related to this by the
way, the function only uses rcar_mipi_dsi_set() to set bits, so if the
DSI format is modified between two starts, bad things will happen.

> +
>  	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
>  	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
>  
> +	/* CFGCLK disable */
> +	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
> +
> +	/* LPCLK disable */
> +	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
> +
>  	dev_dbg(dsi->dev, "DSI device is shutdown\n");
>  }
>  

-- 
Regards,

Laurent Pinchart
