Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61EB61A926
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 21:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfEKTCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 15:02:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57282 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKTCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 15:02:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8E80D5;
        Sat, 11 May 2019 21:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557601353;
        bh=eZlahVy6ni/o8E8Jqx9yzwqtMo2LAUwZYF8Mm+pIx1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kLwBMRb8xKU06G62Th8xv0bBq4oI4SmErtOIzOslIro+AhcaGOQ7sA6/VtI1oqyWp
         mvN3yJwg+d2lO7TIpGLJi0rIuVAAeDYDQOGnYYWEvX/Tb8pb8nF7HHuS0wOxU0DBP8
         ihe910k84H6dg0rkyIZP7Wa3N0ZS5kbVngYa/2so=
Date:   Sat, 11 May 2019 22:02:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 7/9] drm: rcar-du: group: Enable CMM unit
Message-ID: <20190511190217.GB16838@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-8-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:26PM +0200, Jacopo Mondi wrote:
> Enable the CMM units present in the group through the display unit
> extensional function control group register DEFR7.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..ce25e41b04bc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> +	if (rgrp->cmms_mask) {
> +		u32 defr7 = DEFR7_CODE;
> +		defr7 |= rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0;
> +		defr7 |= rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0;
> +
> +		rcar_du_group_write(rgrp, DEFR7, defr7);
> +	}
> +

I would guard this with the CMM feature bit instead of cmms_mask, in
order to write the register with 0 if CMMs are not supported, just in
case it maye have been written to another value by the boot loader (or
before a warm reboot).

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
