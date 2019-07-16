Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8866A9AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 15:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfGPNbv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 09:31:51 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:13717 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfGPNbv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 09:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563283909;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=KdPMpB0y5dptUz67d+BuffnN6XjmeBJuRxebWH6cybA=;
        b=nxJuMmsxe0bcToeevZltllqpYrR0xr14RmIxoY9vvMKLmviJ9dMUOKNC2g/fOAwhIF
        Y6snyMLFf5tRL/uBbDKYy84muA7pg2K6P8V27bnJ8pp+9NrIf8MYX3hTBTcIipkiKUER
        ZNVaqZpJPWPu12vwBEb2qsb4pe86EA/Dy8iAqCObp/lOlgk+FIwRKkTe9nmgtT8U+qUv
        sJ9Cdz4Esz6PStJgUUjo79itxkPw7Z8lbOWEXXz3FhGF4SM8sEppd01oq6qqH+6w+bwm
        KSFfcHklZ+HqXNa9Ig7R+/tm/zCc7VaHT0kckucTZrqajMFRgEEedB7HQkf8RcshOTkB
        KBzA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6GDVkcXc
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jul 2019 15:31:46 +0200 (CEST)
Date:   Tue, 16 Jul 2019 15:31:46 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Message-ID: <1146567928.62608.1563283906754@webmail.strato.com>
In-Reply-To: <20190706140746.29132-18-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-18-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 17/19] drm: rcar-du: crtc: Enable and disable CMMs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.152.154
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On July 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> 
> 
> Enable/disable the CMM associated with a CRTC at crtc start and stop
> time and enable the CMM unit through the Display Extensional Functions
> register at group setup time.
> 
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
> index 9eee47969e77..d252c9bb9809 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
> +		u32 defr7 = DEFR7_CODE |
> +			    (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> +			    (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> +
> +		rcar_du_group_write(rgrp, DEFR7, defr7);
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

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
