Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3281B2CCA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfE1QvP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:51:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfE1QvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:51:15 -0400
Received: from pendragon.ideasonboard.com (85-76-139-52-nat.elisa-mobile.fi [85.76.139.52])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEB03FA6;
        Tue, 28 May 2019 18:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559062273;
        bh=Cu7qwr8iVSvHU3iF7trDV2hyNHcZ7hO7GlIDCSQOIKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njKN6GdU5iTMeMdz6yBTnp3/5fSj/i22xmJ/P9zXhFjd37LULke7q+D5gD4gb5Jtz
         9bTPy3eDi7bWY36LJX3Z2cyQebUoM8vz/ClFpOzRvQrxVgTTEq3i+Pe/cFCnbFZn3N
         s6vm4A2++cRsAPnGpzI+D1V0cYbzGla9a5cMZOCc=
Date:   Tue, 28 May 2019 19:50:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190528165052.GB17874@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528164213.GB9610@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Tue, May 28, 2019 at 06:42:13PM +0200, Sam Ravnborg wrote:
> On Tue, May 28, 2019 at 05:12:31PM +0300, Laurent Pinchart wrote:
> > In dual-link LVDS mode, the LVDS1 encoder is used as a companion for
> > LVDS0, and both encoders transmit data from DU0. The LVDS1 output of DU1
> > can't be used in that case, don't create an encoder and connector for
> > it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > Changess since v2:
> > 
> > - Remove unneeded bridge NULL check
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index 6c91753af7bc..0f00bdfe2366 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -16,6 +16,7 @@
> >  #include "rcar_du_drv.h"
> >  #include "rcar_du_encoder.h"
> >  #include "rcar_du_kms.h"
> > +#include "rcar_lvds.h"
> >  
> >  /* -----------------------------------------------------------------------------
> >   * Encoder
> > @@ -97,6 +98,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  		}
> >  	}
> >  
> > +	/*
> > +	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> > +	 * companion for LVDS0 in dual-link mode.
> > +	 */
> > +	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> 
> Both subject and comment above says "On Gen3", but the code looks like
> it implements "On Gen3 or newer" - due to use of ">=".
> Looks wrong to me.

Gen3 is the newest generation :-) We thus use >= through the DU and LVDS
drivers to prepare for support of Gen4, just in case.

-- 
Regards,

Laurent Pinchart
