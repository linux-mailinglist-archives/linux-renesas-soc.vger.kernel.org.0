Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F5C209AD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 09:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390271AbgFYH5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 03:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390224AbgFYH5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 03:57:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100FAC061573
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 00:57:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o2so4919077wmh.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8OIMwuanJl4HmZcEF3LMkNCJV0PX3FzELwr5THzq6dA=;
        b=aiBnYwy4hD8HoFX/zs2bjVsacnwmxL8hjgY1/+zJKzbGeEmDqdBQJBDqnuIOdaThI+
         2/ft28jzKbGQtM9Nat549HzXpNKetYWCD0/0Lo1gsNWSpnaWa5+f74ExOQ4KZPVgkV1C
         pRW93Ys0rX7qqc37xsXZqI3dUVBjpB4mbi/kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8OIMwuanJl4HmZcEF3LMkNCJV0PX3FzELwr5THzq6dA=;
        b=i6Mo33+5OEP/We9j/d2QwgxnN4F1lm405op61aP5TYbdZ2qlzlhwvjrswNsdFwQ4ri
         NBz4TuMwpe3MJOl/MImGQZCEgTIlIONLlAEZHX2q7+DTRTX89W+V578mKJ9tG59JJxUg
         sB40S8kzHdoecD+fziurGGA562LWtXsmhrlI97j4ia41RtbdbxkRtI8N3gcs9HDPKHeN
         bPrRCz+RaPkx3dr9MHIo8TTBeDwi4v8RpKHPMhx00YQEXDrgLI1VxSmOLZNsQ84cPtU+
         ZGNdPhqpPkBwdTbscI2a1Tm6Z7C7PZPdmFpQOUeRiyMrgWhVAm4G411tqUd6BA6LIUcs
         yCUg==
X-Gm-Message-State: AOAM5318ssUT0E3sXW9HWKuKv4+5aPIRTSUpec5H233WnR5wx7HPnkTj
        ski/Pr66DWs+0rdsxRi8V7wd+w==
X-Google-Smtp-Source: ABdhPJwDwsu9Z33N3jB2aVJvsbx+4vaPhtuSnXVPwqO98ZPO+P5JVr9/Jnc6K+k7Btj9aG/rSVy8ng==
X-Received: by 2002:a1c:d5:: with SMTP id 204mr1544012wma.174.1593071818586;
        Thu, 25 Jun 2020 00:56:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o29sm22741989wra.5.2020.06.25.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 00:56:57 -0700 (PDT)
Date:   Thu, 25 Jun 2020 09:56:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200625075655.GC3278063@phenom.ffwll.local>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local>
 <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 24, 2020 at 03:40:42PM -0400, Alex Deucher wrote:
> On Wed, Jun 24, 2020 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jun 24, 2020 at 5:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> > > > > Hi Sam,
> > > > >
> > > > > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > > > > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > > > > > The DRM CRTC helpers add default modes to connectors in the connected
> > > > > > > state if no mode can be retrieved from the connector. This behaviour is
> > > > > > > useful for VGA or DVI outputs that have no connected DDC bus. However,
> > > > > > > in such cases, the status of the output usually can't be retrieved and
> > > > > > > is reported as connector_status_unknown.
> > > > > > >
> > > > > > > Extend the addition of default modes to connectors in an unknown state
> > > > > > > to support outputs that can retrieve neither the modes nor the
> > > > > > > connection status.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > >
> > > > > > From your description sounds like an OK approach.
> > > > > > But this is not something I feel too familiar with.
> > > > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > > >
> > > > > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on this
> > > > > too.
> > > >
> > > > Makes sense, and at least pre-coffee me can't immediately think of a
> > > > scenario where we're going to regret this. _unknown status is pretty much
> > > > limited to old VGA and similar things where load detect somehow isn't well
> > > > supported by the hw.
> > > >
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > >
> > > > >
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > > > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > index f5d141e0400f..9055d9573c90 100644
> > > > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> > > > > > >   if (count == 0 && connector->status == connector_status_connected)
> > > > > > >           count = drm_add_override_edid_modes(connector);
> > > > > > >
> > > > > > > - if (count == 0 && connector->status == connector_status_connected)
> > > > > > > + if (count == 0 && (connector->status == connector_status_connected ||
> > > > > > > +                    connector->status == connector_status_unknown))
> > > > > > >           count = drm_add_modes_noedid(connector, 1024, 768);
> > > > > > >   count += drm_helper_probe_add_cmdline_mode(connector);
> > > > > > >   if (count == 0)
> > > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > index 421a30f08463..afe55e2e93d2 100644
> > > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > > > > >    * The usual way to implement this is to cache the EDID retrieved in the
> > > > > > >    * probe callback somewhere in the driver-private connector structure.
> > > > > > >    * In this function drivers then parse the modes in the EDID and add
> > > > > > > -  * them by calling drm_add_edid_modes(). But connectors that driver a
> > > > > > > +  * them by calling drm_add_edid_modes(). But connectors that drive a
> > > > > > >    * fixed panel can also manually add specific modes using
> > > > > > >    * drm_mode_probed_add(). Drivers which manually add modes should also
> > > > > > >    * make sure that the &drm_connector.display_info,
> > > > > > >    * &drm_connector.width_mm and &drm_connector.height_mm fields are
> > > > > > >    * filled in.
> > > > > > >    *
> > > > > > > +  * Note that the caller function will automatically add standard VESA
> > > > > > > +  * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> > > > > > > +  * no mode and if the connector status is connector_status_connected or
> > > > > > > +  * connector_status_unknown. There is no need to call
> > > > > > > +  * drm_add_edid_modes() manually in that case.
> > > >
> > > > Hm calling drm_add_edid_modes if you have no edid is a bit a funny idea
> > > > ... Personally I'd just leave out the last sentence, I think that only
> > > > confuses readers. Or I'm not grasphing what you're trying to tell here.
> > >
> > > IIRC, some drivers used and desktop environments expected unknown
> > > rather than off for LVDS/eDP panels when the lid was shut or if the
> > > mux was switched to another device in the case of hybrid laptops.
> >
> > We seem to have totally ditched that in
> >
> > commit 05c72e77ccda89ff624108b1b59a0fc43843f343
> > Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Date:   Tue Jul 17 20:42:14 2018 +0300
> >
> >     drm/i915: Nuke the LVDS lid notifier
> >
> > No screaming yet.
> >
> > But I'm also a bit confused, for a panel there's generally an edid
> > around, or a fixed (list of) modes. That's enough to stop this
> > fallback from running, so should be all fine.
> 
> No, you are right; you will have the EDID so this shouldn't be an
> issue.  I was mis-remembering the original issue.  We originally
> always reported connected for LVDS in radeon if the panel was present,
> but then we got flack because some userspace expected unknown in
> certain cases (e.g., lid or muxed displays).  Either way the EDID info
> is still there.

Yeah I think i915 started that habit, but I guess people realized it's
unreliable enough that they should have their own lid handler in the
desktop enviromnent doing whatever they want to do on lid close.

Should we perhaps document that somewhere, that panels are always marked
as connected? Not even sure where to put that in the docs ...

Maybe adding a few of the usual suspects from the compositor side, Simon,
Pekka?
-Daniel

> 
> Alex
> 
> 
> > -Daniell
> >
> > >
> > > Alex
> > >
> > >
> > > >
> > > > r-b with or without this change since imo super tiny nit.
> > > >
> > > > Cheers, Daniel
> > > >
> > > > > > > +  *
> > > > > > >    * Virtual drivers that just want some standard VESA mode with a given
> > > > > > >    * resolution can call drm_add_modes_noedid(), and mark the preferred
> > > > > > >    * one using drm_set_preferred_mode().
> > > > >
> > > > > --
> > > > > Regards,
> > > > >
> > > > > Laurent Pinchart
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
