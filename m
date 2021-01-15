Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AED22F86D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 21:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733257AbhAOUkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 15:40:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbhAOUkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 15:40:18 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 309F158B;
        Fri, 15 Jan 2021 21:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610743174;
        bh=0eTzkl0LE8TIXGf5t0PGWUacoy38z9y9u6sIiGp9UYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FXkkLjrDScPwYCBTtHe+DPRrgVJwFQs+YddTW3P3PdK3Wp3t1JdLeO03A/q4YqBb0
         yL0LkWkkkMrfDp4IQxFj67afKUSbF+PM1L5xg7dytXkZ+flIG2RQqODs4Y3ZibtTbs
         45RkI7efEFF4ERwTe7cGwnLt1+LYrGqe7X5DhFkE=
Date:   Fri, 15 Jan 2021 22:39:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
        Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
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
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/10] drm/atomic: Pass the full state to planes
 atomic_check
Message-ID: <YAH9dTnznIugsSYE@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-4-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:56PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> 
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> 
> Let's start convert all the remaining helpers to provide a consistent

s/start convert/convert/ ?

> interface, starting with the planes atomic_check.
> 
> The conversion was done using the coccinelle script below plus some
> manual changes for vmwgfx, built tested on all the drivers.
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
>  	...
> 	int (*atomic_check)(struct drm_plane *plane,
> -			    struct drm_plane_state *plane_state);
> +			    struct drm_atomic_state *state);
> 	...
> }
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> static const struct drm_plane_helper_funcs helpers = {
> 	...,
>  	.atomic_check = func,
> 	...,
> };
> 
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier dev;
> identifier plane, plane_state, state;
> @@
> 
>  f(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	<+...
> -	FUNCS->atomic_check(plane, plane_state)
> +	FUNCS->atomic_check(plane, state)
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
> +    struct drm_plane_state *new_plane_state)
>  {
> 	<...
> -	state
> +	new_plane_state
> 	...>
>  }
> 

Is this needed, or is it a leftover from 02/10 ?

> @ ignores_new_state @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *new_plane_state)
>  {
> 	... when != new_plane_state
>  }
> 
> @ adds_new_state depends on plane_atomic_func && !ignores_new_state @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *new_plane_state)
>  {
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>  	...
>  }
> 
> @ depends on plane_atomic_func @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
> 
>  func(struct drm_plane *plane,
> -     struct drm_plane_state *new_plane_state
> +     struct drm_atomic_state *state
>      )
>  { ... }
> 
> @ include depends on adds_new_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_new_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/drm_atomic_helper.c               | 2 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c           | 4 +++-
>  drivers/gpu/drm/omapdrm/omap_plane.c              | 4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c           | 4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c             | 5 ++++-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c                | 4 +++-

For these,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[snip]

-- 
Regards,

Laurent Pinchart
