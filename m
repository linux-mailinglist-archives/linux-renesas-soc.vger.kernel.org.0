Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB67347555B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 10:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241251AbhLOJnC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 04:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235889AbhLOJnC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 04:43:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FA7C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 01:43:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C284B292;
        Wed, 15 Dec 2021 10:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639561379;
        bh=SmJr5+arJ4L5EhJ8ZOy8lxRl/nWuYCIFNU3k4t6xjL0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lCe0n0Y4JYi8fkv6+HTVo5tlEe0ELAcbJcug1BK0OMg6WDCKNiNdb0F86QH7RuIoK
         RPIA+cBmGo9cdjQ7OsMPA74Ncq/i4/F039KnDHeMAcNUqmzzSrIc/whIA08SKn26IH
         HMFwYyzWSf0SycXXYC6luEYOnlngJV6L5R03yPgs=
Date:   Wed, 15 Dec 2021 11:42:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] drm: rcar-du: Add missing dependencies
Message-ID: <Ybm4oFaYgtl5+MRk@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1639559338.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patches.

On Wed, Dec 15, 2021 at 10:27:44AM +0100, Geert Uytterhoeven wrote:
> 	Hi Laurent, Kieran, et al,
> 
> This patch series adds missing dependencies to Kconfig symbols related
> to the R-Car Display Unit.  These dependencies prevent asking the user
> about R-Car display drivers when configuring a kernel without Renesas
> SoC support, or when the answer wouldn't have any impact on the kernel
> build.

Won't this have an impact when someone will regenerate an ARM64
defconfig, given that we want to keep those options enabled in
arch/arm64/configs/defconfig ?

> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
>   drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
>   drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on ARCH_RENESAS
> 
>  drivers/gpu/drm/rcar-du/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
