Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE00B206A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 14:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfEPMHu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 08:07:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39269 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfEPMHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 08:07:47 -0400
Received: by mail-ot1-f65.google.com with SMTP id r7so3172366otn.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 May 2019 05:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=chWuWhxCu84wqF3PCIIbp41JGY5cAhGUqrF6XPXP8h8=;
        b=Hc2VV3CItKDKYQtGVpsdk7OgP1YClvZ2ZimBGU8wRAq2TqZ1+kKStCy+CFM1cAhroZ
         79Tnt26H3cg09r9rSGtarNGyMOZON/xNxyUPr2NgMAILuSdpz/8h2ed0Xo34XquLyowK
         KRuOyD6ZkiknuBs5JCyFpfVSJQJKn7VjPBoKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=chWuWhxCu84wqF3PCIIbp41JGY5cAhGUqrF6XPXP8h8=;
        b=SVQJ+bBq9cqvxfrYeQli6fxLRwFtj5vFJMYTjlmoWOjDeG23uVOuE09WqJ3jGfdSxI
         xoqbHB4wygrMCGgSmU7zLY+C2nmquNx+RSOVky21RdvHmd+R43f5UX+0y//4874C1gOj
         WDlmgNhQdelAVWIW4qLGBUBjkt0EL6NSHWBk+kn4b9/yYC0+4Na7KIMuoQ0vOYYVdOc/
         xUOXSJOyNSa1W2lY2pvWsFvHGdmnZGd0S5PtFT8krqMLXA43fM62QGXCcC9pbp3TcSPE
         K7OqngSmqdT2LyVRUuYwmXrbVelxAuznWaBiWytwQSj8FFRNMAG8r7srlG87XC1AFqZf
         JIaQ==
X-Gm-Message-State: APjAAAXBYBkRJcPMOF6bznS4ia7LL22x1NtdYuXq902A5p7QK+Tudi5m
        ohF2ZwTxvmOPu9iQX01aivXIBicPoy/zvGKV4uP8zQ==
X-Google-Smtp-Source: APXvYqyHt7SBsXu0c0RLc1JoJRtn0W5K5ux7IsVSDBY9Z1mGHGaURpEk25PbovpeXxX+zx6947nWVSE2BuiSeOha9u4=
X-Received: by 2002:a9d:5a02:: with SMTP id v2mr29523791oth.70.1558008466377;
 Thu, 16 May 2019 05:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190502194956.218441-1-sean@poorly.run> <20190502194956.218441-5-sean@poorly.run>
 <20190511191202.GL13043@pendragon.ideasonboard.com> <20190513144747.GR17751@phenom.ffwll.local>
 <20190516120221.GI14820@pendragon.ideasonboard.com>
In-Reply-To: <20190516120221.GI14820@pendragon.ideasonboard.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 16 May 2019 14:07:34 +0200
Message-ID: <CAKMK7uG_TmzZBgVkJ+j9C53KRp1OgswYuxpFV77+eU6BPWwGgw@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] drm: Convert connector_helper_funcs->atomic_check
 to accept drm_atomic_state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 16, 2019 at 2:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Mon, May 13, 2019 at 04:47:47PM +0200, Daniel Vetter wrote:
> > On Sat, May 11, 2019 at 10:12:02PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 02, 2019 at 03:49:46PM -0400, Sean Paul wrote:
> > >> From: Sean Paul <seanpaul@chromium.org>
> > >>
> > >> Everyone who implements connector_helper_funcs->atomic_check reaches
> > >> into the connector state to get the atomic state. Instead of continu=
ing
> > >> this pattern, change the callback signature to just give atomic stat=
e
> > >> and let the driver determine what it does and does not need from it.
> > >>
> > >> Eventually all atomic functions should do this, but that's just too =
much
> > >> busy work for me.
> > >
> > > Given that drivers also access the connector state, isn't this slight=
ly
> > > more inefficient ?
> >
> > It's atomic code, we're trying to optimize for clean code at the expens=
e
> > of a bit of runtime overhead due to more pointer chasing. And I agree w=
ith
> > the general push, the pile of old/new_state pointers of various objects
> > we're passing around is confusing. Passing the overall drm_atomic_state
> > seems much more reasonable, and with that we can get everything else. P=
lus
> > it's much more obvious whether you have the old/new state (since that's
> > explicit when you look it up from the drm_atomic_state).
>
> Yes, I agree it's cleaner. I just hope the atomic state tracking cost
> can be kept under control :-)
>
> By the way, this is likely not going to happen as it would be way too
> intrusive, but it would be nice to rename drm_atomic_state to
> drm_atomic_transaction (or something similar). It doesn't model a state,
> but a change between an old state to a new state. This confused me in
> the past, and I'm sure it can still be confusing to newcomers.

Why are you the first to suggest this, this is awesome!
drm_atomic_state is indeed not a state, but a transaction representing
how we go from the old to the new state.

I think this is awesome enough that we should actually try to make it
happen. Tree-wide cocci + bribing Dave on St. Patrick's day with lots
of beer might be enough :-)
-Daniel

> > If we ever see this show up in profile, and it starts mattering, first
> > thing we need is a hashtable I think (atm it's list walking, which is j=
ust
> > terrible). But thus far no one cares.
> >
> > >> Changes in v3:
> > >> - Added to the set
> > >>
> > >> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >> Cc: Ben Skeggs <bskeggs@redhat.com>
> > >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >> Cc: Eric Anholt <eric@anholt.net>
> > >> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > >> ---
> > >>  drivers/gpu/drm/drm_atomic_helper.c      |  4 ++--
> > >>  drivers/gpu/drm/i915/intel_atomic.c      |  8 +++++---
> > >>  drivers/gpu/drm/i915/intel_dp_mst.c      |  7 ++++---
> > >>  drivers/gpu/drm/i915/intel_drv.h         |  2 +-
> > >>  drivers/gpu/drm/i915/intel_sdvo.c        |  9 +++++----
> > >>  drivers/gpu/drm/i915/intel_tv.c          |  8 +++++---
> > >>  drivers/gpu/drm/nouveau/dispnv50/disp.c  |  5 +++--
> > >>  drivers/gpu/drm/rcar-du/rcar_lvds.c      | 12 +++++++-----
> > >>  drivers/gpu/drm/vc4/vc4_txp.c            |  7 ++++---
> > >>  include/drm/drm_modeset_helper_vtables.h |  2 +-
> > >>  10 files changed, 37 insertions(+), 27 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/d=
rm_atomic_helper.c
> > >> index 9d9e47276839..fa5a367507c1 100644
> > >> --- a/drivers/gpu/drm/drm_atomic_helper.c
> > >> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > >> @@ -683,7 +683,7 @@ drm_atomic_helper_check_modeset(struct drm_devic=
e *dev,
> > >>            }
> > >>
> > >>            if (funcs->atomic_check)
> > >> -                  ret =3D funcs->atomic_check(connector, new_connec=
tor_state);
> > >> +                  ret =3D funcs->atomic_check(connector, state);
> > >>            if (ret)
> > >>                    return ret;
> > >>
> > >> @@ -725,7 +725,7 @@ drm_atomic_helper_check_modeset(struct drm_devic=
e *dev,
> > >>                    continue;
> > >>
> > >>            if (funcs->atomic_check)
> > >> -                  ret =3D funcs->atomic_check(connector, new_connec=
tor_state);
> > >> +                  ret =3D funcs->atomic_check(connector, state);
> > >>            if (ret)
> > >>                    return ret;
> > >>    }
> > >> diff --git a/drivers/gpu/drm/i915/intel_atomic.c b/drivers/gpu/drm/i=
915/intel_atomic.c
> > >> index b844e8840c6f..e8a5b82e9242 100644
> > >> --- a/drivers/gpu/drm/i915/intel_atomic.c
> > >> +++ b/drivers/gpu/drm/i915/intel_atomic.c
> > >> @@ -103,12 +103,14 @@ int intel_digital_connector_atomic_set_propert=
y(struct drm_connector *connector,
> > >>  }
> > >>
> > >>  int intel_digital_connector_atomic_check(struct drm_connector *conn=
,
> > >> -                                   struct drm_connector_state *new_=
state)
> > >> +                                   struct drm_atomic_state *state)
> > >>  {
> > >> +  struct drm_connector_state *new_state =3D
> > >> +          drm_atomic_get_new_connector_state(state, conn);
> > >>    struct intel_digital_connector_state *new_conn_state =3D
> > >>            to_intel_digital_connector_state(new_state);
> > >>    struct drm_connector_state *old_state =3D
> > >> -          drm_atomic_get_old_connector_state(new_state->state, conn=
);
> > >> +          drm_atomic_get_old_connector_state(state, conn);
> > >>    struct intel_digital_connector_state *old_conn_state =3D
> > >>            to_intel_digital_connector_state(old_state);
> > >>    struct drm_crtc_state *crtc_state;
> > >> @@ -118,7 +120,7 @@ int intel_digital_connector_atomic_check(struct =
drm_connector *conn,
> > >>    if (!new_state->crtc)
> > >>            return 0;
> > >>
> > >> -  crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state, ne=
w_state->crtc);
> > >> +  crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state->cr=
tc);
> > >>
> > >>    /*
> > >>     * These properties are handled by fastset, and might not end
> > >> diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i=
915/intel_dp_mst.c
> > >> index 19d81cef2ab6..89cfec128ba0 100644
> > >> --- a/drivers/gpu/drm/i915/intel_dp_mst.c
> > >> +++ b/drivers/gpu/drm/i915/intel_dp_mst.c
> > >> @@ -143,9 +143,10 @@ static int intel_dp_mst_compute_config(struct i=
ntel_encoder *encoder,
> > >>
> > >>  static int
> > >>  intel_dp_mst_atomic_check(struct drm_connector *connector,
> > >> -                    struct drm_connector_state *new_conn_state)
> > >> +                    struct drm_atomic_state *state)
> > >>  {
> > >> -  struct drm_atomic_state *state =3D new_conn_state->state;
> > >> +  struct drm_connector_state *new_conn_state =3D
> > >> +          drm_atomic_get_new_connector_state(state, connector);
> > >>    struct drm_connector_state *old_conn_state =3D
> > >>            drm_atomic_get_old_connector_state(state, connector);
> > >>    struct intel_connector *intel_connector =3D
> > >> @@ -155,7 +156,7 @@ intel_dp_mst_atomic_check(struct drm_connector *=
connector,
> > >>    struct drm_dp_mst_topology_mgr *mgr;
> > >>    int ret;
> > >>
> > >> -  ret =3D intel_digital_connector_atomic_check(connector, new_conn_=
state);
> > >> +  ret =3D intel_digital_connector_atomic_check(connector, state);
> > >>    if (ret)
> > >>            return ret;
> > >>
> > >> diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915=
/intel_drv.h
> > >> index f8c7b291fdc3..88571b8e8d62 100644
> > >> --- a/drivers/gpu/drm/i915/intel_drv.h
> > >> +++ b/drivers/gpu/drm/i915/intel_drv.h
> > >> @@ -2481,7 +2481,7 @@ int intel_digital_connector_atomic_set_propert=
y(struct drm_connector *connector,
> > >>                                            struct drm_property *prop=
erty,
> > >>                                            u64 val);
> > >>  int intel_digital_connector_atomic_check(struct drm_connector *conn=
,
> > >> -                                   struct drm_connector_state *new_=
state);
> > >> +                                   struct drm_atomic_state *state);
> > >>  struct drm_connector_state *
> > >>  intel_digital_connector_duplicate_state(struct drm_connector *conne=
ctor);
> > >>
> > >> diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i91=
5/intel_sdvo.c
> > >> index 68f497493d43..72ea164b971c 100644
> > >> --- a/drivers/gpu/drm/i915/intel_sdvo.c
> > >> +++ b/drivers/gpu/drm/i915/intel_sdvo.c
> > >> @@ -2342,9 +2342,10 @@ static const struct drm_connector_funcs intel=
_sdvo_connector_funcs =3D {
> > >>  };
> > >>
> > >>  static int intel_sdvo_atomic_check(struct drm_connector *conn,
> > >> -                             struct drm_connector_state *new_conn_s=
tate)
> > >> +                             struct drm_atomic_state *state)
> > >>  {
> > >> -  struct drm_atomic_state *state =3D new_conn_state->state;
> > >> +  struct drm_connector_state *new_conn_state =3D
> > >> +          drm_atomic_get_new_connector_state(state, conn);
> > >>    struct drm_connector_state *old_conn_state =3D
> > >>            drm_atomic_get_old_connector_state(state, conn);
> > >>    struct intel_sdvo_connector_state *old_state =3D
> > >> @@ -2356,13 +2357,13 @@ static int intel_sdvo_atomic_check(struct dr=
m_connector *conn,
> > >>        (memcmp(&old_state->tv, &new_state->tv, sizeof(old_state->tv)=
) ||
> > >>         memcmp(&old_conn_state->tv, &new_conn_state->tv, sizeof(old_=
conn_state->tv)))) {
> > >>            struct drm_crtc_state *crtc_state =3D
> > >> -                  drm_atomic_get_new_crtc_state(new_conn_state->sta=
te,
> > >> +                  drm_atomic_get_new_crtc_state(state,
> > >>                                                  new_conn_state->crt=
c);
> > >>
> > >>            crtc_state->connectors_changed =3D true;
> > >>    }
> > >>
> > >> -  return intel_digital_connector_atomic_check(conn, new_conn_state)=
;
> > >> +  return intel_digital_connector_atomic_check(conn, state);
> > >>  }
> > >>
> > >>  static const struct drm_connector_helper_funcs intel_sdvo_connector=
_helper_funcs =3D {
> > >> diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/=
intel_tv.c
> > >> index 3924c4944e1f..a41c5b467c14 100644
> > >> --- a/drivers/gpu/drm/i915/intel_tv.c
> > >> +++ b/drivers/gpu/drm/i915/intel_tv.c
> > >> @@ -1817,16 +1817,18 @@ static const struct drm_connector_funcs inte=
l_tv_connector_funcs =3D {
> > >>  };
> > >>
> > >>  static int intel_tv_atomic_check(struct drm_connector *connector,
> > >> -                           struct drm_connector_state *new_state)
> > >> +                           struct drm_atomic_state *state)
> > >>  {
> > >> +  struct drm_connector_state *new_state;
> > >>    struct drm_crtc_state *new_crtc_state;
> > >>    struct drm_connector_state *old_state;
> > >>
> > >> +  new_state =3D drm_atomic_get_new_connector_state(state, connector=
);
> > >>    if (!new_state->crtc)
> > >>            return 0;
> > >>
> > >> -  old_state =3D drm_atomic_get_old_connector_state(new_state->state=
, connector);
> > >> -  new_crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state=
, new_state->crtc);
> > >> +  old_state =3D drm_atomic_get_old_connector_state(state, connector=
);
> > >> +  new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state=
->crtc);
> > >>
> > >>    if (old_state->tv.mode !=3D new_state->tv.mode ||
> > >>        old_state->tv.margins.left !=3D new_state->tv.margins.left ||
> > >> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/d=
rm/nouveau/dispnv50/disp.c
> > >> index 4b1650f51955..7ba373f493b2 100644
> > >> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > >> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > >> @@ -948,11 +948,12 @@ nv50_mstc_get_modes(struct drm_connector *conn=
ector)
> > >>
> > >>  static int
> > >>  nv50_mstc_atomic_check(struct drm_connector *connector,
> > >> -                 struct drm_connector_state *new_conn_state)
> > >> +                 struct drm_atomic_state *state)
> > >>  {
> > >> -  struct drm_atomic_state *state =3D new_conn_state->state;
> > >>    struct nv50_mstc *mstc =3D nv50_mstc(connector);
> > >>    struct drm_dp_mst_topology_mgr *mgr =3D &mstc->mstm->mgr;
> > >> +  struct drm_connector_state *new_conn_state =3D
> > >> +          drm_atomic_get_new_connector_state(state, connector);
> > >>    struct drm_connector_state *old_conn_state =3D
> > >>            drm_atomic_get_old_connector_state(state, connector);
> > >>    struct drm_crtc_state *crtc_state;
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/r=
car-du/rcar_lvds.c
> > >> index 620b51aab291..5b81ba2a7f27 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > >> @@ -92,13 +92,15 @@ static int rcar_lvds_connector_get_modes(struct =
drm_connector *connector)
> > >>  }
> > >>
> > >>  static int rcar_lvds_connector_atomic_check(struct drm_connector *c=
onnector,
> > >> -                                      struct drm_connector_state *s=
tate)
> > >> +                                      struct drm_atomic_state *stat=
e)
> > >>  {
> > >>    struct rcar_lvds *lvds =3D connector_to_rcar_lvds(connector);
> > >>    const struct drm_display_mode *panel_mode;
> > >> +  struct drm_connector_state *conn_state;
> > >>    struct drm_crtc_state *crtc_state;
> > >>
> > >> -  if (!state->crtc)
> > >> +  conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > >> +  if (!conn_state->crtc)
> > >>            return 0;
> > >>
> > >>    if (list_empty(&connector->modes)) {
> > >> @@ -110,9 +112,9 @@ static int rcar_lvds_connector_atomic_check(stru=
ct drm_connector *connector,
> > >>                                  struct drm_display_mode, head);
> > >>
> > >>    /* We're not allowed to modify the resolution. */
> > >> -  crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crt=
c);
> > >> -  if (IS_ERR(crtc_state))
> > >> -          return PTR_ERR(crtc_state);
> > >> +  crtc_state =3D drm_atomic_get_crtc_state(state, conn_state->crtc)=
;
> > >> +  if (!crtc_state)
> > >> +          return -EINVAL;
> > >>
> > >>    if (crtc_state->mode.hdisplay !=3D panel_mode->hdisplay ||
> > >>        crtc_state->mode.vdisplay !=3D panel_mode->vdisplay)
> > >> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4=
_txp.c
> > >> index c8b89a78f9f4..96f91c1b4b6e 100644
> > >> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> > >> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> > >> @@ -221,17 +221,18 @@ static const u32 txp_fmts[] =3D {
> > >>  };
> > >>
> > >>  static int vc4_txp_connector_atomic_check(struct drm_connector *con=
n,
> > >> -                                  struct drm_connector_state *conn_=
state)
> > >> +                                    struct drm_atomic_state *state)
> > >>  {
> > >> +  struct drm_connector_state *conn_state;
> > >>    struct drm_crtc_state *crtc_state;
> > >>    struct drm_framebuffer *fb;
> > >>    int i;
> > >>
> > >> +  conn_state =3D drm_atomic_get_new_connector_state(state, conn);
> > >>    if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> > >>            return 0;
> > >>
> > >> -  crtc_state =3D drm_atomic_get_new_crtc_state(conn_state->state,
> > >> -                                             conn_state->crtc);
> > >> +  crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> > >>
> > >>    fb =3D conn_state->writeback_job->fb;
> > >>    if (fb->width !=3D crtc_state->mode.hdisplay ||
> > >> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/=
drm_modeset_helper_vtables.h
> > >> index de57fb40cb6e..adc8b7cf64b5 100644
> > >> --- a/include/drm/drm_modeset_helper_vtables.h
> > >> +++ b/include/drm/drm_modeset_helper_vtables.h
> > >> @@ -1020,7 +1020,7 @@ struct drm_connector_helper_funcs {
> > >>     * deadlock.
> > >>     */
> > >>    int (*atomic_check)(struct drm_connector *connector,
> > >> -                      struct drm_connector_state *state);
> > >> +                      struct drm_atomic_state *state);
> > >>
> > >>    /**
> > >>     * @atomic_commit:
>
> --
> Regards,
>
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
