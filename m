Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08D6E9683F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 20:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbfHTSCN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 14:02:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42522 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTSCN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 14:02:13 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF9C733D;
        Tue, 20 Aug 2019 20:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566324131;
        bh=RwxPZkVAe/4kQHs4ulwNUErBint7sN5+Gpu2PLkQQxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gNI3MgZxcG5L0dKoVa9vkhJgPckR996yAEfVijwv7B4a2ez1nJuOPlAlGL8lC5Rbc
         lUI2y8xv2PCEsrWbNjdyC6sP1tb9jhn8V3s5Gw9RH8MEIQtJmXzthF+wldhowtc4qO
         TfSamiIIfPuu8yU0fk5C6DAQuGaDyQ1ZGrpZC+iA=
Date:   Tue, 20 Aug 2019 21:02:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/19] drm: rcar-du: crtc: Register GAMMA_LUT
 properties
Message-ID: <20190820180205.GL10820@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-19-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190706140746.29132-19-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sat, Jul 06, 2019 at 04:07:45PM +0200, Jacopo Mondi wrote:
> Enable the GAMMA_LUT KMS property using the framework helpers to
> register the proeprty and the associated gamma table size maximum size.

s/proeprty/property/
"and set the associated gamme table maximum size" ?

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 3dac605c3a67..222ccc20d6d8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1082,6 +1082,7 @@ static const struct drm_crtc_funcs crtc_funcs_gen3 = {
>  	.set_crc_source = rcar_du_crtc_set_crc_source,
>  	.verify_crc_source = rcar_du_crtc_verify_crc_source,
>  	.get_crc_sources = rcar_du_crtc_get_crc_sources,
> +	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1205,6 +1206,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	if (rcdu->cmms[swindex]) {
>  		rcrtc->cmm = rcdu->cmms[swindex];
>  		rgrp->cmms_mask |= BIT(hwindex % 2);
> +
> +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);
>  	}
>  
>  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);

-- 
Regards,

Laurent Pinchart
