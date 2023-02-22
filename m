Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6EF569EF79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 08:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjBVHjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 02:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjBVHjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 02:39:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B782934308
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 23:39:10 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9059D4E1;
        Wed, 22 Feb 2023 08:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677051548;
        bh=t+TMtD5Zn03WHd6qsYl9LuMZ9DpfHfQ3aY7iciJ4+jE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EGYTGnyHxX47k+womJZ3Tf8JAjTVoU5zAifAei9u5eIsc7wKuYR4hAyTceLbIweYd
         tiYytMnRi+kGEm76sNHaPt45bXki5YZzPKAcPAUr8ae538Mdbm6iZZ0iJqlkyb+7En
         XVoGTlDSWv7xaXDv1/tvlJM8tN1Ec4wezlGSdYzU=
Message-ID: <118bf036-de06-959f-49cc-6de0233100a0@ideasonboard.com>
Date:   Wed, 22 Feb 2023 09:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] drm: rcar-du: Disable alpha blending for DU planes
 used with VSP
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222050623.29080-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222050623.29080-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/02/2023 07:06, Laurent Pinchart wrote:
> When the input to a DU channel comes from a VSP, the DU doesn't perform
> any blending operation. Select XRGB8888 instead of ARGB8888 to ensure
> that the corresponding registers don't get written with invalid values.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index fe90be51d64e..45c05d0ffc70 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -73,7 +73,7 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
>   			.src.y2 = mode->vdisplay << 16,
>   			.zpos = 0,
>   		},
> -		.format = rcar_du_format_info(DRM_FORMAT_ARGB8888),
> +		.format = rcar_du_format_info(DRM_FORMAT_XRGB8888),
>   		.source = RCAR_DU_PLANE_VSPD1,
>   		.colorkey = 0,
>   	};

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

