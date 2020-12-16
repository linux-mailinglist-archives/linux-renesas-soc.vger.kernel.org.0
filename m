Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780232DC0FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 14:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgLPNR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 08:17:29 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42285 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgLPNR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 08:17:28 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EDA0624000E;
        Wed, 16 Dec 2020 13:16:45 +0000 (UTC)
Date:   Wed, 16 Dec 2020 14:16:56 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
Message-ID: <20201216131656.hinoo4tpannaboqm@uno.localdomain>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216005021.19518-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216005021.19518-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 16, 2020 at 02:50:18AM +0200, Laurent Pinchart wrote:
> Replace the manual panel handling with usage of the DRM panel bridge
> helper. This simplifies the driver, and brings support for
> DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 120 +++-------------------------
>  1 file changed, 12 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 70dbbe44bb23..1b360e06658c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -63,7 +63,6 @@ struct rcar_lvds {
>  	struct drm_bridge bridge;
>
>  	struct drm_bridge *next_bridge;
> -	struct drm_connector connector;
>  	struct drm_panel *panel;
>
>  	void __iomem *mmio;
> @@ -80,73 +79,11 @@ struct rcar_lvds {
>  #define bridge_to_rcar_lvds(b) \
>  	container_of(b, struct rcar_lvds, bridge)
>
> -#define connector_to_rcar_lvds(c) \
> -	container_of(c, struct rcar_lvds, connector)
> -
>  static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>  {
>  	iowrite32(data, lvds->mmio + reg);
>  }
>
> -/* -----------------------------------------------------------------------------
> - * Connector & Panel
> - */
> -
> -static int rcar_lvds_connector_get_modes(struct drm_connector *connector)
> -{
> -	struct rcar_lvds *lvds = connector_to_rcar_lvds(connector);
> -
> -	return drm_panel_get_modes(lvds->panel, connector);
> -}
> -
> -static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
> -					    struct drm_atomic_state *state)
> -{
> -	struct rcar_lvds *lvds = connector_to_rcar_lvds(connector);
> -	const struct drm_display_mode *panel_mode;
> -	struct drm_connector_state *conn_state;
> -	struct drm_crtc_state *crtc_state;
> -
> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
> -	if (!conn_state->crtc)
> -		return 0;
> -
> -	if (list_empty(&connector->modes)) {
> -		dev_dbg(lvds->dev, "connector: empty modes list\n");
> -		return -EINVAL;
> -	}
> -
> -	panel_mode = list_first_entry(&connector->modes,
> -				      struct drm_display_mode, head);
> -
> -	/* We're not allowed to modify the resolution. */
> -	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
> -	if (IS_ERR(crtc_state))
> -		return PTR_ERR(crtc_state);
> -
> -	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
> -	    crtc_state->mode.vdisplay != panel_mode->vdisplay)
> -		return -EINVAL;
> -
> -	/* The flat panel mode is fixed, just copy it to the adjusted mode. */
> -	drm_mode_copy(&crtc_state->adjusted_mode, panel_mode);
> -
> -	return 0;
> -}
> -
> -static const struct drm_connector_helper_funcs rcar_lvds_conn_helper_funcs = {
> -	.get_modes = rcar_lvds_connector_get_modes,
> -	.atomic_check = rcar_lvds_connector_atomic_check,
> -};
> -
> -static const struct drm_connector_funcs rcar_lvds_conn_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * PLL Setup
>   */
> @@ -583,11 +520,6 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  	/* Turn the output on. */
>  	lvdcr0 |= LVDCR0_LVRES;
>  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> -
> -	if (lvds->panel) {
> -		drm_panel_prepare(lvds->panel);
> -		drm_panel_enable(lvds->panel);
> -	}
>  }
>
>  static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> @@ -609,11 +541,6 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>
> -	if (lvds->panel) {
> -		drm_panel_disable(lvds->panel);
> -		drm_panel_unprepare(lvds->panel);
> -	}
> -
>  	rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
> @@ -648,45 +575,13 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
>  			    enum drm_bridge_attach_flags flags)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> -	struct drm_connector *connector = &lvds->connector;
> -	struct drm_encoder *encoder = bridge->encoder;
> -	int ret;
>
> -	/* If we have a next bridge just attach it. */
> -	if (lvds->next_bridge)
> -		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
> -					 bridge, flags);
> -
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
> -	/* Otherwise if we have a panel, create a connector. */
> -	if (!lvds->panel)
> -		return 0;
> -
> -	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
> -				 DRM_MODE_CONNECTOR_LVDS);
> -	if (ret < 0)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &rcar_lvds_conn_helper_funcs);
> -
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -static void rcar_lvds_detach(struct drm_bridge *bridge)
> -{
> +	return drm_bridge_attach(bridge->encoder, lvds->next_bridge, bridge,
> +				 flags);
>  }
>
>  static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.attach = rcar_lvds_attach,
> -	.detach = rcar_lvds_detach,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> @@ -759,7 +654,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  		 * that we are expected to generate even pixels from the primary
>  		 * encoder, and odd pixels from the companion encoder.
>  		 */
> -		if (lvds->next_bridge && lvds->next_bridge->timings &&
> +		if (lvds->next_bridge->timings &&
>  		    lvds->next_bridge->timings->dual_link)
>  			lvds->link_type = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
>  		else
> @@ -811,6 +706,15 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  	if (ret)
>  		goto done;
>
> +	if (lvds->panel) {
> +		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
> +							      lvds->panel);

Reading the devm_drm_panel_bridge_add() function documentation:

 * devm_drm_panel_bridge_add - Creates a managed &drm_bridge and &drm_connector

Doesn't this conflict with the drm_bridge_connector_init() called by
the encoder in [4/4] ?


> +		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
> +			ret = -EINVAL;
> +			goto done;
> +		}
> +	}
> +
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
>  		ret = rcar_lvds_parse_dt_companion(lvds);
>
> --
> Regards,
>
> Laurent Pinchart
>
