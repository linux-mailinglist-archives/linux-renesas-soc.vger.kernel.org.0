Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05B9ABAED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 16:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390644AbfIFOdX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 10:33:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59594 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388714AbfIFOdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 10:33:23 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C02D542;
        Fri,  6 Sep 2019 16:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567780401;
        bh=e8eKG77p40C7hywk1oNcsdbBOVT2AOHv/tMo08FuJ/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rAotsIthvobIw1BtvM91jO/MRRxK3+QekpnNr+D4WHF318iik+Bhi8/YLdTd0bG1h
         QLGzEmrMIUvHEg/RWETqPNoA/WIRdRqiBk/jyjfN8SgYtUpxoxksMA0WKmqt7d2CL2
         AMFUps/ivmLM5Eni2cNN3oQJICCEEjtvWAyt98js=
Date:   Fri, 6 Sep 2019 17:33:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Message-ID: <20190906143312.GB5028@pendragon.ideasonboard.com>
References: <20190906135012.10285-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190906135012.10285-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Fri, Sep 06, 2019 at 03:50:12PM +0200, Jacopo Mondi wrote:
> Expand comment in the 'vsps' parsing routine to specify the LIF
> channel index defaults to 0 in case the second cell of the property
> is not specified to remain compatible with older DT bindings.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> This trivial change is a leftover from a series that Geert already
> took in. Re-sending as I forgot to add the dri list.
> 
> Laurent, could you pick this one please?

Done, thank you.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index fc30fff0eb8d..cb636637032d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -625,7 +625,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> 
>  		vsps[j].crtcs_mask |= BIT(i);
> 
> -		/* Store the VSP pointer and pipe index in the CRTC. */
> +		/*
> +		 * Store the VSP pointer and pipe index in the CRTC. If the
> +		 * second cell of the 'vsps' specifier isn't present, default
> +		 * to 0 to remain compatible with older DT bindings.
> +		 */
>  		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
>  		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
>  	}

-- 
Regards,

Laurent Pinchart
