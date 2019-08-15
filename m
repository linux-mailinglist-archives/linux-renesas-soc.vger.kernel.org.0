Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E98738EAED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 14:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbfHOMAU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 08:00:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730379AbfHOMAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 08:00:19 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336662AF;
        Thu, 15 Aug 2019 14:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565870417;
        bh=A0ss3R3Sk7I88U0odL2MqAjBB4gXoIuYHegStKY3AHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XoChd+oXcLPj9rbrHCc/1MOquMvsYcM438HTcgWHOl6bUra8+85htemNo9adOKA7T
         wzc1syp1AeBbmbfL8qjKKpB799GZgVqgINMX8b6lKRe8Fa9gd69vRpGtbrwohseQoW
         gIJpoH/Ec687kqEuukEhalpDysx9QgQa8v7eUQEk=
Date:   Thu, 15 Aug 2019 15:00:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 4/9] drm/timings: Add link flags
Message-ID: <20190815120014.GK5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Aug 15, 2019 at 12:04:28PM +0100, Fabrizio Castro wrote:
> We need more information to describe dual-LVDS links, therefore
> introduce link_flags.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v1->v2:
> * new patch
> 
>  include/drm/drm_timings.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/drm/drm_timings.h b/include/drm/drm_timings.h
> index 4af8814..58fbf1b 100644
> --- a/include/drm/drm_timings.h
> +++ b/include/drm/drm_timings.h
> @@ -1,4 +1,6 @@
>  /*
> + * Copyright (C) 2019 Renesas Electronics Corporation
> + *
>   * Permission to use, copy, modify, distribute, and sell this software and its
>   * documentation for any purpose is hereby granted without fee, provided that
>   * the above copyright notice appear in all copies and that both that copyright
> @@ -21,6 +23,24 @@
>  #ifndef __DRM_TIMINGS_H__
>  #define __DRM_TIMINGS_H__
>  
> +#include <linux/bits.h>
> +
> +/**
> + * enum drm_link_flags - link_flags for &drm_timings
> + *
> + * This enum defines the details of the link.
> + *
> + * @DRM_LINK_DUAL_LVDS_ODD_EVEN:	Dual-LVDS link, with odd pixels (1,3,5,
> + *					etc.) coming through the first port, and
> + *					even pixels (0,2,4,etc.) coming through
> + *					the second port. If not specified for a
> + *					dual-LVDS panel, it is assumed that even
> + *					pixels are coming through the first port
> + */
> +enum drm_link_flags {

The text will be easier to read if you inline it here.

	/**
	 * @DRM_LINK_DUAL_LVDS_ODD_EVEN: Dual-LVDS link, with odd pixels (1,3,5,
	 * etc.) coming through the first port, and  even pixels (0,2,4,etc.)
	 ...

> +	DRM_LINK_DUAL_LVDS_ODD_EVEN = BIT(0),

I would remove the dual_link field and add a DRM_LINK_DUAL_LVDS (or
alternatively two flags, dual lvds odd-even and dual lvds even-odd).

> +};
> +
>  /**
>   * struct drm_timings - timing information
>   */
> @@ -55,6 +75,12 @@ struct drm_timings {
>  	 * and odd-numbered pixels are received on separate links.
>  	 */
>  	bool dual_link;
> +	/**
> +	 * @link_flags
> +	 *
> +	 * Provides detailed information about the link.

I think this calls for a bit more information than "detailed
information". What information do you want to store in this field ?

> +	 */
> +	enum drm_link_flags link_flags;
>  };
>  
>  #endif /* __DRM_TIMINGS_H__ */
> -- 
> 2.7.4
> 

-- 
Regards,

Laurent Pinchart
