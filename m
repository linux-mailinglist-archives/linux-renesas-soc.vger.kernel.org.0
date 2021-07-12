Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AB43C5B73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbhGLLZU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:25:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbhGLLZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:25:11 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AB26CC;
        Mon, 12 Jul 2021 13:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626088941;
        bh=pJp0lBsDcHNVmImplrx5vdsFQVWjHPvf0nq78t5w3e4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QyUJHLanS0+iN/+A+XSoHQzmNRrWwr63X28kGqk9NFxQw05SS4i7E0rY0GEHu/7UI
         /a6GJRwuy+atUsoKgobBUQas+WE6DOuUyCSkuZnjMrubOeaOwjKIZFIg31mN77dZ7Y
         WCl89yY819FTGTn9IWD9jVuScMGZLTm/cupwkl44=
Date:   Mon, 12 Jul 2021 14:21:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL] arm64: renesas: defconfig: Restore graphical
 consoles
Message-ID: <YOwlv26H1pYVCny0@pendragon.ideasonboard.com>
References: <4a671ef00b3469f8b7ffd42309c3dfb1ccb8eb8a.1626085156.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a671ef00b3469f8b7ffd42309c3dfb1ccb8eb8a.1626085156.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Mon, Jul 12, 2021 at 12:19:33PM +0200, Geert Uytterhoeven wrote:
> As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> CONFIG_FB"), CONFIG_FB is no longer auto-enabled.
> 
> Restore support for graphical consoles by enabling it explicitly in the
> defconfig for Renesas R-Car Gen3 and RZ/G2 systems.
> 
> Fixes: f611b1e7624ccdbd ("drm: Avoid circular dependencies for CONFIG_FB")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.

Why not ? We have no KMS console driver yet, FB is currently the only
option.

> To be queued in topic/renesas-defconfig, unless the rcar-du experts
> consider CONFIG_FB to be no longer needed nor wanted on systems where
> graphics are provided by a DRM driver.
> ---
>  arch/arm64/configs/renesas_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
> index 27b55fcc3bbca4dc..2fc00cadc30eb26b 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -243,6 +243,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
>  CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
>  CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
>  CONFIG_DRM_DW_HDMI_CEC=y
> +CONFIG_FB=y
>  CONFIG_FB_MODE_HELPERS=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_PWM=y

-- 
Regards,

Laurent Pinchart
