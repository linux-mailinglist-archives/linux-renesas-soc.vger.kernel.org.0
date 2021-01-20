Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C962FDBCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 22:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbhATVH4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 16:07:56 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40027 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389526AbhATNv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 08:51:28 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4AE60580614;
        Wed, 20 Jan 2021 08:50:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 20 Jan 2021 08:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=sDxhL51Vhfp7bMJtc05jY3INv15
        IU8xKUsLjHr0xiOU=; b=e6RAvVNPXxx7n+xiZF1cUAYNfJs5LTR6PfLc0CImUdL
        LlXQ2amT0WEqGAlHTdvKd/rcGDF9tSdtsirQSEbuQ3kwVZPiCkw1rM45GLgnvgPm
        Z4AsvGXKTlP7JsOul0AAUpaxlPAIY0gsrLwL9MiYoYuMQ6L6TO3yzgXJyxnZRvp+
        jtbY428Tzk+iEi5DuF8gexjpBHwznO/my3ickth/O3fCvFWfKEcF6MqEAd4+26aI
        ltp/+9yq6CB5vfxYtjqmtlBszlAGV3LvzyYzkBIp/5m62bEJ7/gvtET2/W1vfPsg
        vY4oRDFmYVdvqYxQCwBv7aNKZ4xfO67HgJeBjDQpS+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sDxhL5
        1Vhfp7bMJtc05jY3INv15IU8xKUsLjHr0xiOU=; b=EfesV/hyieiND3YvIa/6XB
        Ybt6zQhLteUCpGeaKh3HJ3r8SPD5icS8VMHvz6edMF/d+NH2mK3+OxnvxfLBsWqV
        wXAMG7OAE3iMb8Jj0zKpAuRT6rB2AmmPxwaSas/r5vQ17Ork2L0vvST7Yeo2hptr
        F9gINk9hxuhpdcZ2JGY+OBhDuNww1XOgMwXBZ+XlaGSmxSidkgRe96ytQ5cFQ36z
        F4/Gafqosel9wOY2VtXYBKWeq1o3cc19d++D7K5l3EhNb0X8J4DKZ3qqgOONCwN6
        9jCka/dzFyN+ouChiOWz+bG2KoQKejSligox5c8EC46vLc98c5GQGNldiZTqNdiw
        ==
X-ME-Sender: <xms:IzUIYBLicoqnn4cKs8x0Pp9Pew1bMiKdgpUEwDUUwIwJW4nkat-lcQ>
    <xme:IzUIYNKJlHYiYTnryfJ7FgRQ96NTmu-3-k4EVWZnhfiY6WbONJtTbHl6CtkzcZ4tZ
    wpnVt7KjvQfrHHugmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeejuddvhfekkefhtdegiefhledutdevtdfhkedtleefjefgleduhfetudevjeeh
    hfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IzUIYJuyCRLplkytmnPfqvsFYFiO-40_7Pq8uRvt9gFI1Ft8Pxp0_Q>
    <xmx:IzUIYCa6X7oKHbxl049BLO5Dj-VJrpEnl21BABFJDjWnG5XMMVosTw>
    <xmx:IzUIYIYqTCc8YBMhLSqyUurjSUdIMjhXmyOu9Kh0nDWJvkodsHOfUA>
    <xmx:JjUIYErtHO_yb8fagBsjjNu7TpdEVr7RYSOTFP0KQHcqCwPHx6802A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4410A24005A;
        Wed, 20 Jan 2021 08:50:27 -0500 (EST)
Date:   Wed, 20 Jan 2021 14:50:26 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marek Vasut <marex@denx.de>, Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Hans de Goede <hdegoede@redhat.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/10] drm: Use state helper instead of the plane state
 pointer
Message-ID: <20210120135026.np2ivojt5vnvyota@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-10-maxime@cerno.tech>
 <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j7svqftvzagigb3f"
Content-Disposition: inline
In-Reply-To: <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--j7svqftvzagigb3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Jan 15, 2021 at 11:20:21PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Fri, Jan 15, 2021 at 01:57:02PM +0100, Maxime Ripard wrote:
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_update or atomic_disable hooks,
>=20
> Please don't use the word "current", it's ambiguous. Do you mean old
> state or new state ?

It's kind of the point I was trying to make: plane->state is the current
state of the plane, but it's definitely ambiguous and it's fairly easy
to be confused when working over several hooks.

> > which would be the new plane state in the global atomic state since
> > _swap_state happened when those hooks are run.
>=20
> Is this relevant ? drm_atomic_helper_swap_state() doesn't change the
> old_state and new_state pointers in drm_atomic_state as far as I can
> tell.

No, but it does change the plane->state pointer: before swap_state it's
the old state, after swap_state it's the new state

> > Use the drm_atomic_get_new_plane_state helper to get that state to make=
 it
> > more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_disable =3D func,
> > 	...,
> >  };
> > |
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_update =3D func,
> > 	...,
> >  };
> > )
> >=20
> > @ adds_new_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state;
> > identifier new_state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_atomic_state *state)
> >  {
> >  	...
> > -	struct drm_plane_state *new_state =3D plane->state;
> > +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state, plane);
> > 	...
> >  }
> >=20
> > @ include depends on adds_new_state @
> > @@
> >=20
> >  #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && adds_new_state @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> [snip]
>=20
> >  drivers/gpu/drm/omapdrm/omap_plane.c            | 6 ++++--
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c         | 3 ++-
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 3 ++-
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c              | 3 ++-
>=20
> [snip]
>=20
> > diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/oma=
pdrm/omap_plane.c
> > index cd8cf7c786b5..021a94de84a1 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> > @@ -44,7 +44,8 @@ static void omap_plane_atomic_update(struct drm_plane=
 *plane,
> >  {
> >  	struct omap_drm_private *priv =3D plane->dev->dev_private;
> >  	struct omap_plane *omap_plane =3D to_omap_plane(plane);
> > -	struct drm_plane_state *new_state =3D plane->state;
>=20
> This seems to imply that you're interested in the new state.

Well, to be fair, the variable is only called "state" before this series
and it's one of the previous patch that renames it to new_state and
makes it a more obvious.

Otherwise, state =3D plane->state is fairly confusing and error-prone.
With that change you would make it really obvious

> > +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> > +									   plane);
>=20
> Does this really make things more obvious ?

I guess you're better at remembering this than I am then :)

The discussion on whether it's more obvious or not aside, accessing the
->state pointer directly has some culprits, see:

https://dri.freedesktop.org/docs/drm/gpu/todo.html#plumb-drm-atomic-state-a=
ll-over

Maxime

--j7svqftvzagigb3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAg1IgAKCRDj7w1vZxhR
xW+rAQCaKXuyQvbRubp33hPCkdAY/LXaD+3TQwLv2j7AhTFUtAD/aLv/q1HqwcEO
ZfMJ4deD5+JElSu70qt5AOEI/9JMPAg=
=q+gU
-----END PGP SIGNATURE-----

--j7svqftvzagigb3f--
