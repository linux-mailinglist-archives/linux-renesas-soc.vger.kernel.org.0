Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85C22F873B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 22:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731578AbhAOVHq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 16:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729204AbhAOVHo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 16:07:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E86EC06179F;
        Fri, 15 Jan 2021 13:06:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D77A258B;
        Fri, 15 Jan 2021 22:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610744792;
        bh=T6hbV1O1oRjYL8zdng4qI1ulSsCeoFenYqaoA4x2R1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+HucoNHt8b2/xNw2SqwXz+mxRCAMPmim4GRd9N7lVM740JU7m+MeQeAmI23QbbZJ
         5b2DgI1hHEzzRPPfkCkaIrro6c0Xzs3tmqlHK++ZReexfl/MjcWXoizCyFa49MR3MP
         FeLurhztnooLUnIirndDiO8cTiqI3R4yaO82o0cg=
Date:   Fri, 15 Jan 2021 23:06:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
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
        Eric Anholt <eric@anholt.net>,
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
Subject: Re: [PATCH 09/10] drm/atomic: Pass the full state to planes atomic
 disable and update
Message-ID: <YAIDxoyUtQooCsET@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-9-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-9-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:57:01PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> 
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> 
> Let's start convert all the remaining helpers to provide a consistent

s/start convert/convert/ ?

> interface, starting with the planes atomic_update and atomic_disable.

You're not starting anymore, its 09/10 already :-)

> The conversion was done using the coccinelle script below, built tested on
> all the drivers.
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
>  	...
> 	void (*atomic_update)(struct drm_plane *plane,
> -			      struct drm_plane_state *plane_state);
> +			      struct drm_atomic_state *state);
>  	...
>  }
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
> 	...
> 	void (*atomic_disable)(struct drm_plane *plane,
> -			       struct drm_plane_state *plane_state);
> +			       struct drm_atomic_state *state);
> 	...
>  }
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> )
> 
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier crtc_state;
> identifier plane, plane_state, state;
> expression e;
> @@
> 
>  f(struct drm_crtc_state *crtc_state)
>  {
>  	...
>  	struct drm_atomic_state *state = e;
>  	<+...
> (
> -	FUNCS->atomic_disable(plane, plane_state)
> +	FUNCS->atomic_disable(plane, state)
> |
> -	FUNCS->atomic_update(plane, plane_state)
> +	FUNCS->atomic_update(plane, state)
> )
>  	...+>
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane,
> -    struct drm_plane_state *state)
> +    struct drm_plane_state *old_plane_state)
>  {
> 	<...
> -	state
> +	old_plane_state
> 	...>
>  }
> 
> @ ignores_old_state @
> identifier plane_atomic_func.func;
> identifier plane, old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
> 	... when != old_state
>  }
> 
> @ adds_old_state depends on plane_atomic_func && !ignores_old_state @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *plane_state)
>  {
> +	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	...
>  }
> 
> @ depends on plane_atomic_func @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
> 
>  func(struct drm_plane *plane,
> -     struct drm_plane_state *plane_state
> +     struct drm_atomic_state *state
>      )
>  { ... }
> 
> @ include depends on adds_old_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_old_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state) {
>  	...
>  	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	<+...
> -	plane_state->state
> +	state
>  	...+>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/drm_atomic_helper.c           |  8 ++++----
>  drivers/gpu/drm/drm_simple_kms_helper.c       |  4 +++-
>  drivers/gpu/drm/omapdrm/omap_plane.c          |  4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  4 +++-
>  include/drm/drm_modeset_helper_vtables.h      |  4 ++--

For these,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

For drivers/gpu/drm/xlnx/zynqmp_disp.c, please see below.

[snip]

> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e278680b7d5a..39f9e6e76064 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1166,8 +1166,10 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
>  
>  static void
>  zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
> -				 struct drm_plane_state *old_state)
> +				 struct drm_atomic_state *state)
>  {
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
>  	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
>  
>  	if (!old_state->fb)
> @@ -1178,8 +1180,10 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
>  
>  static void
>  zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
> -				struct drm_plane_state *old_state)
> +				struct drm_atomic_state *state)
>  {
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +								           plane);
>  	struct drm_plane_state *new_state = plane->state;
>  	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
>  	bool format_changed = false;
> @@ -1485,20 +1489,12 @@ static void
>  zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
>  				struct drm_atomic_state *state)
>  {
> -	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> -									      crtc);
>  	struct zynqmp_disp *disp = crtc_to_disp(crtc);
> -	struct drm_plane_state *old_plane_state;
>  
>  	/*
> -	 * Disable the plane if active. The old plane state can be NULL in the
> -	 * .shutdown() path if the plane is already disabled, skip
> -	 * zynqmp_disp_plane_atomic_disable() in that case.
> +	 * Disable the plane if active.
>  	 */
> -	old_plane_state = drm_atomic_get_old_plane_state(old_crtc_state->state,
> -							 crtc->primary);
> -	if (old_plane_state)

You're removing this check, but there's no safeguard in
zynqmp_disp_plane_atomic_disable(). Can drm_atomic_get_old_plane_state()
return NULL there ?

> -		zynqmp_disp_plane_atomic_disable(crtc->primary, old_plane_state);
> +	zynqmp_disp_plane_atomic_disable(crtc->primary, state);
>  
>  	zynqmp_disp_disable(disp);
>  

[snip]
> 

-- 
Regards,

Laurent Pinchart
