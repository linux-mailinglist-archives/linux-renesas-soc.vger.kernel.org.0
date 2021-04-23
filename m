Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BC5369C65
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Apr 2021 00:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244107AbhDWWFs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 18:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhDWWFs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 18:05:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048BAC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 15:05:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FF0BEE;
        Sat, 24 Apr 2021 00:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619215509;
        bh=0BDFbBpkwMEvoaPYProOGdPMsK+mtQelk+lasuSOp+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JEz0mjkA+ekx/wwerrhW/qPTgtQ8KnJLZqWgQwMUtRLtB4BmAn1MrSSEDfr01rLvD
         eQi13SuzQiEqJeli7AIqlkDVtnL/SZmZzBCHvwClldTCnJkJrtxtZ3LZrFeUOVqs5q
         AL2YDlUlOU+qIH4P8ebj1ncDqFqAnsH7viyxsOR4=
Date:   Sat, 24 Apr 2021 01:05:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] drm: rcar-du: fix linker undefined references
Message-ID: <YINEkLqT6keqhzKX@pendragon.ideasonboard.com>
References: <20210423213727.27751-1-rdunlap@infradead.org>
 <YINAJP1iPwsukLah@pendragon.ideasonboard.com>
 <dca3ea68-9259-25f9-3d89-983783f9f7da@infradead.org>
 <a1096c8e-65ef-042c-5293-0785e1e21dba@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1096c8e-65ef-042c-5293-0785e1e21dba@infradead.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Randy,

On Fri, Apr 23, 2021 at 03:02:27PM -0700, Randy Dunlap wrote:
> On 4/23/21 2:56 PM, Randy Dunlap wrote:
> > On 4/23/21 2:46 PM, Laurent Pinchart wrote:
> >> On Fri, Apr 23, 2021 at 02:37:27PM -0700, Randy Dunlap wrote:
> >>> When DRM_RCAR_DU=y and DRM_RCAR_LVDS=m, there are several build errors
> >>> as reported by 'kernel test robot'. These can be corrected by changing
> >>> "imply" to "select".
> >>>
> >>> In looking at this, the same problem (build errors) happens when
> >>> DRM_RCAR_DU=y and DRM_RCAR_CMM=m, so again change the "imply" to
> >>> "select" here as well.
> >>>
> >>> These 2 changes fix the following 8 build/link errors:
> >>>
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function 
> >>> `rcar_du_crtc_atomic_enable':
> >>> rcar_du_crtc.c:(.text+0x1be8): undefined reference to 
> >>> `rcar_lvds_clk_enable'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function 
> >>> `rcar_du_crtc_atomic_disable':
> >>> rcar_du_crtc.c:(.text+0x2438): undefined reference to 
> >>> `rcar_lvds_clk_disable'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function 
> >>> `rcar_du_init':
> >>> rcar_du_drv.c:(.init.text+0x14): undefined reference to 
> >>> `rcar_du_of_init'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in 
> >>> function `rcar_du_encoder_init':
> >>> rcar_du_encoder.c:(.text+0x1d4): undefined reference to 
> >>> `rcar_lvds_dual_link'
> >>>
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function 
> >>> `rcar_du_cmm_setup':
> >>> rcar_du_crtc.c:(.text+0x380): undefined reference to `rcar_cmm_setup'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function 
> >>> `rcar_du_crtc_atomic_enable':
> >>> rcar_du_crtc.c:(.text+0x1c08): undefined reference to `rcar_cmm_enable'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function 
> >>> `rcar_du_crtc_atomic_disable':
> >>> rcar_du_crtc.c:(.text+0x231c): undefined reference to `rcar_cmm_disable'
> >>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function 
> >>> `rcar_du_modeset_init':
> >>> rcar_du_kms.c:(.text+0xd08): undefined reference to `rcar_cmm_init'
> >>>
> >>> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> >>> Fixes: 02f2b30032c1 ("drm: rcar-du: lvds: Add API to enable/disable 
> >>> clock output")
> >>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: linux-renesas-soc@vger.kernel.org
> >>> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>>   drivers/gpu/drm/rcar-du/Kconfig |    4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> --- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/Kconfig
> >>> +++ linux-next-20210420/drivers/gpu/drm/rcar-du/Kconfig
> >>> @@ -4,8 +4,8 @@ config DRM_RCAR_DU
> >>>       depends on DRM && OF
> >>>       depends on ARM || ARM64
> >>>       depends on ARCH_RENESAS || COMPILE_TEST
> >>> -    imply DRM_RCAR_CMM
> >>> -    imply DRM_RCAR_LVDS
> >>> +    select DRM_RCAR_CMM
> >>> +    select DRM_RCAR_LVDS
> >>
> >> No all platforms that integrate a DU have CMM and/or LVDS support, so we
> >> shouldn't select the automatically.
> >>
> >> Would
> >>
> >>     depends on DRM_RCAR_CMM || DRM_RCAR_CMM=n
> >>     depends on DRM_RCAR_LVDS || DRM_RCAR_LVDS=n
> > 
> > Looks good; I like it, but kconfig does not:
> > 
> > $ xbuild_arm64.sh  oldconfig
> > make[1]: Entering directory 
> > '/home/rdunlap/lnx/next/linux-next-20210420/ARM64'
> >    GEN     Makefile
> > drivers/gpu/drm/rcar-du/Kconfig:2:error: recursive dependency detected!
> > drivers/gpu/drm/rcar-du/Kconfig:2:    symbol DRM_RCAR_DU depends on 
> > DRM_RCAR_CMM
> > drivers/gpu/drm/rcar-du/Kconfig:17:    symbol DRM_RCAR_CMM depends on 
> > DRM_RCAR_DU
> > For a resolution refer to Documentation/kbuild/kconfig-language.rst
> > subsection "Kconfig recursive dependency limitations"
> > 
> >> work ? I thought that's what "imply" meant, but it seems I got it wrong.
> >>
> >>>       select DRM_KMS_HELPER
> >>>       select DRM_KMS_CMA_HELPER
> >>>       select DRM_GEM_CMA_HELPER
> 
> There is some documentation (kconfig-language.rst) that says that when a 
> driver Kconfig is using mixed builtin and loadable modules, the driver 
> should be using IS_REACHABLE(). The example also uses "imply", so maybe
> we should/could try something like that:
> If CMM is REACHBLE(), make the calls.
> If LVDS is READABLE(), make the calls.
> 
> I can look into that some more if you want me to.
> Or I'll be happy to let you do so. :)

If you have time to have a look, I'd be very happy about that. I can't
promise to repay it with a drink at the next conference, but I hope that
will change sooner than later :-)

-- 
Regards,

Laurent Pinchart
