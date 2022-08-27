Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2895A398A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Aug 2022 20:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiH0Shv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 27 Aug 2022 14:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiH0Shu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Aug 2022 14:37:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FED4C0B5B
        for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Aug 2022 11:37:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB33C4A8;
        Sat, 27 Aug 2022 20:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661625467;
        bh=5c7Lxc+f0kiAvgQZagOEitA/u4Pd+/IuoMw1cpq2Xxs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FSYNg2TYYy5eflJXj1EanfOGgJSVicR6CqFmY/OhBiIDtWd2rvp3ooNmrD4SPWNn+
         ebESI9M5GlI0Rvr9O3CNbnXgq3CPzt2RrqtLvbkcQ1KAWb+xGqlTqIhMldxL34ODr1
         n9MTI+FhHUwVl4BJJFJPgcCExxm5fkfMWC5zqdXE=
Date:   Sat, 27 Aug 2022 21:37:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Message-ID: <Ywpkc5ut97L3kTb1@pendragon.ideasonboard.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
 <20220825103905.2450049-2-biju.das.jz@bp.renesas.com>
 <YwlboWrxzP7JWeg/@pendragon.ideasonboard.com>
 <OS0PR01MB592284D23CEF5354170765A886749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592284D23CEF5354170765A886749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sat, Aug 27, 2022 at 09:04:25AM +0000, Biju Das wrote:
> Subject: Re: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
> > On Thu, Aug 25, 2022 at 11:39:05AM +0100, Biju Das wrote:
> > > Replace use of struct rcar_du_format_info with %p4cc for printing 4CC
> > > formats.
> > 
> > The code change looks good, but doesn't match the commit message. You're
> > not replacing usage of struct rcar_du_format_info. I propose the
> > following commit message:
> > 
> > Use the %p4cc format specifier to print 4CCs, which will provide a more
> > readable message than the raw hex value.
> 
> OK.
> 
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > index 21881fb5e84a..8c2719efda2a 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > @@ -405,8 +405,8 @@ rcar_du_fb_create(struct drm_device *dev, struct
> > > drm_file *file_priv,
> > >
> > >  	format = rcar_du_format_info(mode_cmd->pixel_format);
> > >  	if (format == NULL) {
> > > -		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
> > > -			mode_cmd->pixel_format);
> > > +		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
> > > +			&mode_cmd->pixel_format);
> > >  		return ERR_PTR(-EINVAL);
> > >  	}
> > >
> > 
> > There are two other occurrences:
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > index 26b25ca58968..83631ee2fff1 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -626,8 +626,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane
> > *plane,
> > 
> >  	*format = rcar_du_format_info(state->fb->format->format);
> >  	if (*format == NULL) {
> > -		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> > -			state->fb->format->format);
> > +		dev_dbg(dev->dev, "%s: unsupported format %p4cc\n",
> > __func__,
> > +			&state->fb->format->format);
> >  		return -EINVAL;
> >  	}
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > index 25f50a297c11..8cd37d7b8ae2 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > @@ -166,8 +166,8 @@ static int rcar_du_wb_enc_atomic_check(struct
> > drm_encoder *encoder,
> > 
> >  	wb_state->format = rcar_du_format_info(fb->format->format);
> >  	if (wb_state->format == NULL) {
> > -		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> > -			fb->format->format);
> > +		dev_dbg(dev->dev, "%s: unsupported format %p4cc\n",
> > __func__,
> > +			&fb->format->format);
> >  		return -EINVAL;
> >  	}
> > 
> > I can add these changes to the patch and update the commit message when
> > applying if you're fine with that. In that case,
> 
> I am ok with it.
> 
> Is it possible for you to share the git tree with latest RCar DU changes?
> so that I can rebase RCar DU lib and RZ/G2L DU work on top of that.
> 
> Currently I am rebasing on top of drm_tip. Please let me know.

Sure. The tree is available at git://linuxtv.org/pinchartl/media.git,
and my drm next branch for the DU driver is drm/du/next.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
