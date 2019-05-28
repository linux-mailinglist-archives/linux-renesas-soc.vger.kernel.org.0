Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17BA2CCDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 19:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfE1RCr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 13:02:47 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:37648 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 13:02:47 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A02BA2003D;
        Tue, 28 May 2019 19:02:43 +0200 (CEST)
Date:   Tue, 28 May 2019 19:02:42 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190528170242.GB10262@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
 <20190528165052.GB17874@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528165052.GB17874@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
        a=xIEnxEUKAAAA:8 a=Qv0YFi8OrfPa8QNwrDoA:9 a=CjuIK1q_8ugA:10
        a=D0XLA9XvdZm18NrgonBM:22 a=JpDqF-G6Ufas406PgLIE:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

On Tue, May 28, 2019 at 07:50:52PM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Tue, May 28, 2019 at 06:42:13PM +0200, Sam Ravnborg wrote:
> > On Tue, May 28, 2019 at 05:12:31PM +0300, Laurent Pinchart wrote:
> > > In dual-link LVDS mode, the LVDS1 encoder is used as a companion for
> > > LVDS0, and both encoders transmit data from DU0. The LVDS1 output of DU1
> > > can't be used in that case, don't create an encoder and connector for
> > > it.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > > Changess since v2:
> > > 
> > > - Remove unneeded bridge NULL check
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
> > >  2 files changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > > index 6c91753af7bc..0f00bdfe2366 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > > @@ -16,6 +16,7 @@
> > >  #include "rcar_du_drv.h"
> > >  #include "rcar_du_encoder.h"
> > >  #include "rcar_du_kms.h"
> > > +#include "rcar_lvds.h"
> > >  
> > >  /* -----------------------------------------------------------------------------
> > >   * Encoder
> > > @@ -97,6 +98,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> > >  		}
> > >  	}
> > >  
> > > +	/*
> > > +	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> > > +	 * companion for LVDS0 in dual-link mode.
> > > +	 */
> > > +	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> > 
> > Both subject and comment above says "On Gen3", but the code looks like
> > it implements "On Gen3 or newer" - due to use of ">=".
> > Looks wrong to me.
> 
> Gen3 is the newest generation :-) We thus use >= through the DU and LVDS
> drivers to prepare for support of Gen4, just in case.
OK, but I guess we agree that the comment needs a small update them.

Actually I implicitly reads that it is only from Gen3 onwards that the
LVDS1 encoder can be used as a companion.
My initial understanding reading the comment was that this implmented a
workaround for Gen3 - but it is a workarounf for missing features in
older than Gen3.
So, assuming this is correct, when trying to specify a companion on
older then Gen3 should result in some kind of error/warning?
(Maybe it does).

	Sam
