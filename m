Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1653207C34
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 21:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405057AbgFXTcA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 15:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404915AbgFXTcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 15:32:00 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93794C061573
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 12:31:59 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id n24so787629otr.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H+qpr36VRF/bt3KSeazRA8COLG2IbZNpJtO/Ps4hGgs=;
        b=Bfm5n+lneiTxKci6bkkeXfrWyy3qkfc9SDCB3F7UjVgV/2/mhXSuK91gG6YSnH8SYR
         YS2VvKWee39Xw0j4vHpOeDmMW6dlbRYXDh8OCRGaQozAVr//eVFM5HUMOrN6GlvgsIol
         puXdWPNzU+a5T+1GfskVQrK8WK27RTN3pS47w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H+qpr36VRF/bt3KSeazRA8COLG2IbZNpJtO/Ps4hGgs=;
        b=ABgMLbHiAyGrLvS277bMtojoLVDfvjvDN46VetXFNMph4tcqMv0HQmJZIp+kpZcbn7
         XgwpkAVktiFMIx31lf6Zn8HO1uPqjCVw2DxMarCbnWGl1ma9plWt3d7EULiVKDrNGynA
         5joxTdm+6EprMDFPjsJ2M+hO98SU8hqHRHPvvruFfq3xr84EKXkMnBeANMD1D5hPoCfW
         xTs5IY1/K3jnlFu4RxKG0KO5d+84LR28TwVAYiYuXzWqZQbcolmI68p8rPuKHAba1BLZ
         0fp4lYg2aDxUFCtWe+RxLEU7QLFnl37SWLGLgIYY+peaHdU60ZU0TGj9FnINb4wZ3qLZ
         TNVQ==
X-Gm-Message-State: AOAM533LPAxJBUTNRdzwM21iaKd8u/DbOFKzfj8oMzN9D+d+rjygNEBk
        hkkLUUXKCY/H91wmiCv1gRSkztrecOURRKaC1evLYg==
X-Google-Smtp-Source: ABdhPJycOvwFq3eOm/KQvrAnuDLGYDxsHxBB9ft8+ATcSWJpC2YbnNT0iR9TEM8p4i7JTFtcmTF29YNGAyaRxB2t3So=
X-Received: by 2002:a9d:4cd:: with SMTP id 71mr25613579otm.188.1593027117794;
 Wed, 24 Jun 2020 12:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org> <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local> <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
In-Reply-To: <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 24 Jun 2020 21:31:46 +0200
Message-ID: <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown state
To:     Alex Deucher <alexdeucher@gmail.com>
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

On Wed, Jun 24, 2020 at 5:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> > > Hi Sam,
> > >
> > > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > > > The DRM CRTC helpers add default modes to connectors in the conne=
cted
> > > > > state if no mode can be retrieved from the connector. This behavi=
our is
> > > > > useful for VGA or DVI outputs that have no connected DDC bus. How=
ever,
> > > > > in such cases, the status of the output usually can't be retrieve=
d and
> > > > > is reported as connector_status_unknown.
> > > > >
> > > > > Extend the addition of default modes to connectors in an unknown =
state
> > > > > to support outputs that can retrieve neither the modes nor the
> > > > > connection status.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideason=
board.com>
> > > >
> > > > From your description sounds like an OK approach.
> > > > But this is not something I feel too familiar with.
> > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > >
> > > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on thi=
s
> > > too.
> >
> > Makes sense, and at least pre-coffee me can't immediately think of a
> > scenario where we're going to regret this. _unknown status is pretty mu=
ch
> > limited to old VGA and similar things where load detect somehow isn't w=
ell
> > supported by the hw.
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > >
> > > > > ---
> > > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm=
/drm_probe_helper.c
> > > > > index f5d141e0400f..9055d9573c90 100644
> > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(s=
truct drm_connector *connector,
> > > > >   if (count =3D=3D 0 && connector->status =3D=3D connector_status=
_connected)
> > > > >           count =3D drm_add_override_edid_modes(connector);
> > > > >
> > > > > - if (count =3D=3D 0 && connector->status =3D=3D connector_status=
_connected)
> > > > > + if (count =3D=3D 0 && (connector->status =3D=3D connector_statu=
s_connected ||
> > > > > +                    connector->status =3D=3D connector_status_un=
known))
> > > > >           count =3D drm_add_modes_noedid(connector, 1024, 768);
> > > > >   count +=3D drm_helper_probe_add_cmdline_mode(connector);
> > > > >   if (count =3D=3D 0)
> > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/d=
rm/drm_modeset_helper_vtables.h
> > > > > index 421a30f08463..afe55e2e93d2 100644
> > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > > >    * The usual way to implement this is to cache the EDID retriev=
ed in the
> > > > >    * probe callback somewhere in the driver-private connector str=
ucture.
> > > > >    * In this function drivers then parse the modes in the EDID an=
d add
> > > > > -  * them by calling drm_add_edid_modes(). But connectors that dr=
iver a
> > > > > +  * them by calling drm_add_edid_modes(). But connectors that dr=
ive a
> > > > >    * fixed panel can also manually add specific modes using
> > > > >    * drm_mode_probed_add(). Drivers which manually add modes shou=
ld also
> > > > >    * make sure that the &drm_connector.display_info,
> > > > >    * &drm_connector.width_mm and &drm_connector.height_mm fields =
are
> > > > >    * filled in.
> > > > >    *
> > > > > +  * Note that the caller function will automatically add standar=
d VESA
> > > > > +  * DMT modes up to 1024x768 if the .get_modes() helper operatio=
n returns
> > > > > +  * no mode and if the connector status is connector_status_conn=
ected or
> > > > > +  * connector_status_unknown. There is no need to call
> > > > > +  * drm_add_edid_modes() manually in that case.
> >
> > Hm calling drm_add_edid_modes if you have no edid is a bit a funny idea
> > ... Personally I'd just leave out the last sentence, I think that only
> > confuses readers. Or I'm not grasphing what you're trying to tell here.
>
> IIRC, some drivers used and desktop environments expected unknown
> rather than off for LVDS/eDP panels when the lid was shut or if the
> mux was switched to another device in the case of hybrid laptops.

We seem to have totally ditched that in

commit 05c72e77ccda89ff624108b1b59a0fc43843f343
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Date:   Tue Jul 17 20:42:14 2018 +0300

    drm/i915: Nuke the LVDS lid notifier

No screaming yet.

But I'm also a bit confused, for a panel there's generally an edid
around, or a fixed (list of) modes. That's enough to stop this
fallback from running, so should be all fine.
-Daniell

>
> Alex
>
>
> >
> > r-b with or without this change since imo super tiny nit.
> >
> > Cheers, Daniel
> >
> > > > > +  *
> > > > >    * Virtual drivers that just want some standard VESA mode with =
a given
> > > > >    * resolution can call drm_add_modes_noedid(), and mark the pre=
ferred
> > > > >    * one using drm_set_preferred_mode().
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
