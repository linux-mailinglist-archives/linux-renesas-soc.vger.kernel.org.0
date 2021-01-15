Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2D62F86B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 21:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387526AbhAOUaP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 15:30:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732164AbhAOUaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 15:30:01 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E61358B;
        Fri, 15 Jan 2021 21:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610742556;
        bh=8R5qOZgwIXX9QIBlCIV/R54viYQ+tS8st/8kK+PspT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rXfe/Bd4sxDcopxrQyulKr6sWDtZgNWVEUmMmsnebMU4/0jVNn/8hLQVXHqwR4Iqy
         dmLamgDdsuehH2QKJU5DVGWdiVNzsC5Rqtv2JHOZ59k4V2CtY3G/tqo9iglvRf5/6q
         dndbBomFsfYf9WqlpJf3+ozL6ojiJBE1hiTgHRnI=
Date:   Fri, 15 Jan 2021 22:28:59 +0200
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
        Ben Skeggs <bskeggs@redhat.com>,
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
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>, Eric Anholt <eric@anholt.net>,
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
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
Message-ID: <YAH7C0EOsisHhqvR@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-2-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:54PM +0100, Maxime Ripard wrote:
> Most drivers call the argument to the plane atomic_check hook simply
> state, which is going to conflict with the global atomic state in a
> later rework. Let's rename it to new_plane_state (or new_state depending
> on the convention used in the driver).
> 
> This was done using the coccinelle script below, and built tested:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
>  static const struct drm_plane_helper_funcs helpers = {
>  	.atomic_check = func,
>  };
> 
> @ has_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> expression e;
> symbol old_state;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  	struct drm_plane_state *old_state = e;
>  	...
>  }
> 
> @ depends on has_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane,
> -	struct drm_plane_state *state
> +	struct drm_plane_state *new_state
>      )
>  {
>  	<+...
> -	state
> +	new_state
> 	...+>
>  }
> 
> @ has_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  }
> 
> @ depends on has_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane,
> -	struct drm_plane_state *state
> +	struct drm_plane_state *new_plane_state
>      )
>  {
>  	<+...
> -	state
> +	new_plane_state
> 	...+>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

>  drivers/gpu/drm/omapdrm/omap_plane.c          | 19 +++++----
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  7 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  7 ++--
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            | 10 +++--

For these, with the comment below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  41 files changed, 402 insertions(+), 357 deletions(-)

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 51dc24acea73..78d0eb1fd69d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -99,18 +99,19 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
>  }
>  
>  static int omap_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>  {
>  	struct drm_crtc_state *crtc_state;
>  
> -	if (!state->fb)
> +	if (!new_plane_state->fb)
>  		return 0;
>  
>  	/* crtc should only be NULL when disabling (i.e., !state->fb) */

s/state/new_plane_state/ here too ?

> -	if (WARN_ON(!state->crtc))
> +	if (WARN_ON(!new_plane_state->crtc))
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
> +							new_plane_state->crtc);
>  	/* we should have a crtc state if the plane is attached to a crtc */
>  	if (WARN_ON(!crtc_state))
>  		return 0;
> @@ -118,17 +119,17 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>  	if (!crtc_state->enable)
>  		return 0;
>  
> -	if (state->crtc_x < 0 || state->crtc_y < 0)
> +	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
>  		return -EINVAL;
>  
> -	if (state->crtc_x + state->crtc_w > crtc_state->adjusted_mode.hdisplay)
> +	if (new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->adjusted_mode.hdisplay)

I can't help thinking we're using too long variable names... :-(

>  		return -EINVAL;
>  
> -	if (state->crtc_y + state->crtc_h > crtc_state->adjusted_mode.vdisplay)
> +	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
>  		return -EINVAL;
>  
> -	if (state->rotation != DRM_MODE_ROTATE_0 &&
> -	    !omap_framebuffer_supports_rotation(state->fb))
> +	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
> +	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
>  		return -EINVAL;
>  
>  	return 0;

[...]

-- 
Regards,

Laurent Pinchart
