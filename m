Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B106A9AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 15:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfGPNc0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 09:32:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:20216 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfGPNc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 09:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563283944;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8mz6aWMUS/XpFE++5r1IztZv0Z9gZ0BIsNuqP/EzEN8=;
        b=bWpRLwdlrp4lRAR2BjbVWsyo1hLoi02wCzhg0s7QWQUjwIqsBRElt95ATJ0KnPk58q
        ZFOYawMB6dVk4zL6UsP64uwUqMDNKbwKItI68ZMhoXyEH74xm1YPkJuL1lwg03FCWQpb
        FT55Je2vHmXDwG0leRuCUnkGdc+xbvXRqO0zjeQ9thH63xmm23JFbHxhIQOSxXcV0ivD
        5Pc36tNMQ7sL80dTL/xmCkP3lzL44ZlJManJa76LPVxhOBtzVQueBY5Y8oskR7PHaZql
        mGTMaW//IZQj3P8kClA7LN+3HVXKRvPEuIbJIbO5OA3ydFWKt1LY6HJvX2Tcgys9WNlN
        dMfw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6GDWMcYQ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jul 2019 15:32:22 +0200 (CEST)
Date:   Tue, 16 Jul 2019 15:32:22 +0200 (CEST)
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
Message-ID: <273966608.62651.1563283942512@webmail.strato.com>
In-Reply-To: <20190706140746.29132-19-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-19-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 18/19] drm: rcar-du: crtc: Register GAMMA_LUT
 properties
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
> Enable the GAMMA_LUT KMS property using the framework helpers to
> register the proeprty and the associated gamma table size maximum size.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
> -- 
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
