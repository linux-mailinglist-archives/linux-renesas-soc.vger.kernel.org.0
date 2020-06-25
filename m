Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F335209D02
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 12:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404000AbgFYKou (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 06:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403997AbgFYKou (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 06:44:50 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78A7C061573
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 03:44:48 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id l63so4510549oih.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WpyDZDv0VZa6G1CZkLbWwVx9TEcB23chx8xye5GG6IQ=;
        b=TdrtuzgxLziRkx0FvmJ1ROKweF0BgOTdzbhnsuwPPXZeCgGloIwFlMX8U4ZV74xQjp
         nw7GZMzjdsF7S0lAgOu9CeAwzPg1PbHEZaqeIlxxMRvxkrzrldYMGNdB2pg+Ocg4ISbs
         11ZBCSvB9mBH36dZnI4O30qmQ93Ll/msOqgfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WpyDZDv0VZa6G1CZkLbWwVx9TEcB23chx8xye5GG6IQ=;
        b=M/g9b0rEdFjnh3qMYZ6fCOb6W7KTO6m9sXpCQJyDFFt3l/0omHFHuTH4FIVAWD0IAI
         xG9gmSo48KAm3yLuxmQnzoIkBSTcosCZRjrPUSm6YbnpxaEqN0SMRJx7RxO1ZM9yc5jz
         lHSysF8tuJhQg1cqm6XXJYOud76RQcfsk016YjaYtmAERPdAFJgqPl5zMQqmpodkrJo7
         qFfdQkWwqX6kgJvzolwl7w+6vUGF1CAfavGKZUXoF74kI5DtCsadjjDY7LwkHKKF0Qzm
         hUcKsMnd9CvHB78JK3BCbufRdgFw9Vl1AWOZSUibLK5faqPzbjSFfXFGtkrNowtKWbLs
         coag==
X-Gm-Message-State: AOAM531ka4GPKywywRWjLHAuSp4KjT04ezQahwBLSk5jESC3jac/dPj3
        kbX4PisJiswWsiuHn++RVHiaCP3j8wPwVCbaAGQlnA==
X-Google-Smtp-Source: ABdhPJxqYn5tV7KhPOHvXEuIrgMLjhgULxaBg9P8R9GpT6nYIdfkVhlb7wRnK9PgSbmG6RppnxWJUHbojNMNlk/VbYY=
X-Received: by 2002:aca:dc82:: with SMTP id t124mr1674852oig.14.1593081887835;
 Thu, 25 Jun 2020 03:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org> <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local> <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
 <20200625075655.GC3278063@phenom.ffwll.local> <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
 <20200625133157.0e749602@eldfell>
In-Reply-To: <20200625133157.0e749602@eldfell>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 25 Jun 2020 12:44:36 +0200
Message-ID: <CAKMK7uGF_t+zW4tyO42HN2BbV1j6fVFfVHF8Xph10bAygdsXPQ@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown state
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Simon Ser <contact@emersion.fr>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 25, 2020 at 12:32 PM Pekka Paalanen <ppaalanen@gmail.com> wrote=
:
>
> On Thu, 25 Jun 2020 09:57:44 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Thu, Jun 25, 2020 at 9:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Jun 24, 2020 at 03:40:42PM -0400, Alex Deucher wrote:
> > > > On Wed, Jun 24, 2020 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > >
> > > > > On Wed, Jun 24, 2020 at 5:24 PM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> > > > > >
> > > > > > On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > > > > >
> > > > > > > On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wr=
ote:
> > > > > > > > Hi Sam,
> > > > > > > >
> > > > > > > > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrot=
e:
> > > > > > > > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchar=
t wrote:
> > > > > > > > > > The DRM CRTC helpers add default modes to connectors in=
 the connected
> > > > > > > > > > state if no mode can be retrieved from the connector. T=
his behaviour is
> > > > > > > > > > useful for VGA or DVI outputs that have no connected DD=
C bus. However,
> > > > > > > > > > in such cases, the status of the output usually can't b=
e retrieved and
> > > > > > > > > > is reported as connector_status_unknown.
> > > > > > > > > >
> > > > > > > > > > Extend the addition of default modes to connectors in a=
n unknown state
> > > > > > > > > > to support outputs that can retrieve neither the modes =
nor the
> > > > > > > > > > connection status.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renes=
as@ideasonboard.com>
> > > > > > > > >
> > > > > > > > > From your description sounds like an OK approach.
> > > > > > > > > But this is not something I feel too familiar with.
> > > > > > > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > > > > > >
> > > > > > > > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedb=
ack on this
> > > > > > > > too.
> > > > > > >
> > > > > > > Makes sense, and at least pre-coffee me can't immediately thi=
nk of a
> > > > > > > scenario where we're going to regret this. _unknown status is=
 pretty much
> > > > > > > limited to old VGA and similar things where load detect someh=
ow isn't well
> > > > > > > supported by the hw.
> > > > > > >
> > > > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > > >
> > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > > > > > > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > > > > > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drive=
rs/gpu/drm/drm_probe_helper.c
> > > > > > > > > > index f5d141e0400f..9055d9573c90 100644
> > > > > > > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connect=
or_modes(struct drm_connector *connector,
> > > > > > > > > >   if (count =3D=3D 0 && connector->status =3D=3D connec=
tor_status_connected)
> > > > > > > > > >           count =3D drm_add_override_edid_modes(connect=
or);
> > > > > > > > > >
> > > > > > > > > > - if (count =3D=3D 0 && connector->status =3D=3D connec=
tor_status_connected)
> > > > > > > > > > + if (count =3D=3D 0 && (connector->status =3D=3D conne=
ctor_status_connected ||
> > > > > > > > > > +                    connector->status =3D=3D connector=
_status_unknown))
> > > > > > > > > >           count =3D drm_add_modes_noedid(connector, 102=
4, 768);
> > > > > > > > > >   count +=3D drm_helper_probe_add_cmdline_mode(connecto=
r);
> > > > > > > > > >   if (count =3D=3D 0)
> > > > > > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b=
/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > > > index 421a30f08463..afe55e2e93d2 100644
> > > > > > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs=
 {
> > > > > > > > > >    * The usual way to implement this is to cache the ED=
ID retrieved in the
> > > > > > > > > >    * probe callback somewhere in the driver-private con=
nector structure.
> > > > > > > > > >    * In this function drivers then parse the modes in t=
he EDID and add
> > > > > > > > > > -  * them by calling drm_add_edid_modes(). But connecto=
rs that driver a
> > > > > > > > > > +  * them by calling drm_add_edid_modes(). But connecto=
rs that drive a
> > > > > > > > > >    * fixed panel can also manually add specific modes u=
sing
> > > > > > > > > >    * drm_mode_probed_add(). Drivers which manually add =
modes should also
> > > > > > > > > >    * make sure that the &drm_connector.display_info,
> > > > > > > > > >    * &drm_connector.width_mm and &drm_connector.height_=
mm fields are
> > > > > > > > > >    * filled in.
> > > > > > > > > >    *
> > > > > > > > > > +  * Note that the caller function will automatically a=
dd standard VESA
> > > > > > > > > > +  * DMT modes up to 1024x768 if the .get_modes() helpe=
r operation returns
> > > > > > > > > > +  * no mode and if the connector status is connector_s=
tatus_connected or
> > > > > > > > > > +  * connector_status_unknown. There is no need to call
> > > > > > > > > > +  * drm_add_edid_modes() manually in that case.
> > > > > > >
> > > > > > > Hm calling drm_add_edid_modes if you have no edid is a bit a =
funny idea
> > > > > > > ... Personally I'd just leave out the last sentence, I think =
that only
> > > > > > > confuses readers. Or I'm not grasphing what you're trying to =
tell here.
> > > > > >
> > > > > > IIRC, some drivers used and desktop environments expected unkno=
wn
> > > > > > rather than off for LVDS/eDP panels when the lid was shut or if=
 the
> > > > > > mux was switched to another device in the case of hybrid laptop=
s.
> > > > >
> > > > > We seem to have totally ditched that in
> > > > >
> > > > > commit 05c72e77ccda89ff624108b1b59a0fc43843f343
> > > > > Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > Date:   Tue Jul 17 20:42:14 2018 +0300
> > > > >
> > > > >     drm/i915: Nuke the LVDS lid notifier
> > > > >
> > > > > No screaming yet.
> > > > >
> > > > > But I'm also a bit confused, for a panel there's generally an edi=
d
> > > > > around, or a fixed (list of) modes. That's enough to stop this
> > > > > fallback from running, so should be all fine.
> > > >
> > > > No, you are right; you will have the EDID so this shouldn't be an
> > > > issue.  I was mis-remembering the original issue.  We originally
> > > > always reported connected for LVDS in radeon if the panel was prese=
nt,
> > > > but then we got flack because some userspace expected unknown in
> > > > certain cases (e.g., lid or muxed displays).  Either way the EDID i=
nfo
> > > > is still there.
> > >
> > > Yeah I think i915 started that habit, but I guess people realized it'=
s
> > > unreliable enough that they should have their own lid handler in the
> > > desktop enviromnent doing whatever they want to do on lid close.
> > >
> > > Should we perhaps document that somewhere, that panels are always mar=
ked
> > > as connected? Not even sure where to put that in the docs ...
> > >
> > > Maybe adding a few of the usual suspects from the compositor side, Si=
mon,
> > > Pekka?
> >
> > Actually adding Simon and Pekka this time around ...
>
> I don't know what anyone else does, but Weston (is not a DE) does not
> look at any lid switch, and assumes that if connector status is not
> DRM_MODE_CONNECTED, then it is disconnected. So, if a driver switched
> to "Unknown" status, it would be taken as disconnected.

Maybe an aside, but the guideline is for autoconfiguration:
- Light up everything that has connector status connected.
- If nothing has that status, try to light up the connectors with
status "unknown".

This is only really relevant on older platforms, mostly for VGA and
somewhat for dvi outputs.

Maybe another thing we should put down somewhere in the uapi docs ...
-Daniel


>
> I never knew what "Unknown" was relevant for. In weston.ini you can
> also force a connector on, so users could drive it regardless.
>
> However, I would also say that Weston is not supposed to react to any
> lid action exactly because it does not watch the lid switch. Personally
> I would expect a built-in screen to stay on even if lid closed.
>
> Panels that are always connected showing up as always connected, sounds
> good to me.
>
>
> Thanks,
> pq



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
