Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FB2369C53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 23:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244115AbhDWV5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 17:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244006AbhDWV4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 17:56:55 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D0DC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=v84hbqLBm76A9j4Ez4iAIyql8jD8liqw2eiruGo9PqM=; b=alN16LCNqkPlQMKgdnjObdyA5b
        a2XYttFsTsQjsfE762CyezS4VKcMv96DZWoFL5krk9AawPEhaccBrXTSRyI5oU5t6vdwJEFIm7VnT
        8lFlT3DEPSS3xDfZhuWpypBnnTv71gIhQZbd/qlkrBayFFQG1gJUgOadM8IZDQJ63tGRSwemo9NRH
        yzmlYedLnUt5CgUfLnuSkGRsw141F0tScm8vrrEelcGpcCZCn+zZrES25zboVP/gg2pXgrMkkzVbe
        Bme1S2x65aMTis9heIWfFgnQqhzeJc3I9D7dNpYZT1nZpEyeK2wdkTIInyIHn743PvnjU1fMa1Z6J
        qGgH4Byw==;
Received: from [2601:1c0:6280:3f0::6d64]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1la3mZ-002SMh-Sk; Fri, 23 Apr 2021 21:56:16 +0000
Subject: Re: [PATCH] drm: rcar-du: fix linker undefined references
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kernel test robot <lkp@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20210423213727.27751-1-rdunlap@infradead.org>
 <YINAJP1iPwsukLah@pendragon.ideasonboard.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dca3ea68-9259-25f9-3d89-983783f9f7da@infradead.org>
Date:   Fri, 23 Apr 2021 14:56:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YINAJP1iPwsukLah@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 4/23/21 2:46 PM, Laurent Pinchart wrote:
> Hi Randy,
> 
> Thank you for the patch.
> 
> On Fri, Apr 23, 2021 at 02:37:27PM -0700, Randy Dunlap wrote:
>> When DRM_RCAR_DU=y and DRM_RCAR_LVDS=m, there are several build errors
>> as reported by 'kernel test robot'. These can be corrected by changing
>> "imply" to "select".
>>
>> In looking at this, the same problem (build errors) happens when
>> DRM_RCAR_DU=y and DRM_RCAR_CMM=m, so again change the "imply" to
>> "select" here as well.
>>
>> These 2 changes fix the following 8 build/link errors:
>>
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
>> rcar_du_crtc.c:(.text+0x1be8): undefined reference to `rcar_lvds_clk_enable'
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
>> rcar_du_crtc.c:(.text+0x2438): undefined reference to `rcar_lvds_clk_disable'
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
>> rcar_du_drv.c:(.init.text+0x14): undefined reference to `rcar_du_of_init'
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
>> rcar_du_encoder.c:(.text+0x1d4): undefined reference to `rcar_lvds_dual_link'
>>
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_cmm_setup':
>> rcar_du_crtc.c:(.text+0x380): undefined reference to `rcar_cmm_setup'
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
>> rcar_du_crtc.c:(.text+0x1c08): undefined reference to `rcar_cmm_enable'
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
>> rcar_du_crtc.c:(.text+0x231c): undefined reference to `rcar_cmm_disable'
>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function `rcar_du_modeset_init':
>> rcar_du_kms.c:(.text+0xd08): undefined reference to `rcar_cmm_init'
>>
>> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
>> Fixes: 02f2b30032c1 ("drm: rcar-du: lvds: Add API to enable/disable clock output")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>   drivers/gpu/drm/rcar-du/Kconfig |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> --- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/Kconfig
>> +++ linux-next-20210420/drivers/gpu/drm/rcar-du/Kconfig
>> @@ -4,8 +4,8 @@ config DRM_RCAR_DU
>>   	depends on DRM && OF
>>   	depends on ARM || ARM64
>>   	depends on ARCH_RENESAS || COMPILE_TEST
>> -	imply DRM_RCAR_CMM
>> -	imply DRM_RCAR_LVDS
>> +	select DRM_RCAR_CMM
>> +	select DRM_RCAR_LVDS
> 
> No all platforms that integrate a DU have CMM and/or LVDS support, so we
> shouldn't select the automatically.
> 
> Would
> 
> 	depends on DRM_RCAR_CMM || DRM_RCAR_CMM=n
> 	depends on DRM_RCAR_LVDS || DRM_RCAR_LVDS=n
> 

Looks good; I like it, but kconfig does not:

$ xbuild_arm64.sh  oldconfig
make[1]: Entering directory 
'/home/rdunlap/lnx/next/linux-next-20210420/ARM64'
   GEN     Makefile
drivers/gpu/drm/rcar-du/Kconfig:2:error: recursive dependency detected!
drivers/gpu/drm/rcar-du/Kconfig:2:	symbol DRM_RCAR_DU depends on 
DRM_RCAR_CMM
drivers/gpu/drm/rcar-du/Kconfig:17:	symbol DRM_RCAR_CMM depends on 
DRM_RCAR_DU
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

> work ? I thought that's what "imply" meant, but it seems I got it wrong.
> 
>>   	select DRM_KMS_HELPER
>>   	select DRM_KMS_CMA_HELPER
>>   	select DRM_GEM_CMA_HELPER
> 


Thanks.
