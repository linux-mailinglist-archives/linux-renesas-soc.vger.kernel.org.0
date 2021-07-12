Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C243C5B7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhGLL2W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:28:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhGLL2V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:28:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 641AACC;
        Mon, 12 Jul 2021 13:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626089132;
        bh=AcmxZ+QiPreemJeQ4MkgH5L1dZQ4jhY7jwo8WBth7r8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P84kdNZ+UJ7ZrGJv/F1d8F5WczxCwnMuqAGJ6yuixY9Hw+ugxzxjThsRKFlgxHJrB
         /02q6bWR4RN3qlR505cwWq2f5QJQV2m5MPlKk7tJBDpYq58z27KXHa0qckTmj9ee9b
         gAweMje4CAu5sHMMY5TnfHogM00JdZ4z0eeBX4Sk=
Date:   Mon, 12 Jul 2021 14:24:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Restore graphical consoles
Message-ID: <YOwmfqZnVzcsp+T/@pendragon.ideasonboard.com>
References: <2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Mon, Jul 12, 2021 at 12:16:57PM +0200, Geert Uytterhoeven wrote:
> As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> CONFIG_FB"), CONFIG_FB is no longer auto-enabled.  While CONFIG_FB may
> be considered unneeded for systems where graphics is provided by a DRM
> driver, R-Mobile A1 still relies on a frame buffer device driver for
> graphics support.
> 
> Restore support for graphics on R-Mobile A1 and graphical consoles on
> DRM-based systems by explicitly enabling CONFIG_FB in the defconfig for
> Renesas ARM systems.

Does anyone still care about the Armadillo board ?

This being said, I think CONFIG_FB should be added , but for a different
reason. There's no KMS console driver, so the only option we have today,
even when a KMS driver is available, is to go through FBDEV emulation,
which requires CONFIG_FB to be enabled.

> Fixes: f611b1e7624ccdbd ("drm: Avoid circular dependencies for CONFIG_FB")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued as a fix for v5.14.
> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 66c8b0980a0a744d..d9a27e4e09140b43 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -135,6 +135,7 @@ CONFIG_DRM_SII902X=y
>  CONFIG_DRM_SIMPLE_BRIDGE=y
>  CONFIG_DRM_I2C_ADV7511=y
>  CONFIG_DRM_I2C_ADV7511_AUDIO=y
> +CONFIG_FB=y
>  CONFIG_FB_SH_MOBILE_LCDC=y
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_BACKLIGHT_AS3711=y

-- 
Regards,

Laurent Pinchart
