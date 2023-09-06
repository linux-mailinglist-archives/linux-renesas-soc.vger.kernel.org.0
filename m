Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9F5793D92
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Sep 2023 15:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjIFNZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Sep 2023 09:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjIFNZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2023 09:25:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410C194
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Sep 2023 06:24:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53E07DA8;
        Wed,  6 Sep 2023 15:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694006608;
        bh=O8ASfos0e7KQ3kQYHZDzxCDpFTkKK0NFcWW1Yk5WQuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ud9pUtCANON8aValeRZORHLXNaCfzhH4wwMWCwbvt2pOGXwhwuEE1FGADzd5L9+U8
         2neCPsDAx9VEUd+9v6Pj4hwiKCc07IllgrJ2xr81OZgxduZC9lxFVO75MNoAA4QzkW
         fsOue5jARyBegoIhWM9qSigyS/fTcLuZ/87dUC3Y=
Date:   Wed, 6 Sep 2023 16:25:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>, Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the
 comment in rzg2l_mipi_dsi_start_video()
Message-ID: <20230906132508.GM17308@pendragon.ideasonboard.com>
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Sep 06, 2023 at 10:43:46AM +0100, Biju Das wrote:
> Add missing space in the comment in rzg2l_mipi_dsi_start_video().
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This issue is noticed while backporting this driver to 6.1.y-cip [1].
> 
> [1] https://lore.kernel.org/all/20230905160737.167877-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> index 10febea473cd..9b5cfdd3e1c5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> @@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi)
>  	u32 status;
>  	int ret;
>  
> -	/* Configuration for Blanking sequence and start video input*/
> +	/* Configuration for Blanking sequence and start video input */
>  	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
>  		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);

-- 
Regards,

Laurent Pinchart
