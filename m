Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A249C55B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 20:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfHYSGM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 14:06:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfHYSGM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 14:06:12 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7FF02AF;
        Sun, 25 Aug 2019 20:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566756370;
        bh=lBAVu3BvYKEhnL0n2Ee6whQUDPvoADQQBayYvub49IQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XZIpVwc4fUdqFEt9hUAkzj+nBm29yCV2170fgrJvYh9VuswDmf7ibCx/0/yxbl8SH
         g8NmputyIT0pbMbzrQSZtqA187YHM4voihecFPWazRgxIXs98I1SWY49c7C2XnnccO
         Gpoybc4H8TE69NIqXV+puDTde+jhGVERiVd1gaFA=
Date:   Sun, 25 Aug 2019 21:06:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Message-ID: <20190825180603.GB5436@pendragon.ideasonboard.com>
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
 <20190825140135.12150-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825140135.12150-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

How about changing the subject to "drm: rcar-du: Document DT backward
compatibility" ?

On Sun, Aug 25, 2019 at 04:01:35PM +0200, Jacopo Mondi wrote:
> Exand comment in the 'vsps' parsing routine to specify why the LIF

s/Exand/Expand/

> channel index is defaulted to 0 in case the second cell of the property

s/is defaulted to 0/defaults to 0/

> is not specified.

You could explain it here too :-)

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 2dc9caee8767..0d59f390de19 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -585,7 +585,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
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
