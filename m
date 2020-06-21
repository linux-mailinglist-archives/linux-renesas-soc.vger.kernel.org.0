Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6DE2029AF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2020 10:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgFUIkH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Jun 2020 04:40:07 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:58558 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729509AbgFUIkG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 04:40:06 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8EEC620021;
        Sun, 21 Jun 2020 10:40:01 +0200 (CEST)
Date:   Sun, 21 Jun 2020 10:40:00 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200621084000.GM74146@ravnborg.org>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=2dXFqMFcpVJmOLD-spwA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> The DRM CRTC helpers add default modes to connectors in the connected
> state if no mode can be retrieved from the connector. This behaviour is
> useful for VGA or DVI outputs that have no connected DDC bus. However,
> in such cases, the status of the output usually can't be retrieved and
> is reported as connector_status_unknown.
> 
> Extend the addition of default modes to connectors in an unknown state
> to support outputs that can retrieve neither the modes nor the
> connection status.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

From your description sounds like an OK approach.
But this is not something I feel too familiar with.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
>  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index f5d141e0400f..9055d9573c90 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  	if (count == 0 && connector->status == connector_status_connected)
>  		count = drm_add_override_edid_modes(connector);
>  
> -	if (count == 0 && connector->status == connector_status_connected)
> +	if (count == 0 && (connector->status == connector_status_connected ||
> +			   connector->status == connector_status_unknown))
>  		count = drm_add_modes_noedid(connector, 1024, 768);
>  	count += drm_helper_probe_add_cmdline_mode(connector);
>  	if (count == 0)
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 421a30f08463..afe55e2e93d2 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
>  	 * The usual way to implement this is to cache the EDID retrieved in the
>  	 * probe callback somewhere in the driver-private connector structure.
>  	 * In this function drivers then parse the modes in the EDID and add
> -	 * them by calling drm_add_edid_modes(). But connectors that driver a
> +	 * them by calling drm_add_edid_modes(). But connectors that drive a
>  	 * fixed panel can also manually add specific modes using
>  	 * drm_mode_probed_add(). Drivers which manually add modes should also
>  	 * make sure that the &drm_connector.display_info,
>  	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
>  	 * filled in.
>  	 *
> +	 * Note that the caller function will automatically add standard VESA
> +	 * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> +	 * no mode and if the connector status is connector_status_connected or
> +	 * connector_status_unknown. There is no need to call
> +	 * drm_add_edid_modes() manually in that case.
> +	 *
>  	 * Virtual drivers that just want some standard VESA mode with a given
>  	 * resolution can call drm_add_modes_noedid(), and mark the preferred
>  	 * one using drm_set_preferred_mode().
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
