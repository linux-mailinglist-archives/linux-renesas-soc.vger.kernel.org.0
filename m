Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533D02D98A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 14:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404263AbgLNNUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 08:20:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40858 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgLNNUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 08:20:09 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22BED96;
        Mon, 14 Dec 2020 14:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607951967;
        bh=7KGODU/vCu6ZBsxX/92OEQzceiYOciQSwaEJacIF6Xk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DRVSg7meSKNqxrtkdm+IbXWPvyAmRnRhHgzirSvzzfUjm7p6UX8tA5/riUXt99SR+
         y4bSXSsdouHQDBOIZrUpEouKYmfCGS/6TpksXAKyC8/HRaWh17r9pZ/4JslDw4GT2p
         MnfDVPZT0EXJWFvPyEvPjFPcc1XFgK4KgoiNTyPE=
Date:   Mon, 14 Dec 2020 15:19:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 3/9] drm: rcar-du: Drop unneeded encoder cleanup in error
 path
Message-ID: <X9dmWYbVaHhf8VGZ@pendragon.ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-4-laurent.pinchart+renesas@ideasonboard.com>
 <20201214101108.kgdxqmskgz24lfys@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214101108.kgdxqmskgz24lfys@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Mon, Dec 14, 2020 at 11:11:08AM +0100, Jacopo Mondi wrote:
> On Sat, Dec 05, 2020 at 12:01:33AM +0200, Laurent Pinchart wrote:
> > The encoder->name field can never be non-null in the error path, as that
> > can only be possible after a successful call to
> > drm_simple_encoder_init(). Drop the cleanup.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index 2d40da98144b..0edce24f2053 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -124,11 +124,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	}
> >
> >  done:
> > -	if (ret < 0) {
> > -		if (encoder->name)
> > -			encoder->funcs->destroy(encoder);
> 
> This is probably worth a Fixes tag, as accessing encoder->func if
> drm_simple_encoder_init() has not completed might lead to a NULL
> pointer dereference.

But in that case encoder->name would be NULL, so encoder->funcs won't be
dereferenced. And encoder->name can never be non-NULL here, as explained
in the commit message, so this is dead code. I don't think it requires a
Fixes: tag.

> Apart from this, patch looks good
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> > +	if (ret < 0)
> >  		devm_kfree(rcdu->dev, renc);
> > -	}
> >
> >  	return ret;
> >  }

-- 
Regards,

Laurent Pinchart
