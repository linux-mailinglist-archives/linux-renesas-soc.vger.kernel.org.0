Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF208EDE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732426AbfHOONq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:13:46 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51912 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbfHOONq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:13:46 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4DF672002A;
        Thu, 15 Aug 2019 16:13:38 +0200 (CEST)
Date:   Thu, 15 Aug 2019 16:13:37 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Message-ID: <20190815141337.GA2437@ravnborg.org>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
        a=qCD3WiFNeiuAlpbEp7oA:9 a=CjuIK1q_8ugA:10 a=QsnFDINu91a9xkgZirup:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio

On Thu, Aug 15, 2019 at 12:04:29PM +0100, Fabrizio Castro wrote:
> We need to know if the panel supports dual-link, similarly
> to bridges, therefore add a reference to drm_timings in
> drm_panel.

Why do we need to know this?
Why is it needed in drm_panel and not in some driver specific struct?

I cannot see the full series, as I was copied only on some mails.
Awaiting dri-devel moderator before I can see the rest.

	Sam

> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v1->v2:
> * new patch
> 
>  include/drm/drm_panel.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 8c738c0..cd6ff07 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/list.h>
> +#include <drm/drm_timings.h>
>  
>  struct device_node;
>  struct drm_connector;
> @@ -81,6 +82,7 @@ struct drm_panel_funcs {
>   * struct drm_panel - DRM panel object
>   * @drm: DRM device owning the panel
>   * @connector: DRM connector that the panel is attached to
> + * @timings: timing information
>   * @dev: parent device of the panel
>   * @link: link from panel device (supplier) to DRM device (consumer)
>   * @funcs: operations that can be performed on the panel
> @@ -89,6 +91,7 @@ struct drm_panel_funcs {
>  struct drm_panel {
>  	struct drm_device *drm;
>  	struct drm_connector *connector;
> +	const struct drm_timings *timings;
>  	struct device *dev;
>  
>  	const struct drm_panel_funcs *funcs;
> -- 
> 2.7.4
