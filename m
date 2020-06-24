Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F203207C50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 21:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405057AbgFXTkz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 15:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404915AbgFXTkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 15:40:55 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B827C061573
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 12:40:55 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f18so3639626wml.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 12:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dXAXqut5aSaZdG9ZtmEgwzwmSPZ1+IznsVshWCkB5c0=;
        b=bg00z5/puRou3g277hwj1WayZZW78LhUBHNd+5yA4w9Si42OUo/ifLaf7S/4fsaJZ8
         o/EQALRcbxAOH63Vz7M/k8RXHtjvE4+M37uSmSXZpCzEpEEoMCJ8g8NRmtO2c29bricM
         kiqDJ6LrPbSK4rrHrsTJY2hKeDbZpem3JmIaGa0IeCLLzSCUuiEotzmB3LOV71DsqEUn
         Nfz5JgdIraeYIDqA3WbcKVbCtwxfwHD+vFrea7pXtfdRnAI2KRhjkEnI52z5AV4gmf5E
         mcJKzwo+N1s+6qYxWLQ62oz1qA7Na2uX7KFmav9J4VvqTY66Io0tmHMjt7Gem42Z2c2+
         XLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dXAXqut5aSaZdG9ZtmEgwzwmSPZ1+IznsVshWCkB5c0=;
        b=XhWgnMPm7hdHorO7OYyowmnPvWY+xVxG2Fiz2pmuwf59iNzbS+mve6YhWktPyZVYQ4
         MICY+h9W3Xzu0skXB/XRQf1Y8CL79XKavcURLAn8sDOXkWYtADnJ8X6dMbljHDPc8wee
         s22v+AzLdcjIz1AZ/waIvU0u6LdlhHwcOY23fX/7YLJhw+kOoOG7FYi6xDmzzFAhdI2h
         6TSAujlnqfhn3P4e6r3sQpJMO9DOhxgDwxbKlPM++FRcgtYXI62snQNtpKxBArtbgV0S
         R2K4l6HDD2aNI8mHhy0hH4VdxyDRn6IN9EUObXqnRtu8ssjeJX5anTGNYxzb4SJTOVkC
         LQBg==
X-Gm-Message-State: AOAM532fNhUx7vR6ecdPIBoOUKdXRqqjDMZh1aaA5SyEY13Hi+cXrNfJ
        gAjMh4QpDuPLMo+dh+UK3CSIlY2F6o+D6KkHuNk=
X-Google-Smtp-Source: ABdhPJyMslWTL6MOO/+2JUVtHDVP6K2lV0BjEw417BOqJCl5h6ExhwcoQUQHmBVFQVx0ibY41bmBTV2O8nsK/x4V6K0=
X-Received: by 2002:a1c:de07:: with SMTP id v7mr7942774wmg.56.1593027653739;
 Wed, 24 Jun 2020 12:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org> <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local> <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
In-Reply-To: <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 24 Jun 2020 15:40:42 -0400
Message-ID: <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown state
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 24, 2020 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 24, 2020 at 5:24 PM Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >
> > On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> > > > Hi Sam,
> > > >
> > > > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > > > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > > > > The DRM CRTC helpers add default modes to connectors in the con=
nected
> > > > > > state if no mode can be retrieved from the connector. This beha=
viour is
> > > > > > useful for VGA or DVI outputs that have no connected DDC bus. H=
owever,
> > > > > > in such cases, the status of the output usually can't be retrie=
ved and
> > > > > > is reported as connector_status_unknown.
> > > > > >
> > > > > > Extend the addition of default modes to connectors in an unknow=
n state
> > > > > > to support outputs that can retrieve neither the modes nor the
> > > > > > connection status.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideas=
onboard.com>
> > > > >
> > > > > From your description sounds like an OK approach.
> > > > > But this is not something I feel too familiar with.
> > > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > >
> > > > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on t=
his
> > > > too.
> > >
> > > Makes sense, and at least pre-coffee me can't immediately think of a
> > > scenario where we're going to regret this. _unknown status is pretty =
much
> > > limited to old VGA and similar things where load detect somehow isn't=
 well
> > > supported by the hw.
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > >
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/d=
rm/drm_probe_helper.c
> > > > > > index f5d141e0400f..9055d9573c90 100644
> > > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes=
(struct drm_connector *connector,
> > > > > >   if (count =3D=3D 0 && connector->status =3D=3D connector_stat=
us_connected)
> > > > > >           count =3D drm_add_override_edid_modes(connector);
> > > > > >
> > > > > > - if (count =3D=3D 0 && connector->status =3D=3D connector_stat=
us_connected)
> > > > > > + if (count =3D=3D 0 && (connector->status =3D=3D connector_sta=
tus_connected ||
> > > > > > +                    connector->status =3D=3D connector_status_=
unknown))
> > > > > >           count =3D drm_add_modes_noedid(connector, 1024, 768);
> > > > > >   count +=3D drm_helper_probe_add_cmdline_mode(connector);
> > > > > >   if (count =3D=3D 0)
> > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include=
/drm/drm_modeset_helper_vtables.h
> > > > > > index 421a30f08463..afe55e2e93d2 100644
> > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > > > >    * The usual way to implement this is to cache the EDID retri=
eved in the
> > > > > >    * probe callback somewhere in the driver-private connector s=
tructure.
> > > > > >    * In this function drivers then parse the modes in the EDID =
and add
> > > > > > -  * them by calling drm_add_edid_modes(). But connectors that =
driver a
> > > > > > +  * them by calling drm_add_edid_modes(). But connectors that =
drive a
> > > > > >    * fixed panel can also manually add specific modes using
> > > > > >    * drm_mode_probed_add(). Drivers which manually add modes sh=
ould also
> > > > > >    * make sure that the &drm_connector.display_info,
> > > > > >    * &drm_connector.width_mm and &drm_connector.height_mm field=
s are
> > > > > >    * filled in.
> > > > > >    *
> > > > > > +  * Note that the caller function will automatically add stand=
ard VESA
> > > > > > +  * DMT modes up to 1024x768 if the .get_modes() helper operat=
ion returns
> > > > > > +  * no mode and if the connector status is connector_status_co=
nnected or
> > > > > > +  * connector_status_unknown. There is no need to call
> > > > > > +  * drm_add_edid_modes() manually in that case.
> > >
> > > Hm calling drm_add_edid_modes if you have no edid is a bit a funny id=
ea
> > > ... Personally I'd just leave out the last sentence, I think that onl=
y
> > > confuses readers. Or I'm not grasphing what you're trying to tell her=
e.
> >
> > IIRC, some drivers used and desktop environments expected unknown
> > rather than off for LVDS/eDP panels when the lid was shut or if the
> > mux was switched to another device in the case of hybrid laptops.
>
> We seem to have totally ditched that in
>
> commit 05c72e77ccda89ff624108b1b59a0fc43843f343
> Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Date:   Tue Jul 17 20:42:14 2018 +0300
>
>     drm/i915: Nuke the LVDS lid notifier
>
> No screaming yet.
>
> But I'm also a bit confused, for a panel there's generally an edid
> around, or a fixed (list of) modes. That's enough to stop this
> fallback from running, so should be all fine.

No, you are right; you will have the EDID so this shouldn't be an
issue.  I was mis-remembering the original issue.  We originally
always reported connected for LVDS in radeon if the panel was present,
but then we got flack because some userspace expected unknown in
certain cases (e.g., lid or muxed displays).  Either way the EDID info
is still there.

Alex


> -Daniell
>
> >
> > Alex
> >
> >
> > >
> > > r-b with or without this change since imo super tiny nit.
> > >
> > > Cheers, Daniel
> > >
> > > > > > +  *
> > > > > >    * Virtual drivers that just want some standard VESA mode wit=
h a given
> > > > > >    * resolution can call drm_add_modes_noedid(), and mark the p=
referred
> > > > > >    * one using drm_set_preferred_mode().
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Laurent Pinchart
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
