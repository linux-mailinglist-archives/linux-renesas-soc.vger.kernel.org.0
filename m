Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12C320299D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2020 10:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbgFUI0e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Jun 2020 04:26:34 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:57484 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729491AbgFUI0e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 04:26:34 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id D9D7E20021;
        Sun, 21 Jun 2020 10:26:31 +0200 (CEST)
Date:   Sun, 21 Jun 2020 10:26:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 05/27] drm: bridge: Return NULL on error from
 drm_bridge_get_edid()
Message-ID: <20200621082630.GK74146@ravnborg.org>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526011505.31884-6-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=GCc0sKAwdcr2Yn5nW_QA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 26, 2020 at 04:14:43AM +0300, Laurent Pinchart wrote:
> The drm_bridge_get_edid() function is documented to return an error
> pointer on error. The underlying .get_edid() operation, however, returns
> NULL on error, and so do the drm_get_edid() and drm_do_get_edid()
> functions upon which .get_edid() is usually implemented. Make
> drm_bridge_get_edid() return NULL on error to be consistent.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 10 +++++++---
>  drivers/gpu/drm/drm_bridge.c       |  6 +++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index e3eb6364c0f7..f065a96a0917 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -51,11 +51,15 @@ static int tfp410_get_modes(struct drm_connector *connector)
>  	struct edid *edid;
>  	int ret;
>  
> -	edid = drm_bridge_get_edid(dvi->next_bridge, connector);
> -	if (IS_ERR_OR_NULL(edid)) {
> -		if (edid != ERR_PTR(-ENOTSUPP))
> +	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
> +		edid = drm_bridge_get_edid(dvi->next_bridge, connector);
> +		if (!edid)
>  			DRM_INFO("EDID read failed. Fallback to standard modes\n");
> +	} else {
> +		edid = NULL;
> +	}
>  
> +	if (!edid) {
>  		/*
>  		 * No EDID, fallback on the XGA standard modes and prefer a mode
>  		 * pretty much anything can handle.
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index afdec8e5fc68..fe1e3460b486 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1086,16 +1086,16 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
>   *
>   * If the bridge supports output EDID retrieval, as reported by the
>   * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
> - * get the EDID and return it. Otherwise return ERR_PTR(-ENOTSUPP).
> + * get the EDID and return it. Otherwise return NULL.
>   *
>   * RETURNS:
> - * The retrieved EDID on success, or an error pointer otherwise.
> + * The retrieved EDID on success, or NULL otherwise.
>   */
>  struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
>  				 struct drm_connector *connector)
>  {
>  	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
> -		return ERR_PTR(-ENOTSUPP);
> +		return NULL;
>  
>  	return bridge->funcs->get_edid(bridge, connector);
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
