Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B013899A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 14:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfFGMDU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 08:03:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36662 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfFGMDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 08:03:20 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 817DE334;
        Fri,  7 Jun 2019 14:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559908998;
        bh=84znYhgs5zYBGQHXQMi32sSSKWf+vibIjQy0J6VPl/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W+XFkIEVyl5OCJAOjfsk5rQcwXyh69rVjOpQcMWrKGCSd64PRP0pscrFfMw9Ckr5T
         jKAoCC3UmVmO87u5oVEPgynapV3JQwezuqbbzhRJ/8WBXJgkZy5JFL0xGALwwJpKZz
         GWgeT/i/eruObyIPEzQmGyvw00zQPkObcSXtmFrk=
Date:   Fri, 7 Jun 2019 15:03:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190607120304.GH7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-20-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:19PM +0200, Jacopo Mondi wrote:
> Enable the GAMMA_LUT KMS property using the framework helpers to
> register the proeprty and the associated gamma table size maximum size.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index e6d3df37c827..c920fb5dba65 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1207,6 +1207,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	    rcdu->cmms[swindex]) {
>  		rcrtc->cmm = rcdu->cmms[swindex];
>  		rgrp->cmms_mask |= BIT(hwindex % 2);
> +
> +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);

This change looks good, but you also need to add support for legacy API.
According to the function's documentation,

 * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
 * legacy &drm_crtc_funcs.gamma_set callback.

>  	}
>  
>  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> 

-- 
Regards,

Laurent Pinchart
