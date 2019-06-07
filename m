Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74AF938987
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 13:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFGLzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 07:55:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36104 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbfFGLz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 07:55:29 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F1CCB91;
        Fri,  7 Jun 2019 13:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559908527;
        bh=f4IcuPAfvdFAu7Z4BDYW1kHQDCa3MFndDR+AG3MCt+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tT7XutRp0wnnEFrCbFHyD8wvd/Ih78T4+TTjkFHMHi0QOXrIrH5YxuNZoMNumbIW6
         S0pJgv0lBbOH2kFFmh3pWqQsssRBhjJfXCGgetWBm+Nwoo5mf5KXx0McdSmQRMrf+e
         tVEghr3/O5TniRlbMN4seVaRbIqUtj2H3t9atqpw=
Date:   Fri, 7 Jun 2019 14:55:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/20] drm: rcar-du: group: Enable DU's CMM extension
Message-ID: <20190607115513.GG7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-19-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-19-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:18PM +0200, Jacopo Mondi wrote:
> Enable the CMM units through the display unit extensional function control
> group register DEFR7.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..d252c9bb9809 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {

This is a good enough reason to keep RCAR_DU_FEATURE_CMM :-/

> +		u32 defr7 = DEFR7_CODE |
> +			    (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> +			    (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> +
> +		rcar_du_group_write(rgrp, DEFR7, defr7);

It would be nice to disable the CMM when the LUT isn't used, but that
would be difficult at the moment. We can revisit this when Kieran's DU
group handling series will land.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
> +
>  	if (rcdu->info->gen >= 2) {
>  		rcar_du_group_setup_defr8(rgrp);
>  		rcar_du_group_setup_didsr(rgrp);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index bc87f080b170..fb9964949368 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -197,6 +197,11 @@
>  #define DEFR6_MLOS1		(1 << 2)
>  #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
>  
> +#define DEFR7			0x000ec
> +#define DEFR7_CODE		(0x7779 << 16)
> +#define DEFR7_CMME1		BIT(6)
> +#define DEFR7_CMME0		BIT(4)
> +
>  /* -----------------------------------------------------------------------------
>   * R8A7790-only Control Registers
>   */

-- 
Regards,

Laurent Pinchart
