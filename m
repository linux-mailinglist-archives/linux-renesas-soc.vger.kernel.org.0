Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECCD8B03C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 20:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbfIKSkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 14:40:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbfIKSkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 14:40:33 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7FCA33A;
        Wed, 11 Sep 2019 20:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568227230;
        bh=Cm4wbCtI9Gzn79VIY7AbQ+F58/Qss2DHcbMDeHO/vJs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Fbg0AjCoUSm7qfE40KzniJtnT5TizMqaZtackRBNACafqaOFix0cU/S0G2GsgWZZp
         SFELE0Ia/I4Nb/23kJ/cdIM7+BoZiojzlMpKdY7M4iDuFnnNgY/yuy2FzHt77y2Kar
         M20BaTZ9u+k9ljLFN33eSXoPzHPeJm8fJ1pqJ5Sk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 6/9] drm: rcar-du: crtc: Enable and disable CMMs
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-7-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <bc443263-5f20-f022-34c8-1e521243dec1@ideasonboard.com>
Date:   Wed, 11 Sep 2019 19:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-7-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 06/09/2019 14:54, Jacopo Mondi wrote:
> Enable/disable the CMM associated with a CRTC at CRTC start and stop
> time and enable the CMM unit through the Display Extensional Functions
> register at group setup time.
> 
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 7 +++++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 23f1d6cc1719..3dac605c3a67 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_vblank.h>
>  
> +#include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> @@ -619,6 +620,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_disable(rcrtc);
>  
> +	if (rcrtc->cmm)
> +		rcar_cmm_disable(rcrtc->cmm);
> +
>  	/*
>  	 * Select switch sync mode. This stops display operation and configures
>  	 * the HSYNC and VSYNC signals as inputs.
> @@ -686,6 +690,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	rcar_du_crtc_start(rcrtc);
> +
> +	if (rcrtc->cmm)
> +		rcar_cmm_enable(rcrtc->cmm);
>  }
>  
>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..25d0fc125d7a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
> +		u32 defr7 = DEFR7_CODE
> +			  | (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0)
> +			  | (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> +
> +		rcar_du_group_write(rgrp, DEFR7, defr7);
> +	}
> +

What's the effect here on platforms with a CMM, but with
CONFIG_DRM_RCAR_CMM unset?

Will this incorrectly configure the DU ?

Will it stall the display if the DU tries to interact with another
module which is not enabled?


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
> 

