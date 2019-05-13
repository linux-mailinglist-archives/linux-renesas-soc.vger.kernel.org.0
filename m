Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B05771B87E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 16:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbfEMOjg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 10:39:36 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:32814 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730163AbfEMOjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 10:39:35 -0400
Received: by mail-ua1-f67.google.com with SMTP id 49so4908297uas.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 May 2019 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DnW1ppP0H82gyNZ6Cs5glLtCZWk8cSFYexcibf0PW90=;
        b=P2f9emm7ovZb79Po9LG8ZHUhZDgE1L3ml3jPlkEgfcaV68Y/FlYjA4oFVUFkaqvtM4
         CEWraY4yb0udl/ubfpHA8zZDhRPtUUIe/bQlP3CeSBB4qRQbfaOxF+VTVJDAeq/2QqjK
         ICeftLm0eV5WRVGL5E2fAjePfGdWTcLnXdSh05r6NbJdtcZ4K0XIN5DF3u8UelSt8wDg
         jO8DYIQTNSAQncaP3KscBdKJzT+oSwLU7phfJfsD/REiFndiJT2KvTL++EWZtrGSDZoM
         9yHdJaXpNAv2HLuLKZEoqLjaOYyZeZAZPJIgkDXxsv55hLqvPef0TcHCt1Ec0m9D0Cco
         eFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DnW1ppP0H82gyNZ6Cs5glLtCZWk8cSFYexcibf0PW90=;
        b=Q+CCCfY3rO024NyBBHDLbnSnbVc1ZSLN5pTV9CHLjAj7PReFqXEyGRuJEDsYMkMNXq
         rifWzukczhvpBR/cvUTFFIyJG0nmZd8Dc1xuCwrFTm/sdjsoNR/ldhTpSRwALYtvfpMM
         tdsSqwIshwoySIL4dlzo8Vps5n0+SmbHRyUAmvgSk3HaWmCIsj03S5Qc0NiNoAcYek/k
         Ve0AfsHeG8pVpZRXF+jqzwQDAdW38hQW4US5jJZvdDX/2JW77pORjNaP3eLSIbjIM/Vc
         hZCU4LKDbKJJN4bfHBMYmt7TGyhih7nDqwqRfQLCcNRGuOaUuClTsbofvyx3hBkaQxzk
         sBww==
X-Gm-Message-State: APjAAAXBI7rgi+S/mln9bO9Azv2AD1VxaMSXUSy+cu0WxWTBklZ7qes5
        XfJo4w8jK7U3XY8GabkHhyvDD5DubqNq2dNmQrqgPw==
X-Google-Smtp-Source: APXvYqyJVF03wXGcXK5Zg+fSgdgjHUpQlGXlNBAQMcxL+WC5oHeAgiqtzNzT+nGNX3SA2f1cCbj6Gmv50IRIVZUGNEE=
X-Received: by 2002:ab0:2a4a:: with SMTP id p10mr5184294uar.90.1557758374091;
 Mon, 13 May 2019 07:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190502194956.218441-1-sean@poorly.run> <20190502194956.218441-5-sean@poorly.run>
 <20190511191202.GL13043@pendragon.ideasonboard.com>
In-Reply-To: <20190511191202.GL13043@pendragon.ideasonboard.com>
From:   Sean Paul <sean@poorly.run>
Date:   Mon, 13 May 2019 10:38:58 -0400
Message-ID: <CAMavQKKS5ek1cAZRZfx91TA_-gXBvuNfbvHDo_jetnSL9jmibw@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] drm: Convert connector_helper_funcs->atomic_check
 to accept drm_atomic_state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        nouveau <nouveau@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, May 11, 2019 at 3:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Sean,
>
> Thank you for the patch.
>

Hey Laurent,
Thanks for looking!


> On Thu, May 02, 2019 at 03:49:46PM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Everyone who implements connector_helper_funcs->atomic_check reaches
> > into the connector state to get the atomic state. Instead of continuing
> > this pattern, change the callback signature to just give atomic state
> > and let the driver determine what it does and does not need from it.
> >
> > Eventually all atomic functions should do this, but that's just too muc=
h
> > busy work for me.
>
> Given that drivers also access the connector state, isn't this slightly
> more inefficient ?
>

Inefficient in terms of what?

Agree that in isolation this patch might seem unnecessary, but it ties
in with the encoder and bridge CLs which accept drm_atomic_state in
their hooks. In general the idea is to convert all atomic functions to
take overall atomic state instead of just their object state. Reality
has proven to be more complicated and we need more access than what
the current implementation provides.

Sean

> > Changes in v3:
> > - Added to the set
> >
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c      |  4 ++--
> >  drivers/gpu/drm/i915/intel_atomic.c      |  8 +++++---
> >  drivers/gpu/drm/i915/intel_dp_mst.c      |  7 ++++---
> >  drivers/gpu/drm/i915/intel_drv.h         |  2 +-
> >  drivers/gpu/drm/i915/intel_sdvo.c        |  9 +++++----
> >  drivers/gpu/drm/i915/intel_tv.c          |  8 +++++---
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c  |  5 +++--
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c      | 12 +++++++-----
> >  drivers/gpu/drm/vc4/vc4_txp.c            |  7 ++++---
> >  include/drm/drm_modeset_helper_vtables.h |  2 +-
> >  10 files changed, 37 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 9d9e47276839..fa5a367507c1 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -683,7 +683,7 @@ drm_atomic_helper_check_modeset(struct drm_device *=
dev,
> >               }
> >
> >               if (funcs->atomic_check)
> > -                     ret =3D funcs->atomic_check(connector, new_connec=
tor_state);
> > +                     ret =3D funcs->atomic_check(connector, state);
> >               if (ret)
> >                       return ret;
> >
> > @@ -725,7 +725,7 @@ drm_atomic_helper_check_modeset(struct drm_device *=
dev,
> >                       continue;
> >
> >               if (funcs->atomic_check)
> > -                     ret =3D funcs->atomic_check(connector, new_connec=
tor_state);
> > +                     ret =3D funcs->atomic_check(connector, state);
> >               if (ret)
> >                       return ret;
> >       }
> > diff --git a/drivers/gpu/drm/i915/intel_atomic.c b/drivers/gpu/drm/i915=
/intel_atomic.c
> > index b844e8840c6f..e8a5b82e9242 100644
> > --- a/drivers/gpu/drm/i915/intel_atomic.c
> > +++ b/drivers/gpu/drm/i915/intel_atomic.c
> > @@ -103,12 +103,14 @@ int intel_digital_connector_atomic_set_property(s=
truct drm_connector *connector,
> >  }
> >
> >  int intel_digital_connector_atomic_check(struct drm_connector *conn,
> > -                                      struct drm_connector_state *new_=
state)
> > +                                      struct drm_atomic_state *state)
> >  {
> > +     struct drm_connector_state *new_state =3D
> > +             drm_atomic_get_new_connector_state(state, conn);
> >       struct intel_digital_connector_state *new_conn_state =3D
> >               to_intel_digital_connector_state(new_state);
> >       struct drm_connector_state *old_state =3D
> > -             drm_atomic_get_old_connector_state(new_state->state, conn=
);
> > +             drm_atomic_get_old_connector_state(state, conn);
> >       struct intel_digital_connector_state *old_conn_state =3D
> >               to_intel_digital_connector_state(old_state);
> >       struct drm_crtc_state *crtc_state;
> > @@ -118,7 +120,7 @@ int intel_digital_connector_atomic_check(struct drm=
_connector *conn,
> >       if (!new_state->crtc)
> >               return 0;
> >
> > -     crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state, ne=
w_state->crtc);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state->cr=
tc);
> >
> >       /*
> >        * These properties are handled by fastset, and might not end
> > diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915=
/intel_dp_mst.c
> > index 19d81cef2ab6..89cfec128ba0 100644
> > --- a/drivers/gpu/drm/i915/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/intel_dp_mst.c
> > @@ -143,9 +143,10 @@ static int intel_dp_mst_compute_config(struct inte=
l_encoder *encoder,
> >
> >  static int
> >  intel_dp_mst_atomic_check(struct drm_connector *connector,
> > -                       struct drm_connector_state *new_conn_state)
> > +                       struct drm_atomic_state *state)
> >  {
> > -     struct drm_atomic_state *state =3D new_conn_state->state;
> > +     struct drm_connector_state *new_conn_state =3D
> > +             drm_atomic_get_new_connector_state(state, connector);
> >       struct drm_connector_state *old_conn_state =3D
> >               drm_atomic_get_old_connector_state(state, connector);
> >       struct intel_connector *intel_connector =3D
> > @@ -155,7 +156,7 @@ intel_dp_mst_atomic_check(struct drm_connector *con=
nector,
> >       struct drm_dp_mst_topology_mgr *mgr;
> >       int ret;
> >
> > -     ret =3D intel_digital_connector_atomic_check(connector, new_conn_=
state);
> > +     ret =3D intel_digital_connector_atomic_check(connector, state);
> >       if (ret)
> >               return ret;
> >
> > diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/in=
tel_drv.h
> > index f8c7b291fdc3..88571b8e8d62 100644
> > --- a/drivers/gpu/drm/i915/intel_drv.h
> > +++ b/drivers/gpu/drm/i915/intel_drv.h
> > @@ -2481,7 +2481,7 @@ int intel_digital_connector_atomic_set_property(s=
truct drm_connector *connector,
> >                                               struct drm_property *prop=
erty,
> >                                               u64 val);
> >  int intel_digital_connector_atomic_check(struct drm_connector *conn,
> > -                                      struct drm_connector_state *new_=
state);
> > +                                      struct drm_atomic_state *state);
> >  struct drm_connector_state *
> >  intel_digital_connector_duplicate_state(struct drm_connector *connecto=
r);
> >
> > diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/i=
ntel_sdvo.c
> > index 68f497493d43..72ea164b971c 100644
> > --- a/drivers/gpu/drm/i915/intel_sdvo.c
> > +++ b/drivers/gpu/drm/i915/intel_sdvo.c
> > @@ -2342,9 +2342,10 @@ static const struct drm_connector_funcs intel_sd=
vo_connector_funcs =3D {
> >  };
> >
> >  static int intel_sdvo_atomic_check(struct drm_connector *conn,
> > -                                struct drm_connector_state *new_conn_s=
tate)
> > +                                struct drm_atomic_state *state)
> >  {
> > -     struct drm_atomic_state *state =3D new_conn_state->state;
> > +     struct drm_connector_state *new_conn_state =3D
> > +             drm_atomic_get_new_connector_state(state, conn);
> >       struct drm_connector_state *old_conn_state =3D
> >               drm_atomic_get_old_connector_state(state, conn);
> >       struct intel_sdvo_connector_state *old_state =3D
> > @@ -2356,13 +2357,13 @@ static int intel_sdvo_atomic_check(struct drm_c=
onnector *conn,
> >           (memcmp(&old_state->tv, &new_state->tv, sizeof(old_state->tv)=
) ||
> >            memcmp(&old_conn_state->tv, &new_conn_state->tv, sizeof(old_=
conn_state->tv)))) {
> >               struct drm_crtc_state *crtc_state =3D
> > -                     drm_atomic_get_new_crtc_state(new_conn_state->sta=
te,
> > +                     drm_atomic_get_new_crtc_state(state,
> >                                                     new_conn_state->crt=
c);
> >
> >               crtc_state->connectors_changed =3D true;
> >       }
> >
> > -     return intel_digital_connector_atomic_check(conn, new_conn_state)=
;
> > +     return intel_digital_connector_atomic_check(conn, state);
> >  }
> >
> >  static const struct drm_connector_helper_funcs intel_sdvo_connector_he=
lper_funcs =3D {
> > diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/int=
el_tv.c
> > index 3924c4944e1f..a41c5b467c14 100644
> > --- a/drivers/gpu/drm/i915/intel_tv.c
> > +++ b/drivers/gpu/drm/i915/intel_tv.c
> > @@ -1817,16 +1817,18 @@ static const struct drm_connector_funcs intel_t=
v_connector_funcs =3D {
> >  };
> >
> >  static int intel_tv_atomic_check(struct drm_connector *connector,
> > -                              struct drm_connector_state *new_state)
> > +                              struct drm_atomic_state *state)
> >  {
> > +     struct drm_connector_state *new_state;
> >       struct drm_crtc_state *new_crtc_state;
> >       struct drm_connector_state *old_state;
> >
> > +     new_state =3D drm_atomic_get_new_connector_state(state, connector=
);
> >       if (!new_state->crtc)
> >               return 0;
> >
> > -     old_state =3D drm_atomic_get_old_connector_state(new_state->state=
, connector);
> > -     new_crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state=
, new_state->crtc);
> > +     old_state =3D drm_atomic_get_old_connector_state(state, connector=
);
> > +     new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state=
->crtc);
> >
> >       if (old_state->tv.mode !=3D new_state->tv.mode ||
> >           old_state->tv.margins.left !=3D new_state->tv.margins.left ||
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/=
nouveau/dispnv50/disp.c
> > index 4b1650f51955..7ba373f493b2 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -948,11 +948,12 @@ nv50_mstc_get_modes(struct drm_connector *connect=
or)
> >
> >  static int
> >  nv50_mstc_atomic_check(struct drm_connector *connector,
> > -                    struct drm_connector_state *new_conn_state)
> > +                    struct drm_atomic_state *state)
> >  {
> > -     struct drm_atomic_state *state =3D new_conn_state->state;
> >       struct nv50_mstc *mstc =3D nv50_mstc(connector);
> >       struct drm_dp_mst_topology_mgr *mgr =3D &mstc->mstm->mgr;
> > +     struct drm_connector_state *new_conn_state =3D
> > +             drm_atomic_get_new_connector_state(state, connector);
> >       struct drm_connector_state *old_conn_state =3D
> >               drm_atomic_get_old_connector_state(state, connector);
> >       struct drm_crtc_state *crtc_state;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar=
-du/rcar_lvds.c
> > index 620b51aab291..5b81ba2a7f27 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -92,13 +92,15 @@ static int rcar_lvds_connector_get_modes(struct drm=
_connector *connector)
> >  }
> >
> >  static int rcar_lvds_connector_atomic_check(struct drm_connector *conn=
ector,
> > -                                         struct drm_connector_state *s=
tate)
> > +                                         struct drm_atomic_state *stat=
e)
> >  {
> >       struct rcar_lvds *lvds =3D connector_to_rcar_lvds(connector);
> >       const struct drm_display_mode *panel_mode;
> > +     struct drm_connector_state *conn_state;
> >       struct drm_crtc_state *crtc_state;
> >
> > -     if (!state->crtc)
> > +     conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     if (!conn_state->crtc)
> >               return 0;
> >
> >       if (list_empty(&connector->modes)) {
> > @@ -110,9 +112,9 @@ static int rcar_lvds_connector_atomic_check(struct =
drm_connector *connector,
> >                                     struct drm_display_mode, head);
> >
> >       /* We're not allowed to modify the resolution. */
> > -     crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crt=
c);
> > -     if (IS_ERR(crtc_state))
> > -             return PTR_ERR(crtc_state);
> > +     crtc_state =3D drm_atomic_get_crtc_state(state, conn_state->crtc)=
;
> > +     if (!crtc_state)
> > +             return -EINVAL;
> >
> >       if (crtc_state->mode.hdisplay !=3D panel_mode->hdisplay ||
> >           crtc_state->mode.vdisplay !=3D panel_mode->vdisplay)
> > diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_tx=
p.c
> > index c8b89a78f9f4..96f91c1b4b6e 100644
> > --- a/drivers/gpu/drm/vc4/vc4_txp.c
> > +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> > @@ -221,17 +221,18 @@ static const u32 txp_fmts[] =3D {
> >  };
> >
> >  static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
> > -                                     struct drm_connector_state *conn_=
state)
> > +                                       struct drm_atomic_state *state)
> >  {
> > +     struct drm_connector_state *conn_state;
> >       struct drm_crtc_state *crtc_state;
> >       struct drm_framebuffer *fb;
> >       int i;
> >
> > +     conn_state =3D drm_atomic_get_new_connector_state(state, conn);
> >       if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> >               return 0;
> >
> > -     crtc_state =3D drm_atomic_get_new_crtc_state(conn_state->state,
> > -                                                conn_state->crtc);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> >
> >       fb =3D conn_state->writeback_job->fb;
> >       if (fb->width !=3D crtc_state->mode.hdisplay ||
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> > index de57fb40cb6e..adc8b7cf64b5 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -1020,7 +1020,7 @@ struct drm_connector_helper_funcs {
> >        * deadlock.
> >        */
> >       int (*atomic_check)(struct drm_connector *connector,
> > -                         struct drm_connector_state *state);
> > +                         struct drm_atomic_state *state);
> >
> >       /**
> >        * @atomic_commit:
>
> --
> Regards,
>
> Laurent Pinchart
