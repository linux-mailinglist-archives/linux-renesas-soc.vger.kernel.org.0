Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE18721633
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Jun 2023 12:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjFDKsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Jun 2023 06:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjFDKsp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Jun 2023 06:48:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01E9B6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Jun 2023 03:48:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126166129043.28.openmobile.ne.jp [126.166.129.43])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE7222B6;
        Sun,  4 Jun 2023 12:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685875696;
        bh=GUhS5etQfJ1SAzcCZ5kOJUay2NSAPg4B87X9Y6Ea1AY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AsQn5oyisCzA6hrOgCLGt7J2gpTNs0zjYrUwZzEoDkEf5+uSbcOajyyw/qefuXicU
         av2ixoVkI+4lPI6A9iy1wYDcvGj0WYktPEr7tQ1I1uI7BTvxjPvfna+uTbYx4k317s
         VeP0vUxmmUSgYTRsigjUqacKXg/4Oyk3rwYkAQqQ=
Date:   Sun, 4 Jun 2023 13:48:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
 KMS init errors
Message-ID: <20230604104839.GB2483@pendragon.ideasonboard.com>
References: <20230530153251.22302-1-laurent.pinchart+renesas@ideasonboard.com>
 <OS0PR01MB592200F03BE4C64092321EB3864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592200F03BE4C64092321EB3864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jun 02, 2023 at 07:29:45PM +0000, Biju Das wrote:
> > Subject: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
> > KMS init errors
> > 
> > The (large) rcar_du_modeset_init() function can fail for many reasons,
> > two of two involving probe deferral. Use dev_err_probe() in those code
> > paths to record the cause of the probe deferral, in order to help
> > debugging probe issues.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++++
> > drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 8 ++++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> > index 12a8839fe3be..5b752adb1b02 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> > @@ -701,6 +701,10 @@ static int rcar_du_probe(struct platform_device *pdev)
> >  	/* DRM/KMS objects */
> >  	ret = rcar_du_modeset_init(rcdu);
> >  	if (ret < 0) {
> > +		/*
> > +		 * Don't use dev_err_probe(), as it would overwrite the probe
> > +		 * deferral reason recorded in rcar_du_modeset_init().
> > +		 */
> >  		if (ret != -EPROBE_DEFER)
> >  			dev_err(&pdev->dev,
> >  				"failed to initialize DRM/KMS (%d)\n", ret);
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > index adfb36b0e815..a9b01027bf03 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > @@ -932,8 +932,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > 
> >  	/* Initialize the Color Management Modules. */
> >  	ret = rcar_du_cmm_init(rcdu);
> > -	if (ret)
> > +	if (ret) {
> > +		dev_err_probe(rcdu->dev, "failed to initialize CMM\n", ret);
> 		
> 	dev_err_probe(rcdu->dev, ret, "failed to initialize CMM\n");
> 
> 	similarly for below one.

Oops. I wonder how I missed that, is it fails to even compile. Sorry :-(
I'll post a v2.

> >  		return ret;
> > +	}
> > 
> >  	/* Create the CRTCs. */
> >  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
> > @@ -952,8 +954,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > 
> >  	/* Initialize the encoders. */
> >  	ret = rcar_du_encoders_init(rcdu);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		dev_err_probe(rcdu->dev, "failed to initialize encoders\n", ret);
> >  		return ret;
> > +	}
> > 
> >  	if (ret == 0) {
> >  		dev_err(rcdu->dev, "error: no encoder could be initialized\n");

-- 
Regards,

Laurent Pinchart
