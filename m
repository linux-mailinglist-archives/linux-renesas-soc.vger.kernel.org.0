Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC16B03DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 20:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbfIKSro (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 14:47:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39258 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbfIKSro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 14:47:44 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD66A33A;
        Wed, 11 Sep 2019 20:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568227661;
        bh=KGr+ltcxu64n49g8h9L3ywBI+jkxl+RQR7VhdlE4cJE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JpETj/iKwnMtritZEVl5flVUOI3mJVXYKqbR87HUBNQegHcJKpabd5dhVeIs4JsbL
         2q+VZaiFex4VZHsfkXm2Nxf1fh9u+AX1StMUpAkSCbt6NTcwGu0Uw1zJsb7aIjVgKL
         7qyTD7sfZhAv7WwxN6w0sWqsCSofX3/jeu/ii4YY=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 7/9] drm: rcar-du: crtc: Register GAMMA_LUT properties
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-8-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <26faa0ef-c32b-df4c-a68b-ed4994aff1b0@ideasonboard.com>
Date:   Wed, 11 Sep 2019 19:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-8-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 06/09/2019 14:54, Jacopo Mondi wrote:
> Enable the GAMMA_LUT KMS property using the framework helpers to
> register the property and set the associated gamma table maximum size.
> 
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 3dac605c3a67..dc59eeec990c 100644
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
> +		drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
> +		drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE);
>  	}
>  
>  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> 

