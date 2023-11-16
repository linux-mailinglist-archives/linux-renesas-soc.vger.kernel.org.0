Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A077D7EDF11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 12:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjKPLDo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 06:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjKPLDn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 06:03:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF919A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2023 03:03:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6035AB9A;
        Thu, 16 Nov 2023 12:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1700132589;
        bh=8KfXW81x5VjBr1pKmdlrsWa2u337baN/WeSu/7376cE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mt0s/JqxJ4FOgo8/bn6edwtI8gv68bfmcElRNzH8s8xTijQkXz4xIghopZDaqHsui
         VpU1843edCzDk+0hNTyT2kIPTed+IBST2hX9/nblKJSr83I7YYvvGqLFoxU1guFj62
         5he4bhKazx1SsrygYHEAO8hiCQ1sA1Jc+sUqSTns=
Date:   Thu, 16 Nov 2023 13:03:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "biju.das.au" <biju.das.au@gmail.com>, Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the
 comment in rzg2l_mipi_dsi_start_video()
Message-ID: <20231116110342.GB20846@pendragon.ideasonboard.com>
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB1126962629C0E20D78BDE8C8386B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYCPR01MB1126962629C0E20D78BDE8C8386B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Nov 16, 2023 at 10:58:56AM +0000, Biju Das wrote:
> Hi All,
> 
> Gentle ping. It is reviewed by both Laurent and Geert. 
> 
> Can it be applied to drm-misc-next, if everyone is happy with this patch?

Yes, now that v6.7-rc1 is out I'll send pull requests shortly.

> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Wednesday, September 6, 2023 10:44 AM
> > Subject: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment
> > in rzg2l_mipi_dsi_start_video()
> > 
> > Add missing space in the comment in rzg2l_mipi_dsi_start_video().
> > 
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes:
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This issue is noticed while backporting this driver to 6.1.y-cip [1].
> > 
> > [1]
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > index 10febea473cd..9b5cfdd3e1c5 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > @@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct
> > rzg2l_mipi_dsi *dsi)
> >  	u32 status;
> >  	int ret;
> > 
> > -	/* Configuration for Blanking sequence and start video input*/
> > +	/* Configuration for Blanking sequence and start video input */
> >  	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> >  		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> >  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);

-- 
Regards,

Laurent Pinchart
