Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 427F31A6B95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 19:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732974AbgDMRm2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 13:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732943AbgDMRm1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 13:42:27 -0400
X-Greylist: delayed 83 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Apr 2020 10:42:27 PDT
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E524C008748
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2020 10:42:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F5C624B;
        Mon, 13 Apr 2020 19:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586799746;
        bh=rFsMHhAgs/Z9TQ4mJld5f73X1Lffqdk5BQW8ZTT+78A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WhR/MsRIKDA7Pls1Ed5x5WnHQzgsCSkgf/hDGTKrc2A/92WkMVKcdSKT1H+fbnTGr
         iAibUt2gRYGcH9vM7IGnHw+8LdEvwi1/yZdZPXTuZQZuhB+HSzSl93AnPHuzumAVGp
         kciDbt5abWzSX0KtYQ/ML+j531yyYGqBmI/iUjHk=
Date:   Mon, 13 Apr 2020 20:42:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] drm: bridge: simple-bridge: Make connector creation
 optional
Message-ID: <20200413174213.GF4875@pendragon.ideasonboard.com>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200413054352.GB6324@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200413054352.GB6324@ravnborg.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Mon, Apr 13, 2020 at 07:43:52AM +0200, Sam Ravnborg wrote:
> On Thu, Apr 09, 2020 at 03:36:36AM +0300, Laurent Pinchart wrote:
> > Make the connector creation optional to enable usage of the
> > simple-bridge with the DRM bridge connector helper.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Looks straightforward.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Some rambling below you can ignore.
> 
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index bac223d0430d..bad638088029 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -101,16 +101,14 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
> >  	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
> 
> The code below uses both sbridge-> and bridge->
> It confused me that we access via bridge-> when possilbe and only
> reverts to the "upper" sbridge when needed.
> This is unrelated to this patch - just an observation.
> It makes code shorter so I can see why it is done.
> 
> >  	int ret;
> >  
> > -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -		DRM_ERROR("Fix bridge driver to make connector optional!");
> > -		return -EINVAL;
> > -	}
> > -
> >  	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
> >  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> > +
> >  	if (!bridge->encoder) {
> >  		DRM_ERROR("Missing encoder\n");
> >  		return -ENODEV;
> > @@ -127,8 +125,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
> >  		return ret;
> >  	}
> >  
> > -	drm_connector_attach_encoder(&sbridge->connector,
> > -					  bridge->encoder);
> > +	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
>
> Unrelated change, but patch is trivial...

I tend not to split trivial cleanups like these in separate patches,
should I ?

> >  
> >  	return 0;
> >  }

-- 
Regards,

Laurent Pinchart
