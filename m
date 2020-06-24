Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D638A206D84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 09:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389740AbgFXHXJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 03:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389684AbgFXHXJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 03:23:09 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF40DC061573
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 00:23:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so1177529wrc.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EifhZnIbVxUxBgKfWD+MbByMzzVgxUGQ9dcLOhjditI=;
        b=kw3kvZtr3+vn9sEiTThiMHOdBMg3e1izqRTYdBM2BGHXWNMLWW1TyYnZSfKCh2XcQ8
         JAlX5IvySC6i5shOF9sSwYUKHmFvOKcnpvFhs2kquX++1fg4+R98S6G0uoDtukPzYWs7
         nfu0te6p1iG5wbqxTR4Wo4kTU/qij8WizFNPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EifhZnIbVxUxBgKfWD+MbByMzzVgxUGQ9dcLOhjditI=;
        b=D2U+2jI0L2BiaKLDCiofvyThcCNO5C++O4yywdz3oCZXvU9c6bbrWhbz8ph36kD6oA
         vcAWT0dxeMXn8IQ6Ma9I9usfoTdMZL0b8/q3q4xmFhJXPtd9ke/pPMMIHcoTQXlPRDZK
         ZmE/U4tnxB8L4cau5ZNY+RH5kzNhlfxNfxhpaV0o4movLJoBlc6VoCVnOfS73cXeLaJh
         hLrE0WGs/WFQEO6Iv0Zygy+7qcMpEFZmk5Zm+abH0FyZ4ot0xobXBdgCzvStEx5ll36S
         M8OKqVipFgalNaR4hkPtDYZ25UgYlvI+kVSrRZH/aRuZEnU9g4Biq+1WDKOq0ZJARzN2
         Ba6Q==
X-Gm-Message-State: AOAM532eySao7Y/hwGDtP2GqzfNU0V+1UGz7xnT5L7BilRdqgoui2rfR
        Ei6NY3LXLrcZuF20ClmwZadiAg==
X-Google-Smtp-Source: ABdhPJyfrqUTeIvtGQ3Xpv4GtDMtsLxGD+dT0TgrVnBF3swSrmxRF9c9YzUd9J4CQrbLeIW6WXdswA==
X-Received: by 2002:adf:f14e:: with SMTP id y14mr29417639wro.151.1592983387402;
        Wed, 24 Jun 2020 00:23:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b10sm6675011wmj.30.2020.06.24.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 00:23:06 -0700 (PDT)
Date:   Wed, 24 Jun 2020 09:23:04 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Message-ID: <20200624072304.GT20149@phenom.ffwll.local>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624011209.GU5870@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > The DRM CRTC helpers add default modes to connectors in the connected
> > > state if no mode can be retrieved from the connector. This behaviour is
> > > useful for VGA or DVI outputs that have no connected DDC bus. However,
> > > in such cases, the status of the output usually can't be retrieved and
> > > is reported as connector_status_unknown.
> > > 
> > > Extend the addition of default modes to connectors in an unknown state
> > > to support outputs that can retrieve neither the modes nor the
> > > connection status.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > From your description sounds like an OK approach.
> > But this is not something I feel too familiar with.
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on this
> too.

Makes sense, and at least pre-coffee me can't immediately think of a
scenario where we're going to regret this. _unknown status is pretty much
limited to old VGA and similar things where load detect somehow isn't well
supported by the hw.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> > > ---
> > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > > index f5d141e0400f..9055d9573c90 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> > >  	if (count == 0 && connector->status == connector_status_connected)
> > >  		count = drm_add_override_edid_modes(connector);
> > >  
> > > -	if (count == 0 && connector->status == connector_status_connected)
> > > +	if (count == 0 && (connector->status == connector_status_connected ||
> > > +			   connector->status == connector_status_unknown))
> > >  		count = drm_add_modes_noedid(connector, 1024, 768);
> > >  	count += drm_helper_probe_add_cmdline_mode(connector);
> > >  	if (count == 0)
> > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > index 421a30f08463..afe55e2e93d2 100644
> > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > >  	 * The usual way to implement this is to cache the EDID retrieved in the
> > >  	 * probe callback somewhere in the driver-private connector structure.
> > >  	 * In this function drivers then parse the modes in the EDID and add
> > > -	 * them by calling drm_add_edid_modes(). But connectors that driver a
> > > +	 * them by calling drm_add_edid_modes(). But connectors that drive a
> > >  	 * fixed panel can also manually add specific modes using
> > >  	 * drm_mode_probed_add(). Drivers which manually add modes should also
> > >  	 * make sure that the &drm_connector.display_info,
> > >  	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
> > >  	 * filled in.
> > >  	 *
> > > +	 * Note that the caller function will automatically add standard VESA
> > > +	 * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> > > +	 * no mode and if the connector status is connector_status_connected or
> > > +	 * connector_status_unknown. There is no need to call
> > > +	 * drm_add_edid_modes() manually in that case.

Hm calling drm_add_edid_modes if you have no edid is a bit a funny idea
... Personally I'd just leave out the last sentence, I think that only
confuses readers. Or I'm not grasphing what you're trying to tell here.

r-b with or without this change since imo super tiny nit.

Cheers, Daniel

> > > +	 *
> > >  	 * Virtual drivers that just want some standard VESA mode with a given
> > >  	 * resolution can call drm_add_modes_noedid(), and mark the preferred
> > >  	 * one using drm_set_preferred_mode().
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
