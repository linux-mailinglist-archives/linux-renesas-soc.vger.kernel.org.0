Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A21209ADB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 09:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390404AbgFYH56 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 03:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390224AbgFYH55 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 03:57:57 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9079C061573
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 00:57:56 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id w10so705001oih.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 00:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fh/QRjqSh/AIDMMLAmkoRED38mfRi1Trge0R0zfKw/M=;
        b=LV1WaJNiVNdQ+ZXGBrJGl3wqXVPK4n4btT7GoYkFpVmj9kSK/OhHJww9VkLgnLSNtt
         pJHu+CdN2k/fC0iyDlOVjGMuxSg/t1Ms22PN9L1ng/LsCLOxh1N6FYQm60u3+maRWMpe
         LeEjh2+U8c5xr2CMl+sYuJTa3jBjLW17daew0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fh/QRjqSh/AIDMMLAmkoRED38mfRi1Trge0R0zfKw/M=;
        b=alnVKJaofdgq8bzKcNf1w6FmYGK4uLB4c4uUCbEEZ2m2rHF14hh4RCFFnwfOm3brkZ
         Ev27fhmMhJlnYRIUEs/o4Esr6jjfho7IKBDlyTDtgeHnnuK8NH9Y3juBNM3QVwiKv6+B
         Tnmmw0laOAJJILjfvdOquaEPavmbJXN8jM2rHhFLTJHtXzj6w7dh+7zCQCti/R/VOJKt
         3a/MRKan2DyjEk4WrYIIdVCN6g1Q+AYPFbmAGzZlyqt7hNrxaVEitFBjo51oCTr0uxe5
         deYTKaXdgWsJDG2eHFxiVPr21lYpfmy8800uTk4UAJLPgoY2evzHg7/ZbIi+RBRpsjhL
         Vv2Q==
X-Gm-Message-State: AOAM533jnttpDOVirMqzoqPQ4vWsAlEjy0Jyvpou02F3RrnWdC/uteA8
        lDwe1WRrGG8AoTpgiE9l1+/q48gOFcQvEDT+bZBlrw==
X-Google-Smtp-Source: ABdhPJwEv3DXO9ri4ndtxq/m8jGfBTohFNb1JASUBsnpbvWcQYw40zkUC+gD3dpeq40EXYMwLJp28xHHKayi/HSzfbU=
X-Received: by 2002:aca:bc06:: with SMTP id m6mr1121257oif.101.1593071875840;
 Thu, 25 Jun 2020 00:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org> <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local> <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com> <20200625075655.GC3278063@phenom.ffwll.local>
In-Reply-To: <20200625075655.GC3278063@phenom.ffwll.local>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 25 Jun 2020 09:57:44 +0200
Message-ID: <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown state
To:     Alex Deucher <alexdeucher@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Pekka Paalanen <ppaalanen@gmail.com>
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

On Thu, Jun 25, 2020 at 9:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 24, 2020 at 03:40:42PM -0400, Alex Deucher wrote:
> > On Wed, Jun 24, 2020 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Jun 24, 2020 at 5:24 PM Alex Deucher <alexdeucher@gmail.com> =
wrote:
> > > >
> > > > On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > >
> > > > > On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> > > > > > Hi Sam,
> > > > > >
> > > > > > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > > > > > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wr=
ote:
> > > > > > > > The DRM CRTC helpers add default modes to connectors in the=
 connected
> > > > > > > > state if no mode can be retrieved from the connector. This =
behaviour is
> > > > > > > > useful for VGA or DVI outputs that have no connected DDC bu=
s. However,
> > > > > > > > in such cases, the status of the output usually can't be re=
trieved and
> > > > > > > > is reported as connector_status_unknown.
> > > > > > > >
> > > > > > > > Extend the addition of default modes to connectors in an un=
known state
> > > > > > > > to support outputs that can retrieve neither the modes nor =
the
> > > > > > > > connection status.
> > > > > > > >
> > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@i=
deasonboard.com>
> > > > > > >
> > > > > > > From your description sounds like an OK approach.
> > > > > > > But this is not something I feel too familiar with.
> > > > > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > > > >
> > > > > > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback =
on this
> > > > > > too.
> > > > >
> > > > > Makes sense, and at least pre-coffee me can't immediately think o=
f a
> > > > > scenario where we're going to regret this. _unknown status is pre=
tty much
> > > > > limited to old VGA and similar things where load detect somehow i=
sn't well
> > > > > supported by the hw.
> > > > >
> > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > >
> > > > > >
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > > > > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > > > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/g=
pu/drm/drm_probe_helper.c
> > > > > > > > index f5d141e0400f..9055d9573c90 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_m=
odes(struct drm_connector *connector,
> > > > > > > >   if (count =3D=3D 0 && connector->status =3D=3D connector_=
status_connected)
> > > > > > > >           count =3D drm_add_override_edid_modes(connector);
> > > > > > > >
> > > > > > > > - if (count =3D=3D 0 && connector->status =3D=3D connector_=
status_connected)
> > > > > > > > + if (count =3D=3D 0 && (connector->status =3D=3D connector=
_status_connected ||
> > > > > > > > +                    connector->status =3D=3D connector_sta=
tus_unknown))
> > > > > > > >           count =3D drm_add_modes_noedid(connector, 1024, 7=
68);
> > > > > > > >   count +=3D drm_helper_probe_add_cmdline_mode(connector);
> > > > > > > >   if (count =3D=3D 0)
> > > > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/inc=
lude/drm/drm_modeset_helper_vtables.h
> > > > > > > > index 421a30f08463..afe55e2e93d2 100644
> > > > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > > > > > >    * The usual way to implement this is to cache the EDID r=
etrieved in the
> > > > > > > >    * probe callback somewhere in the driver-private connect=
or structure.
> > > > > > > >    * In this function drivers then parse the modes in the E=
DID and add
> > > > > > > > -  * them by calling drm_add_edid_modes(). But connectors t=
hat driver a
> > > > > > > > +  * them by calling drm_add_edid_modes(). But connectors t=
hat drive a
> > > > > > > >    * fixed panel can also manually add specific modes using
> > > > > > > >    * drm_mode_probed_add(). Drivers which manually add mode=
s should also
> > > > > > > >    * make sure that the &drm_connector.display_info,
> > > > > > > >    * &drm_connector.width_mm and &drm_connector.height_mm f=
ields are
> > > > > > > >    * filled in.
> > > > > > > >    *
> > > > > > > > +  * Note that the caller function will automatically add s=
tandard VESA
> > > > > > > > +  * DMT modes up to 1024x768 if the .get_modes() helper op=
eration returns
> > > > > > > > +  * no mode and if the connector status is connector_statu=
s_connected or
> > > > > > > > +  * connector_status_unknown. There is no need to call
> > > > > > > > +  * drm_add_edid_modes() manually in that case.
> > > > >
> > > > > Hm calling drm_add_edid_modes if you have no edid is a bit a funn=
y idea
> > > > > ... Personally I'd just leave out the last sentence, I think that=
 only
> > > > > confuses readers. Or I'm not grasphing what you're trying to tell=
 here.
> > > >
> > > > IIRC, some drivers used and desktop environments expected unknown
> > > > rather than off for LVDS/eDP panels when the lid was shut or if the
> > > > mux was switched to another device in the case of hybrid laptops.
> > >
> > > We seem to have totally ditched that in
> > >
> > > commit 05c72e77ccda89ff624108b1b59a0fc43843f343
> > > Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Date:   Tue Jul 17 20:42:14 2018 +0300
> > >
> > >     drm/i915: Nuke the LVDS lid notifier
> > >
> > > No screaming yet.
> > >
> > > But I'm also a bit confused, for a panel there's generally an edid
> > > around, or a fixed (list of) modes. That's enough to stop this
> > > fallback from running, so should be all fine.
> >
> > No, you are right; you will have the EDID so this shouldn't be an
> > issue.  I was mis-remembering the original issue.  We originally
> > always reported connected for LVDS in radeon if the panel was present,
> > but then we got flack because some userspace expected unknown in
> > certain cases (e.g., lid or muxed displays).  Either way the EDID info
> > is still there.
>
> Yeah I think i915 started that habit, but I guess people realized it's
> unreliable enough that they should have their own lid handler in the
> desktop enviromnent doing whatever they want to do on lid close.
>
> Should we perhaps document that somewhere, that panels are always marked
> as connected? Not even sure where to put that in the docs ...
>
> Maybe adding a few of the usual suspects from the compositor side, Simon,
> Pekka?

Actually adding Simon and Pekka this time around ...

> -Daniel
>
> >
> > Alex
> >
> >
> > > -Daniell
> > >
> > > >
> > > > Alex
> > > >
> > > >
> > > > >
> > > > > r-b with or without this change since imo super tiny nit.
> > > > >
> > > > > Cheers, Daniel
> > > > >
> > > > > > > > +  *
> > > > > > > >    * Virtual drivers that just want some standard VESA mode=
 with a given
> > > > > > > >    * resolution can call drm_add_modes_noedid(), and mark t=
he preferred
> > > > > > > >    * one using drm_set_preferred_mode().
> > > > > >
> > > > > > --
> > > > > > Regards,
> > > > > >
> > > > > > Laurent Pinchart
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
