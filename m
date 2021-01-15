Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1502F8795
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 22:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbhAOVVY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 16:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbhAOVVV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 16:21:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76B3C061757;
        Fri, 15 Jan 2021 13:20:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6241F58B;
        Fri, 15 Jan 2021 22:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610745638;
        bh=gBrtw5MNkdCbuPvi2cTqhl5za5Pqp/q6zVdWl/a94uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DpGlh+3zv26rFKiVKPMFcYE9SIJo78wTzt+f/qWBARm/BpkTmg6EAErEFPBPbbPhX
         fh5IdmlIWmtQSiBr7ktLcqDESDp5TwoTZAovDL33H8Kodwu6i7gIW5IBgS4KdC5rwv
         RKLhIq/ekLRDmOepJkHy4FhmHBsfknCCplWClCys=
Date:   Fri, 15 Jan 2021 23:20:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
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
        Maxime Ripard <mripard@kernel.org>,
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
Message-ID: <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-10-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-10-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:57:02PM +0100, Maxime Ripard wrote:
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_update or atomic_disable hooks,

Please don't use the word "current", it's ambiguous. Do you mean old
state or new state ?

> which would be the new plane state in the global atomic state since
> _swap_state happened when those hooks are run.

Is this relevant ? drm_atomic_helper_swap_state() doesn't change the
old_state and new_state pointers in drm_atomic_state as far as I can
tell.

> Use the drm_atomic_get_new_plane_state helper to get that state to make it
> more obvious.
> 
> This was made using the coccinelle script below:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> )
> 
> @ adds_new_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier new_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>  	...
> -	struct drm_plane_state *new_state = plane->state;
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> 	...
>  }
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

>  drivers/gpu/drm/omapdrm/omap_plane.c            | 6 ++++--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c         | 3 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 3 ++-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c              | 3 ++-

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index cd8cf7c786b5..021a94de84a1 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -44,7 +44,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>  {
>  	struct omap_drm_private *priv = plane->dev->dev_private;
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
> -	struct drm_plane_state *new_state = plane->state;

This seems to imply that you're interested in the new state.

> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);

Does this really make things more obvious ?

>  	struct omap_overlay_info info;
>  	int ret;
>  
> @@ -89,7 +90,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>  static void omap_plane_atomic_disable(struct drm_plane *plane,
>  				      struct drm_atomic_state *state)
>  {
> -	struct drm_plane_state *new_state = plane->state;
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);
>  	struct omap_drm_private *priv = plane->dev->dev_private;
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
>  

[snip]

-- 
Regards,

Laurent Pinchart
