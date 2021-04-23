Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA115369C2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 23:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDWVrC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 17:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhDWVq6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 17:46:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C03C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 14:46:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCBF6332;
        Fri, 23 Apr 2021 23:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619214378;
        bh=rjGwFCEF0/GZ/zC2VSb/X8kcWmw/weOdivulaQfnK1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pa5/0aguiiP6x3B3D1wRSawG42BC5McpolhB3ngY3FDeyAD+l3ODGGSu5HowE4Exi
         WfI7N2aTeYygB5Bd0IsGF5BsYBYiSXAPT/iJToT8jyyJOlFKtPENIovCYpA1F97pKp
         cbkPkew5CqZH6XJP8YTm6zMupl7uMhDlbjifC9vo=
Date:   Sat, 24 Apr 2021 00:46:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] drm: rcar-du: fix linker undefined references
Message-ID: <YINAJP1iPwsukLah@pendragon.ideasonboard.com>
References: <20210423213727.27751-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210423213727.27751-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Randy,

Thank you for the patch.

On Fri, Apr 23, 2021 at 02:37:27PM -0700, Randy Dunlap wrote:
> When DRM_RCAR_DU=y and DRM_RCAR_LVDS=m, there are several build errors
> as reported by 'kernel test robot'. These can be corrected by changing
> "imply" to "select".
> 
> In looking at this, the same problem (build errors) happens when
> DRM_RCAR_DU=y and DRM_RCAR_CMM=m, so again change the "imply" to
> "select" here as well.
> 
> These 2 changes fix the following 8 build/link errors:
> 
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> rcar_du_crtc.c:(.text+0x1be8): undefined reference to `rcar_lvds_clk_enable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> rcar_du_crtc.c:(.text+0x2438): undefined reference to `rcar_lvds_clk_disable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
> rcar_du_drv.c:(.init.text+0x14): undefined reference to `rcar_du_of_init'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
> rcar_du_encoder.c:(.text+0x1d4): undefined reference to `rcar_lvds_dual_link'
> 
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_cmm_setup':
> rcar_du_crtc.c:(.text+0x380): undefined reference to `rcar_cmm_setup'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> rcar_du_crtc.c:(.text+0x1c08): undefined reference to `rcar_cmm_enable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> rcar_du_crtc.c:(.text+0x231c): undefined reference to `rcar_cmm_disable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function `rcar_du_modeset_init':
> rcar_du_kms.c:(.text+0xd08): undefined reference to `rcar_cmm_init'
> 
> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> Fixes: 02f2b30032c1 ("drm: rcar-du: lvds: Add API to enable/disable clock output")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/Kconfig
> +++ linux-next-20210420/drivers/gpu/drm/rcar-du/Kconfig
> @@ -4,8 +4,8 @@ config DRM_RCAR_DU
>  	depends on DRM && OF
>  	depends on ARM || ARM64
>  	depends on ARCH_RENESAS || COMPILE_TEST
> -	imply DRM_RCAR_CMM
> -	imply DRM_RCAR_LVDS
> +	select DRM_RCAR_CMM
> +	select DRM_RCAR_LVDS

No all platforms that integrate a DU have CMM and/or LVDS support, so we
shouldn't select the automatically.

Would

	depends on DRM_RCAR_CMM || DRM_RCAR_CMM=n
	depends on DRM_RCAR_LVDS || DRM_RCAR_LVDS=n

work ? I thought that's what "imply" meant, but it seems I got it wrong.

>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
>  	select DRM_GEM_CMA_HELPER

-- 
Regards,

Laurent Pinchart
