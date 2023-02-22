Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2BD69EFE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 09:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjBVIHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 03:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjBVIHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 03:07:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611CF28222
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 00:07:15 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 202494E1;
        Wed, 22 Feb 2023 09:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677053233;
        bh=d7GOIS+Ej2KfXope9MuGbfcUaN48P7nxpib4yMiTsKE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jMjyCRA2VF561lAYOHh5lxtmsYU2PZY2BEXL+H2pyjqVmanUEtYlQmIJtUAhiHZ2K
         ImLg69/XkQhN0Fz/OvWFeMCcfRDBWkF7BomngVqjuCkIbnD4uOvNiF7CMhh6NLMaAC
         02N8K8zFsrnwuiSAl6F954li2D9INKKQIZbTp/rE=
Message-ID: <43324903-96e2-29ef-5a38-01cee2d4b0f0@ideasonboard.com>
Date:   Wed, 22 Feb 2023 10:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] drm: rcar-du: Don't write unimplemented ESCR and OTAR
 registers on Gen3
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222050623.29080-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222050623.29080-2-laurent.pinchart+renesas@ideasonboard.com>
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
> The ESCR and OTAR registers are not present in all DU channels on Gen3
> SoCs. ESCR only exists in channels that can be routed to an LVDS or
> DPAD, and OTAR in channels that can be routed to a DPAD. Skip writing
> those registers for other channels. This replaces the DU gen check, as
> Gen4 doesn't have LVDS or DPAD outputs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 5e552b326162..d6d29be6b4f4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -298,12 +298,25 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>   		escr = params.escr;
>   	}
>   
> -	if (rcdu->info->gen < 4) {
> +	/*
> +	 * The ESCR register only exists in DU channels that can output to an
> +	 * LVDS or DPAT, and the OTAR register in DU channels that can output
> +	 * to a DPAD.
> +	 */
> +	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS0].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS1].possible_crtcs) &
> +	    BIT(rcrtc->index)) {
>   		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
>   
>   		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
> +	}
> +
> +	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
> +	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs) &
> +	    BIT(rcrtc->index))
>   		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
> -	}
>   
>   	/* Signal polarities */
>   	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

