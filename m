Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8803D5F28D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 08:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiJCGyU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 02:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiJCGxw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 02:53:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAE541981
        for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Oct 2022 23:53:04 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D696C440;
        Mon,  3 Oct 2022 08:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664779967;
        bh=WSm2lNA2hd35oorfaRNimpwxUWCIfKlJOXYQy9pzF+E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gM0MZAIRGNlo3H9Ukn/2BtamGe6diu+eKBSIjCbkgy5+qu6cjSbtYsCBEUdnjqXOH
         5fmIX9qa1PY+UCCX+Bhnjqg4tkgCrXU+wSnD2nJ4Qxi4yMD1ELO15iTH6vq3yAYc3V
         5m73kJVukSu8wAdvc9eSe3bFPnHR7i70S8SgjjHo=
Message-ID: <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
Date:   Mon, 3 Oct 2022 09:52:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and
 RCAR_MIPI_DSI
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 02/10/2022 01:03, Laurent Pinchart wrote:
> When the R-Car MIPI DSI driver was added, it was a standalone encoder
> driver without any dependency to or from the R-Car DU driver. Commit
> 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> added a direct call from the DU driver to the MIPI DSI driver, without
> updating Kconfig to take the new dependency into account. Fix it the
> same way that the LVDS encoder is handled.
> 
> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index c959e8c6be7d..fd2c2eaee26b 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
>   	select OF_FLATTREE
>   	select OF_OVERLAY
>   
> +config DRM_RCAR_USE_MIPI_DSI
> +	bool "R-Car DU MIPI DSI Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RCAR_DU
> +	help
> +	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> +
>   config DRM_RCAR_MIPI_DSI
> -	tristate "R-Car DU MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> +	def_tristate DRM_RCAR_DU
> +	depends on DRM_RCAR_USE_MIPI_DSI
>   	select DRM_MIPI_DSI
> -	help
> -	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>   
>   config DRM_RCAR_VSP
>   	bool "R-Car DU VSP Compositor Support" if ARM
> 
> base-commit: 7860d720a84c74b2761c6b7995392a798ab0a3cb

Interesting dependency issue. Took me a while to understand it =).

But is there a reason to not have "depends on DRM_RCAR_DU" for 
DRM_RCAR_USE_MIPI_DSI and DRM_RCAR_USE_LVDS? Now the menu items are 
available even if RCAR_DU is n. That's also the case for 
DRM_RCAR_DW_HDMI, but I'm not sure if that's supposed to be usable even 
without RCAR_DU.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
