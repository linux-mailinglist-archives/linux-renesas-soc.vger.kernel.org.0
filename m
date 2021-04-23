Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3537369C15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 23:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235662AbhDWVi2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 17:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbhDWVi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 17:38:28 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D114AC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=51iOC7xvV0hcI12VcCk48e2N7IFgweTm9mbqyPbi1KM=; b=mxHvRz17/L+xQXSKN+YZ72sRAY
        0KE7oJRniMimhTIiqcRf52qWKJtbGxbCSnEb3TRFWeo7w426UcA3sCeDHDEr6v5s0jJDSuoxnrclj
        6IMOnDuR/hwQUm0fmY432LWNW82+S5llQZUzaDzlBqIKmaiwstWyQ8rGigF+9R0om7RZDdFhcxy8x
        +/NhAJVw8JxzQQG3XMIUFd1GP9P3rogT5ScroSr4eagl8LYQEv7ZsqwTADn64FzA/Msef60IYeoKk
        2RcPhW9dJxYZwzbehRdgidh/MwtkDZt+aOAbW69dp7vVtXID6pmcyndHrNCdc+mcR7RbjhMmhnU7/
        8nCAs5Nw==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1la3UU-002Ra1-DQ; Fri, 23 Apr 2021 21:37:35 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] drm: rcar-du: fix linker undefined references
Date:   Fri, 23 Apr 2021 14:37:27 -0700
Message-Id: <20210423213727.27751-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When DRM_RCAR_DU=y and DRM_RCAR_LVDS=m, there are several build errors
as reported by 'kernel test robot'. These can be corrected by changing
"imply" to "select".

In looking at this, the same problem (build errors) happens when
DRM_RCAR_DU=y and DRM_RCAR_CMM=m, so again change the "imply" to
"select" here as well.

These 2 changes fix the following 8 build/link errors:

aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
rcar_du_crtc.c:(.text+0x1be8): undefined reference to `rcar_lvds_clk_enable'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
rcar_du_crtc.c:(.text+0x2438): undefined reference to `rcar_lvds_clk_disable'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
rcar_du_drv.c:(.init.text+0x14): undefined reference to `rcar_du_of_init'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
rcar_du_encoder.c:(.text+0x1d4): undefined reference to `rcar_lvds_dual_link'

aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_cmm_setup':
rcar_du_crtc.c:(.text+0x380): undefined reference to `rcar_cmm_setup'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
rcar_du_crtc.c:(.text+0x1c08): undefined reference to `rcar_cmm_enable'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
rcar_du_crtc.c:(.text+0x231c): undefined reference to `rcar_cmm_disable'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function `rcar_du_modeset_init':
rcar_du_kms.c:(.text+0xd08): undefined reference to `rcar_cmm_init'

Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
Fixes: 02f2b30032c1 ("drm: rcar-du: lvds: Add API to enable/disable clock output")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux-next-20210420/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,8 +4,8 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
-	imply DRM_RCAR_CMM
-	imply DRM_RCAR_LVDS
+	select DRM_RCAR_CMM
+	select DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
