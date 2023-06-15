Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68ADA731908
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jun 2023 14:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238879AbjFOMhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jun 2023 08:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238606AbjFOMhw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2023 08:37:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DFB1FDB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2023 05:37:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60B0E9CA;
        Thu, 15 Jun 2023 14:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686832637;
        bh=hIEOVse6qazEAlkeZxwAJFOzUKn6nBKAZolQ6jdLQsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hNI0ww/bCpMHmUv+E/ezx6guEQ5LasT/LNUuSbVD/o/ENrQMhRnulpPelIw2sWUhx
         KER5yW41TWlyQl3anlEcviLi3jkYt6TMDGYKRt67QMG/H+MRdUai4cLuVHr9s0nPiT
         jBBR3JpkY4P5+9/upvkaR046loRoDefGKqS3Mz4M=
Date:   Thu, 15 Jun 2023 15:37:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <20230615123749.GH741@pendragon.ideasonboard.com>
References: <05ac5099-b1f6-4f83-950a-ae02fc47eda1@moroto.mountain>
 <OS0PR01MB59229EB7C14790662AA225F1865BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59229EB7C14790662AA225F1865BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Thu, Jun 15, 2023 at 06:22:45AM +0000, Biju Das wrote:
> Hi Dan Carpenter,
> 
> Thanks for the feedback.
> 
> + Laurent.
> 
> It is already validated in [1]
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c#L619
> 
> So we won't get wrong formats in rzg2l_mipi_dsi_set_display_timing().
> 
> Laurent, Please correct me if I am wrong.

The issue is that static checkers can't know that. You should add a
default statement to the switch, possibly with a comment to explain why.

> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Thursday, June 15, 2023 7:14 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Subject: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
> > 
> > Hello Biju Das,
> > 
> > The patch 7a043f978ed1: "drm: rcar-du: Add RZ/G2L DSI driver" from Sep 20,
> > 2022, leads to the following Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c:374 rzg2l_mipi_dsi_set_display_timing()
> > 	error: uninitialized symbol 'vich1ppsetr'.
> > 
> > drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> >     347 static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
> >     348                                               const struct drm_display_mode *mode)
> >     349 {
> >     350         u32 vich1ppsetr;
> >     351         u32 vich1vssetr;
> >     352         u32 vich1vpsetr;
> >     353         u32 vich1hssetr;
> >     354         u32 vich1hpsetr;
> >     355         int dsi_format;
> >     356         u32 delay[2];
> >     357         u8 index;
> >     358
> >     359         /* Configuration for Pixel Packet */
> >     360         dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
> >     361         switch (dsi_format) {
> >     362         case 24:
> >     363                 vich1ppsetr = VICH1PPSETR_DT_RGB24;
> >     364                 break;
> >     365         case 18:
> >     366                 vich1ppsetr = VICH1PPSETR_DT_RGB18;
> >     367                 break;
> > 
> > mipi_dsi_pixel_format_to_bpp() also returns 16 and -EIVNAL.
> > 
> >     368         }
> >     369
> >     370         if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
> >     371             !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
> >     372                 vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
> >     373
> > --> 374         rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
> >                                                             ^^^^^^^^^^^
> > Static checker uninitialized variable warning.
> > 
> >     375
> >     376         /* Configuration for Video Parameters */
> >     377         vich1vssetr = VICH1VSSETR_VACTIVE(mode->vdisplay) |
> >     378                       VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
> >     379         vich1vssetr |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
> > 
> > regards,
> > dan carpenter

-- 
Regards,

Laurent Pinchart
