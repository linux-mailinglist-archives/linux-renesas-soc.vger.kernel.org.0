Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234CF6A9AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 15:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfGPNdv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 09:33:51 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:33416 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfGPNdv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 09:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563284029;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YA+JbVt6PLR9gPJLCe+SSmvEZqhUKqEKXMbM82smQgo=;
        b=BURE6pq4jJ0ml4P4+6t/yR5/cCc8cCUnRLnHGWuTsNu3Rwy0+LzEDWFAYe/2WIQ+nm
        2/iHuS61FnQEnfMJFF2hXO6VNRRhE5codfJOqYvv+rnvQinjR6g1C5/EjH1rrkLy1iHi
        59k3FEm7kIatt9RN7SfzYR2pg2xfIBQa6t7aPEuI+Iry6KHnidwBVoUwLLt4s+REdeJT
        Y0KDzYXBmmTbp5iPdLuqUZC2y+OqfiJawaVLDu80kODYOYC5dDQZ0MX7vRwtEgZ08b45
        wUglAMhKaOufRVXJXpyG7aewazrb3qHNIbdsgtuXEPLPrFpbqD0rlYCI0NAoksaDsUgu
        2QHw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6GDXlcYx
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jul 2019 15:33:47 +0200 (CEST)
Date:   Tue, 16 Jul 2019 15:33:47 +0200 (CEST)
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
Message-ID: <744338423.62787.1563284027376@webmail.strato.com>
In-Reply-To: <20190706140746.29132-20-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
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
> Update CMM settings at in the atomic commit tail helper method.
> 
> The CMM is updated with new gamma values provided to the driver
> in the GAMMA_LUT blob property.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index b79cda2f5531..f9aece78ca5f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -21,6 +21,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/wait.h>
>  
> +#include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> @@ -287,6 +288,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>   * Atomic Check and Update
>   */
>  
> +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> +					     struct drm_crtc_state *old_state)
> +{
> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +	struct rcar_cmm_config cmm_config = {};
> +
> +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> +		return;
> +
> +	if (!crtc->state->gamma_lut) {
> +		cmm_config.lut.enable = false;
> +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> +
> +		return;
> +	}
> +
> +	cmm_config.lut.enable = true;
> +	cmm_config.lut.table = (struct drm_color_lut *)
> +			       crtc->state->gamma_lut->data;
> +
> +	/* Set LUT table size to 0 if entries should not be updated. */
> +	if (!old_state->gamma_lut ||
> +	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
> +		cmm_config.lut.size = crtc->state->gamma_lut->length
> +				    / sizeof(cmm_config.lut.table[0]);
> +	else
> +		cmm_config.lut.size = 0;
> +
> +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> +}
> +
>  static int rcar_du_atomic_check(struct drm_device *dev,
>  				struct drm_atomic_state *state)
>  {
> @@ -329,6 +361,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  			rcdu->dpad1_source = rcrtc->index;
>  	}
>  
> +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> +
>  	/* Apply the atomic update. */
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,
> -- 
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
