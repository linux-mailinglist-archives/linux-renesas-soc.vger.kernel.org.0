Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB446E5AF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 09:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbjDRHvx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 03:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbjDRHvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 03:51:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA11B525E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 00:51:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 098A1802;
        Tue, 18 Apr 2023 09:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681804184;
        bh=v2u4LNXCU7lB0ofRNe6LSiK35oTUg0RsosfcxK/5lZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s27+3FyVt6okWcHG/xM/OMWJe8oT32gul+Z3jl7/1ehLniHbdXQ2b+BM8spJK5HtQ
         Aa2ezaJTkGIZQSsu/uLaw/WalqmYW3l74uuZrZOgfsxsNvbFKVHdB5Aidg/AB14AiI
         abVSr4DmpBzArXjQ3nl3u/6QmyraRyu9dI95h21I=
Date:   Tue, 18 Apr 2023 10:50:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/5] drm: shmobile: Fixes and enhancements
Message-ID: <20230418075000.GF4703@pendragon.ideasonboard.com>
References: <cover.1681734821.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1681734821.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Apr 17, 2023 at 03:40:20PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Currently, there are two drivers for the LCD controller on Renesas
> SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
>   1. sh_mobile_lcdcfb, using the fbdev framework,
>   2. shmob_drm, using the DRM framework.
> However, only the former driver can be used, as all platform support
> integrates the former.  None of these drivers support DT-based systems.
> 
> This patch series is a first step to enable the SH-Mobile DRM driver for
> Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned is
> to add DT support.
> 
> Changes compared to v1:
>   - Add Reviewed-by,
>   - Drop dependency on ARM.
> 
> This has been tested on the R-Mobile A1-based Atmark Techno
> Armadillo-800-EVA development board, using a temporary
> platform-enablement patch[1].
> 
> Thanks for applying to drm-misc!

Would you like to request drm-misc committer rights ? :-)

> [1] https://lore.kernel.org/r/c03d4edbd650836bf6a96504df82338ec6d800ff.1680272980.git.geert+renesas@glider.be
> 
> 
> Geert Uytterhoeven (5):
>   drm: shmobile: Use %p4cc to print fourcc codes
>   drm: shmobile: Add support for DRM_FORMAT_XRGB8888
>   drm: shmobile: Switch to drm_crtc_init_with_planes()
>   drm: shmobile: Add missing call to drm_fbdev_generic_setup()
>   drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms
> 
>  drivers/gpu/drm/shmobile/Kconfig           |  4 +--
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 35 +++++++++++++++++++---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c   |  3 ++
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c   |  9 ++++--
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  5 ++++
>  5 files changed, 48 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
