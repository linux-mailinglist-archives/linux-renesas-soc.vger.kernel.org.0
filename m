Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60BE7116D40
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 13:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfLIMm4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 07:42:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60348 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfLIMm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 07:42:56 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59ECF99A;
        Mon,  9 Dec 2019 13:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575895374;
        bh=/9t9mMNVnhK6lsKXNF7d29UDyDocfEsogVfQyZV5F7w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wBYFQVYuT+sG5EF7nE8SZitZwb+yVda0U0e9HMavQmUuYMtIrKclIXkwNhGl3ktqQ
         aHHh/7IUKnvc85wHjSgBPjP/GQVXoN+CpfEM6tYC9oFWhdD1TXf3eNwnBucvUCRjxa
         Te9SFXw1mGi5aqXepT8rAIOKehPAkK/lbQ6Tf+d8=
Date:   Mon, 9 Dec 2019 14:42:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:DRM DRIVERS FOR TI OMAP" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/omapdrm: Fix trivial spelling
Message-ID: <20191209124247.GA9158@pendragon.ideasonboard.com>
References: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Mon, Dec 09, 2019 at 12:33:19PM +0000, Kieran Bingham wrote:
> Fix trivial spelling identified while examining the code.
> 
> 	s/supprted./supported./
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 3c5ddbf30e97..fce7e944a280 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -831,7 +831,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  	 * OMAP_DSS_CHANNEL_DIGIT. X server assumes 256 element gamma
>  	 * tables so lets use that. Size of HW gamma table can be
>  	 * extracted with dispc_mgr_gamma_size(). If it returns 0
> -	 * gamma table is not supprted.
> +	 * gamma table is not supported.
>  	 */
>  	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
>  		unsigned int gamma_lut_size = 256;

-- 
Regards,

Laurent Pinchart
