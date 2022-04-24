Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D513A50D5F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 01:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbiDXX2N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 19:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbiDXX2M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 19:28:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A9C5DA70
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Apr 2022 16:25:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02FD087F;
        Mon, 25 Apr 2022 01:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650842706;
        bh=WCK7oALgNpq3WZEwxsfolQhOfp3stRL6FCzjXT/aVgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wjNbFFvu9xEAqDesUzyOzdwyyQFjdpotvqzGfrazi4EHWK/HWx86XZP3FI5dod52O
         uqDwVvnFu+X9/aEp0xdFNWz41Mxgi+ZxGQXNUyLThUi/R82poy2kZtKSPry1ydSFMk
         8VsYNqHVP7oC8KYaD4EGUHGn8w8Hu5F2aTv7b59c=
Date:   Mon, 25 Apr 2022 02:25:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Hoai Luu <hoai.luu.ub@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Message-ID: <YmXcUe0/ip43XloB@pendragon.ideasonboard.com>
References: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
 <YmVtRlI0+IfuXujL@pendragon.ideasonboard.com>
 <OS0PR01MB59229B70A7C183B82882BFDC86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59229B70A7C183B82882BFDC86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, Apr 24, 2022 at 04:12:08PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
> > On Sat, Apr 23, 2022 at 08:37:28AM +0100, Biju Das wrote:
> > > From: LUU HOAI <hoai.luu.ub@renesas.com>
> > >
> > > In Gen3, when Alpha blend is enabled in the PnMR register, depending
> > > on the initial value of the PnALPHAR register, either channel of DU
> > > might be black screen.
> > > Therefore, this patch prevents the black screen by setting the
> > > PnALPHAR register to all 0.
> > >
> > > In addition, PnALPHAR register will be released in the R-Car Gen3
> > > Hardware Manual Rev 2.4 (Sep. 2021).
> > >
> > > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > This patch is based on [1]
> > > [1]
> > >
> > > Not sure this patches has to go with Fixes tag for stable??
> > >
> > > Tested the changes on RZ/G2M board
> > >
> > > root@hihope-rzg2m:/cip-test-scripts#  modetest -M rcar-du -w
> > > 54:alpha:55555 root@hihope-rzg2m:/cip-test-scripts# modetest -M rcar-du
> > -s "93@90:1024x768@AR24" -d -P "54@90:400x300+200+200@XR24"
> > > setting mode 1024x768-75Hz@AR24 on connectors 93, crtc 90 testing
> > > 400x300@XR24 overlay plane 54
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > > b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > > index 5c1c7bb04f3f..aff39b9253f8 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > > @@ -510,6 +510,12 @@ static void
> > > rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
> > >
> > >  	rcar_du_plane_write(rgrp, index, PnDDCR4,
> > >  			    state->format->edf | PnDDCR4_CODE);
> > > +
> > > +	/* In Gen3, PnALPHAR register need to be set to 0
> > > +	 * to avoid black screen issue when alpha blend is enable
> > > +	 * on DU module
> > > +	 */
> > 
> > Comments should start with /* on a line of its own, and you can also
> > reflow the text to 80 columns:
> 
> OK.
> 
> > 	/*
> > 	 * In Gen3, PnALPHAR register need to be set to 0 to avoid black screen
> > 	 * issue when alpha blend is enable on DU module.
> > 	 */
> > 
> > It would however be nicer to document the exact behaviour, but the latest
> > version of the documentation I have access to is rev 2.3 and it lists
> > PnALPHAR as not available on Gen3.
> 
> I don't have access to rev 2.4, but I got access to 
> "R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf" 
> where it is mentioned about this issue and solution for fix
> which is inline with the patch from R-Car BSP.
> 
> "The reason is that a register is not initialized by reset.
> This could lead to output wrong image data of other plane or 
> wrong color set from BPOR (Background plane output register)."
> 
> > Furthermore, is this really the right fix, shouldn't we instead avoid
> > enabling alpha-blending in PnMR on Gen3 ?
> 
> Avoid enabling alpha-blending in PnMR on Gen3, will it help here?

It's hard to tell without knowing the exact cause of the issue. Clearing
PnALPHAR probably makes sense on Gen3 if the register exists,
independently from disabling alpha blending in PnMR. It would be nice if
the commit messsage could reference the issue described in
R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf. I would also
expand the comment a little bit:

 /*
  * On Gen3, some DU channels have two planes, each being wired to a separate
  * VSPD instance. The DU can then blend two two planes. While this feature
  * isn't used by the driver, issues related to alpha blending (such as
  * incorrect colors or planes being invisible) may still occur if the PnALPHAR
  * register has a stale value. Set the register to 0 to avoid this.
  */

> Here the issue they mentioned as "register is not initialized by reset"
> 
> > > +	rcar_du_plane_write(rgrp, index, PnALPHAR, 0x00000000);

I'd write 0 instead of 0x00000000 to match the rest of the driver.

Would you mind sending a v2 with these changed and an expanded commit
message ?

> > >  }
> > >
> > >  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,

-- 
Regards,

Laurent Pinchart
