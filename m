Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7365C24005B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 01:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgHIXDr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 19:03:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIXDr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 19:03:47 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04897F9;
        Mon, 10 Aug 2020 01:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597014224;
        bh=Kk+tp0hb9UsCcHFvuEh/LTmlcLsTugnaUod79jKG4WQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VtVnT3xcPU0HcewhkSz1Wn++3m01M5NnNU4t08w/nWeK+64gvqP4zx20lfCoW+zN8
         pDnNZS1BJp8kAg7W8V4A1sCQaftbW6Ski6g+mBr4cDIzVP3uflcMDSH1g2yjyh77fo
         7IEa7S52D4HtgH3h48Gsuzl/83sUGAD7xo8HDDSM=
Date:   Mon, 10 Aug 2020 02:03:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/7] drm: rcar-du: Add r8a7742 support
Message-ID: <20200809230330.GA12018@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808210219.GN6186@pendragon.ideasonboard.com>
 <CA+V-a8ts72UAUbtcN6TTDwcHqFEF3HipLx=dkQxFCXTLLzgfXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8ts72UAUbtcN6TTDwcHqFEF3HipLx=dkQxFCXTLLzgfXA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Aug 09, 2020 at 09:38:05PM +0100, Lad, Prabhakar wrote:
> On Sat, Aug 8, 2020 at 10:02 PM Laurent Pinchart wrote:
> > On Fri, Aug 07, 2020 at 06:49:49PM +0100, Lad Prabhakar wrote:
> > > Add direct support for the r8a7742 (RZ/G1H).
> > >
> > > The RZ/G1H shares a common, compatible configuration with the r8a7790
> > > (R-Car H2) so that device info structure is reused, the only difference
> > > being TCON is unsupported on RZ/G1H (Currently unsupported by the driver).
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > index 3e67cf70f040..7e286c7a7a6c 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > @@ -216,8 +216,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
> > >       .channels_mask = BIT(2) | BIT(1) | BIT(0),
> > >       .routes = {
> > >               /*
> > > -              * R8A7790 has one RGB output, two LVDS outputs and one
> > > -              * (currently unsupported) TCON output.
> > > +              * R8A7742 and R8A7790 each have one RGB output and two LVDS outputs. Additionally
> > > +              * R8A7790 supports one TCON output (currently unsupported by the driver).
> >
> > Once we support TCON we'll have to split this, but for now I suppose
> > it's fine. Would you however mind wrapping this to 80 columns ? I can do
> > so when applying if it's fine with you.
>
> Agreed once TCON is added this has to be split. But isn't  the column
> size has been increased (checkpatch too doesn't complain about), but

It has, but it doesn't mean it's mandatory to increase line length :-)
I think aligning with the style of the existing code should be favoured.

> feel free to wrapp it for 80 columns.

OK, I'll do that.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > >                */
> > >               [RCAR_DU_OUTPUT_DPAD0] = {
> > >                       .possible_crtcs = BIT(2) | BIT(1) | BIT(0),
> > > @@ -443,6 +443,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> > >  };
> > >
> > >  static const struct of_device_id rcar_du_of_table[] = {
> > > +     { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
> > >       { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> > >       { .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
> > >       { .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },

-- 
Regards,

Laurent Pinchart
