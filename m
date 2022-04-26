Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA5F510B7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 23:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355550AbiDZVtW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 17:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355544AbiDZVtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 17:49:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206DD30F5E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 14:46:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80BF430B;
        Tue, 26 Apr 2022 23:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651009571;
        bh=dDUZQvFDFK/8cE9o9DOXsJPj/VhAwT92q4uKidk60b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oLDnBolOKdqoIIDfalrlVzBr3MrbRuaZ01O62IaBtW+Eu+/7DbUtpyqTQ2ECt9nCW
         W1AMZUy28X/qKOOA98TTa2bjzLQnj1yd7VWal5Kj2lQWB3ud0pLp0APpWZpBrBlWgJ
         xJk35l6gUEeH5WX+YeroReYjfg6IQP23F9ehL20Q=
Date:   Wed, 27 Apr 2022 00:46:11 +0300
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
Subject: Re: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
Message-ID: <YmhoI3AimOR5ovMj@pendragon.ideasonboard.com>
References: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Apr 26, 2022 at 09:41:57AM +0100, Biju Das wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
> 
> As per R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf,
> unexpected image output(such as incorrect colors or planes being
> invisible) can happen on the below conditions, as PnALPHAR register
> is not initialized by reset.
> 
> When alpha blending (PpMRm.PpSPIM=0b101) is performed and:
> 	•two Planes are enabled on any DUn (n=0,1,2,3)
> 		oDSPRn= 0x0000 0031 or 0x0000 0013
> 	•or DU0 and DU1 is used for display at the same time
> 		oDSPR0= 0x0000 0001 and DSPR1= 0x0000 0003
> 		oDSPR0= 0x0000 0003 and DSPR1= 0x0000 0001
> 	•or DU2 and DU3(H3 Only) is used for display at the same time
> 		oDSPR2= 0x0000 0001 and DSPR3= 0x0000 0003
> 		oDSPR2= 0x0000 0003 and DSPR3= 0x0000 0001
> 
> This patch set PnALPHAR register to 0 to avoid this issue.
> 
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v1->v2:
>  * Updated commit description
>  * Updated the code comments
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index f214a8b6cfd3..aa80c44dd8d7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -510,6 +510,18 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  
>  	rcar_du_plane_write(rgrp, index, PnDDCR4,
>  			    state->format->edf | PnDDCR4_CODE);
> +
> +	/*
> +	 * On Gen3, some DU channels have two planes, each being wired to a
> +	 * separate VSPD instance. The DU can then blend two planes. While
> +	 * this feature isn't used by the driver, issues related to alpha
> +	 * blending (such as incorrect colors or planes being invisible) may
> +	 * still occur if the PnALPHAR register has a stale value. Set the
> +	 * register to 0 to avoid this.
> +	 */
> +
> +	/* TODO: Check if alpha-blending should be disabled in PnMR. */
> +	rcar_du_plane_write(rgrp, index, PnALPHAR, 0);
>  }
>  
>  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,

-- 
Regards,

Laurent Pinchart
