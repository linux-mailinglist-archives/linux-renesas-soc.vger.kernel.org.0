Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DF2622138
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Nov 2022 02:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiKIBLj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Nov 2022 20:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiKIBLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 20:11:22 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD2D61762
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 17:11:21 -0800 (PST)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N6Rjq53XgzHvjX;
        Wed,  9 Nov 2022 09:10:55 +0800 (CST)
Received: from dggpeml500003.china.huawei.com (7.185.36.200) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 09:11:20 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 09:11:19 +0800
From:   Yu Liao <liaoyu15@huawei.com>
To:     <airlied@gmail.com>, <daniel@ffwll.ch>,
        <tomi.valkeinen+renesas@ideasonboard.com>
CC:     <liwei391@huawei.com>, <linux-renesas-soc@vger.kernel.org>,
        <liaoyu15@huawei.com>
Subject: [PATCH] drm: rcar-du: DRM_RCAR_DU optionally depends on DRM_RCAR_MIPI_DSI
Date:   Wed, 9 Nov 2022 09:09:17 +0800
Message-ID: <20221109010917.1487750-1-liaoyu15@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If DRM_RCAR_MIPI_DSI is enabled, then DRM_RCAR_DU should depend on
DRM_RCAR_MIPI_DSI to prevent DRM_RCAR_MIPI_DSI=m and DRM_RCAR_DU=y,
which causes build errors:

aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
drivers/gpu/drm/rcar-du/rcar_du_crtc.c:760: undefined reference to `rcar_mipi_dsi_pclk_enable'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
drivers/gpu/drm/rcar-du/rcar_du_crtc.c:806: undefined reference to `rcar_mipi_dsi_pclk_disable'

Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Yu Liao <liaoyu15@huawei.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index c959e8c6be7d..b256ff962893 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,6 +4,7 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=n
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
-- 
2.25.1

