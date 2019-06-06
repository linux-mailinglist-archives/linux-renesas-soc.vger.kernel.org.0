Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2844236DF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 09:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfFFH6G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 03:58:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35326 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfFFH6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 03:58:06 -0400
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B1A633B;
        Thu,  6 Jun 2019 09:58:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559807884;
        bh=qw2VFwAtGsSBBTXuxyGdadIiKT5jk0BwcD44/EhsjSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vfIhxQDRMoXqE0w3DUPBKs3a7K4/PMStciTbCMswiaCMlIPmXnEBqM010sShgMvbU
         RNTiIP4sdZYRAp+Z9Li8yO5oDTRLA/4fVh09QfpXdUHOGBJ8z88ugKA1KLeYIPo0NG
         vzcv+/G6hwbUd/PLk7uBKYTdHyOVOkdZ3Aa6SuMU=
Date:   Thu, 6 Jun 2019 10:57:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190606075750.GE4931@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
 <20190528165052.GB17874@pendragon.ideasonboard.com>
 <20190528170242.GB10262@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528170242.GB10262@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Tue, May 28, 2019 at 07:02:42PM +0200, Sam Ravnborg wrote:
> On Tue, May 28, 2019 at 07:50:52PM +0300, Laurent Pinchart wrote:
> > On Tue, May 28, 2019 at 06:42:13PM +0200, Sam Ravnborg wrote:
> >> On Tue, May 28, 2019 at 05:12:31PM +0300, Laurent Pinchart wrote:
> >>> In dual-link LVDS mode, the LVDS1 encoder is used as a companion for
> >>> LVDS0, and both encoders transmit data from DU0. The LVDS1 output of DU1
> >>> can't be used in that case, don't create an encoder and connector for
> >>> it.
> >>> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>> Changess since v2:
> >>> 
> >>> - Remove unneeded bridge NULL check
> >>> ---
> >>>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
> >>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
> >>>  2 files changed, 13 insertions(+), 1 deletion(-)
> >>> 
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> >>> index 6c91753af7bc..0f00bdfe2366 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> >>> @@ -16,6 +16,7 @@
> >>>  #include "rcar_du_drv.h"
> >>>  #include "rcar_du_encoder.h"
> >>>  #include "rcar_du_kms.h"
> >>> +#include "rcar_lvds.h"
> >>>  
> >>>  /* -----------------------------------------------------------------------------
> >>>   * Encoder
> >>> @@ -97,6 +98,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >>>  		}
> >>>  	}
> >>>  
> >>> +	/*
> >>> +	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> >>> +	 * companion for LVDS0 in dual-link mode.
> >>> +	 */
> >>> +	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> >> 
> >> Both subject and comment above says "On Gen3", but the code looks like
> >> it implements "On Gen3 or newer" - due to use of ">=".
> >> Looks wrong to me.
> > 
> > Gen3 is the newest generation :-) We thus use >= through the DU and LVDS
> > drivers to prepare for support of Gen4, just in case.
>
> OK, but I guess we agree that the comment needs a small update them.
> 
> Actually I implicitly reads that it is only from Gen3 onwards that the
> LVDS1 encoder can be used as a companion.
> My initial understanding reading the comment was that this implmented a
> workaround for Gen3 - but it is a workarounf for missing features in
> older than Gen3.

I wouldn't say workaround, it just makes sure that we don't try to
support LVDS dual-mode on older SoCs as the feature was added in Gen3
hardware.

> So, assuming this is correct, when trying to specify a companion on
> older then Gen3 should result in some kind of error/warning?
> (Maybe it does).

The property is ignored in that case. I could add an error message, but
I'm not sure I should, as we don't usually check that DT nodes don't
contain any other property than the ones specified in the DT bindings
(an automatic DT runtime validator based on the YAML bindings could be
interesting ;-)).

-- 
Regards,

Laurent Pinchart
