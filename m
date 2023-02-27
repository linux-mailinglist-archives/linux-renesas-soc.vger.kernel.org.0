Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B066A44BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 15:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjB0Oiy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 09:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjB0Oiy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 09:38:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF1C1ACDB;
        Mon, 27 Feb 2023 06:38:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (85-76-78-34-nat.elisa-mobile.fi [85.76.78.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F41C56A;
        Mon, 27 Feb 2023 15:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677508728;
        bh=flL3K74FpmQhbfYWrxtIBKmRyaIm0PL2gw4qy434ZP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RZDkwCgfR/ZjHWQxvkQiEwJAqsxC3NWoKOgQsAILaOfXPOZ8SgnHxmyRulFSvLO1g
         DP8EZ4QST+GAmivQm2aMRlpexQ/E2CsRQvpAQ4F8h9fQqQF+S8Pu3Zd0XGpiBufQRT
         6rschwE3fyKsHdrhaDAFUkl+fmOzGkofwa/WTq2s=
Date:   Mon, 27 Feb 2023 16:38:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Fix a NULL vs IS_ERR() bug
Message-ID: <Y/zAWdgjKQjvdmXr@pendragon.ideasonboard.com>
References: <Y/yAw6sHu82OnOWj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/yAw6sHu82OnOWj@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Mon, Feb 27, 2023 at 01:06:59PM +0300, Dan Carpenter wrote:
> The drmm_encoder_alloc() function returns error pointers.  It never
> returns NULL.  Fix the check accordingly.
> 
> Fixes: 7a1adbd23990 ("drm: rcar-du: Use drmm_encoder_alloc() to manage encoder")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index b1787be31e92..7ecec7b04a8d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -109,8 +109,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
>  				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
>  				  NULL);
> -	if (!renc)
> -		return -ENOMEM;
> +	if (IS_ERR(renc))
> +		return PTR_ERR(renc);
>  
>  	renc->output = output;
>  

-- 
Regards,

Laurent Pinchart
