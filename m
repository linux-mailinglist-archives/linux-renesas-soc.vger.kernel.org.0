Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24A720695B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 03:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388074AbgFXBMi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jun 2020 21:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387916AbgFXBMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jun 2020 21:12:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0E8C061573
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2020 18:12:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74B962A9;
        Wed, 24 Jun 2020 03:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592961155;
        bh=RUOEeSmJX14CTX33gPvKu3UYxqdpKTDunJy6H0wsVGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fZ7dw5wNeeVmIweJoenHmW4+fen1ycAAGEbLsWc74voni2gMz+D4WflUyYkXgqgb8
         uaNlF2BUkt9kPSMLPUhqPXqZkRVwBN7AM3CeR1b2P8TZUjRGOkjD+kRSQs3LXX7eT3
         D8zvIqHtKB3T390GvNQkkIheU5Zw5SLr6h93wojs=
Date:   Wed, 24 Jun 2020 04:12:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200624011209.GU5870@pendragon.ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200621084000.GM74146@ravnborg.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > The DRM CRTC helpers add default modes to connectors in the connected
> > state if no mode can be retrieved from the connector. This behaviour is
> > useful for VGA or DVI outputs that have no connected DDC bus. However,
> > in such cases, the status of the output usually can't be retrieved and
> > is reported as connector_status_unknown.
> > 
> > Extend the addition of default modes to connectors in an unknown state
> > to support outputs that can retrieve neither the modes nor the
> > connection status.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> From your description sounds like an OK approach.
> But this is not something I feel too familiar with.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on this
too.

> > ---
> >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index f5d141e0400f..9055d9573c90 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >  	if (count == 0 && connector->status == connector_status_connected)
> >  		count = drm_add_override_edid_modes(connector);
> >  
> > -	if (count == 0 && connector->status == connector_status_connected)
> > +	if (count == 0 && (connector->status == connector_status_connected ||
> > +			   connector->status == connector_status_unknown))
> >  		count = drm_add_modes_noedid(connector, 1024, 768);
> >  	count += drm_helper_probe_add_cmdline_mode(connector);
> >  	if (count == 0)
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index 421a30f08463..afe55e2e93d2 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> >  	 * The usual way to implement this is to cache the EDID retrieved in the
> >  	 * probe callback somewhere in the driver-private connector structure.
> >  	 * In this function drivers then parse the modes in the EDID and add
> > -	 * them by calling drm_add_edid_modes(). But connectors that driver a
> > +	 * them by calling drm_add_edid_modes(). But connectors that drive a
> >  	 * fixed panel can also manually add specific modes using
> >  	 * drm_mode_probed_add(). Drivers which manually add modes should also
> >  	 * make sure that the &drm_connector.display_info,
> >  	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
> >  	 * filled in.
> >  	 *
> > +	 * Note that the caller function will automatically add standard VESA
> > +	 * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> > +	 * no mode and if the connector status is connector_status_connected or
> > +	 * connector_status_unknown. There is no need to call
> > +	 * drm_add_edid_modes() manually in that case.
> > +	 *
> >  	 * Virtual drivers that just want some standard VESA mode with a given
> >  	 * resolution can call drm_add_modes_noedid(), and mark the preferred
> >  	 * one using drm_set_preferred_mode().

-- 
Regards,

Laurent Pinchart
