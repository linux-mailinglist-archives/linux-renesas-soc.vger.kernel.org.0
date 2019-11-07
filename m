Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209C0F39B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfKGUrJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:47:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35658 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfKGUrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:47:09 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EE9771D;
        Thu,  7 Nov 2019 21:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573159626;
        bh=5CCn+LusZTnQDr42Vwr6V3gT6kudUv6MM8WIdUKadyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UEjzU/Id1GESLCKXnQK4b2QtXeckfRA9xJQ9Ay3dUdSOCk/+67tYDU6FU4AGyD1Sr
         KbVycvM+ARryp6XNia/Hi/+QufhSEO/UWNbbBTpI0yfwXy30RKi3sDSNEHMXTjKdGA
         5YUAXr66kzFHD4zO4PHCCVpLCFQcSLyv8e7jiKzg=
Date:   Thu, 7 Nov 2019 22:46:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
Message-ID: <20191107204656.GP24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

(CC'ing Sam)

Thank you for the patch.

On Thu, Nov 07, 2019 at 08:11:00PM +0000, Fabrizio Castro wrote:
> The existing DRM_MODE_CONNECTOR_ definitions don't seem to
> describe the connector for RGB/Parallel embedded displays,
> hence add DRM_MODE_CONNECTOR_PARALLEL.

Please, no. We already have too many connector types for panels, when
userspace should really not care. DRM_MODE_CONNECTOR_LVDS,
DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DSI, DRM_MODE_CONNECTOR_DPI
and probably DRM_MODE_CONNECTOR_SPI should have been
DRM_MODE_CONNECTOR_PANEL.

This has been discussed in [1]. Let's instead define a
DRM_MODE_CONNECTOR_PANEL, possibly as an alias to one of the existing
types, and deprecate the other types.

[1] https://www.spinics.net/lists/dri-devel/msg224638.html

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * New patch
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  include/uapi/drm/drm_mode.h     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 2166000..b233029 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -93,6 +93,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_list[] = {
>  	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
>  	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
>  	{ DRM_MODE_CONNECTOR_SPI, "SPI" },
> +	{ DRM_MODE_CONNECTOR_PARALLEL, "Parallel" },
>  };
>  
>  void drm_connector_ida_init(void)
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 735c8cf..5852f47 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -362,6 +362,7 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_DPI		17
>  #define DRM_MODE_CONNECTOR_WRITEBACK	18
>  #define DRM_MODE_CONNECTOR_SPI		19
> +#define DRM_MODE_CONNECTOR_PARALLEL	20
>  
>  struct drm_mode_get_connector {
>  

-- 
Regards,

Laurent Pinchart
