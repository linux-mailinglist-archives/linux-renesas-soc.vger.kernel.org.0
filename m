Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CB6F39C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfKGUs7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:48:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbfKGUs7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:48:59 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44AAD71D;
        Thu,  7 Nov 2019 21:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573159736;
        bh=pmzvKL0wtmMTBCZNxQBXqoocDPWwX/PcDpvrlBEmGQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KKfWVT+LZqmLZZDVydKtyIlOtV8wgQvtJ2kFE+L7+ICbspPUg0OH7E9tl9n44sx/s
         DIx2YaQsFjBcPyUMh8WC6mOkLd0N2Q8xCuCCd47PuUyhLbP0cSo2eYtErfdW9DnKoi
         4KshitWefmZtx8hJAQUof5bBOGCUCDSvhuQNjkjk=
Date:   Thu, 7 Nov 2019 22:48:46 +0200
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
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for
 etm0700g0dh6
Message-ID: <20191107204846.GQ24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Nov 07, 2019 at 08:11:01PM +0000, Fabrizio Castro wrote:
> Add connector type for the etm0700g0dh6 from Emerging Display
> Technologies (EDT).
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * New patch
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d48768..82065ff 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1342,6 +1342,7 @@ static const struct panel_desc edt_etm0700g0dh6 = {
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_PARALLEL,

I still think we should have a DRM_MODE_CONNECTOR_PANEL, but regardless,
this panel seems to match DRM_MODE_CONNECTOR_DPI.

>  };
>  
>  static const struct panel_desc edt_etm0700g0bdh6 = {

-- 
Regards,

Laurent Pinchart
