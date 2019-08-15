Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 910D98EAF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 14:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730638AbfHOMDU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 08:03:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfHOMDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 08:03:20 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09E0F2AF;
        Thu, 15 Aug 2019 14:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565870598;
        bh=x6tXLrhBDxMnnhW530edcIgz9qxsaLzKSDv1wQnDanY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eVdrCHQmu9La5DxbcRx/V8Wf3UXbSLxrTF9w9DN+puobrZePFG0I4mbJHc4H/5pfE
         tDCfkC+xfAdgb/yeE0xZUoqGJG7D7Mex9OMpYiO65ntNAfMsyrm5k4PqWPmtwqI9xk
         g6BcXZz6M+s4elsH1RyDFvK74XHUSxc4aVUaFKG8=
Date:   Thu, 15 Aug 2019 15:03:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Message-ID: <20190815120315.GL5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Aug 15, 2019 at 12:04:29PM +0100, Fabrizio Castro wrote:
> We need to know if the panel supports dual-link, similarly
> to bridges, therefore add a reference to drm_timings in
> drm_panel.

Panels may also need to report setup/hold time, so it's not about
dual-link only. I would make this explicit in the commit message.

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

You can just add a forward-declaration of struct drm_timing.

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

-- 
Regards,

Laurent Pinchart
