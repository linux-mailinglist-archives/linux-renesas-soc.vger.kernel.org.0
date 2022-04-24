Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3692D50D2E2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 17:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiDXPi2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 11:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240699AbiDXPeX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 11:34:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B847F170E3F
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 08:31:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4695930B;
        Sun, 24 Apr 2022 17:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650814278;
        bh=vKKxFT2p1cxcscA0uKSVIAwHFyojOOhC3vEO52mlaQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WlktwopVQxDaB2gL7j8oszAyc31lrp7N8VRRE8W3Wz9VqiEh0xaJabDpUofPtkImU
         jmFK/HuEPnyz6b1UBGNjwnrD5rIkY8kvgnu36/6Lx+X3RkLRGIj1v5LmW67AW16G4h
         /PJhkklclWtFnjb7QJrl5JXJheWhUKlrpn5cbPIM=
Date:   Sun, 24 Apr 2022 18:31:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Message-ID: <YmVtRlI0+IfuXujL@pendragon.ideasonboard.com>
References: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Sat, Apr 23, 2022 at 08:37:28AM +0100, Biju Das wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
> 
> In Gen3, when Alpha blend is enabled in the PnMR register,
> depending on the initial value of the PnALPHAR register,
> either channel of DU might be black screen.
> Therefore, this patch prevents the black screen by setting
> the PnALPHAR register to all 0.
> 
> In addition, PnALPHAR register will be released in
> the R-Car Gen3 Hardware Manual Rev 2.4 (Sep. 2021).
> 
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is based on [1]
> [1] https://github.com/renesas-rcar/linux-bsp/commit/fcb34fe338cbde0a64919430733541035f20a784
> 
> Not sure this patches has to go with Fixes tag for stable??
> 
> Tested the changes on RZ/G2M board
> 
> root@hihope-rzg2m:/cip-test-scripts#  modetest -M rcar-du -w 54:alpha:55555
> root@hihope-rzg2m:/cip-test-scripts# modetest -M rcar-du -s "93@90:1024x768@AR24" -d -P "54@90:400x300+200+200@XR24"
> setting mode 1024x768-75Hz@AR24 on connectors 93, crtc 90
> testing 400x300@XR24 overlay plane 54
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 5c1c7bb04f3f..aff39b9253f8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -510,6 +510,12 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  
>  	rcar_du_plane_write(rgrp, index, PnDDCR4,
>  			    state->format->edf | PnDDCR4_CODE);
> +
> +	/* In Gen3, PnALPHAR register need to be set to 0
> +	 * to avoid black screen issue when alpha blend is enable
> +	 * on DU module
> +	 */

Comments should start with /* on a line of its own, and you can also
reflow the text to 80 columns:

	/*
	 * In Gen3, PnALPHAR register need to be set to 0 to avoid black screen
	 * issue when alpha blend is enable on DU module.
	 */

It would however be nicer to document the exact behaviour, but the
latest version of the documentation I have access to is rev 2.3 and it
lists PnALPHAR as not available on Gen3.

Furthermore, is this really the right fix, shouldn't we instead avoid
enabling alpha-blending in PnMR on Gen3 ?

> +	rcar_du_plane_write(rgrp, index, PnALPHAR, 0x00000000);
>  }
>  
>  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,

-- 
Regards,

Laurent Pinchart
