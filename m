Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CD9369DC3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Apr 2021 02:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbhDXAZW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 20:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbhDXAZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 20:25:21 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB301C06174A;
        Fri, 23 Apr 2021 17:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=sJ6mzEzOm3NtSuCM8j9or/o9X3YIjUZaA6m4E9jOXWA=; b=LJ2SxMxTYdweqHZvQfIx6eSPjD
        9ysOshNKGd/B6hZnOxqol5DT9WkZOvWzBei5+Qwgfco7CfTVjKx0nVFMxr7H3RR8IRmPlUMlRiCY7
        itFWdiJpvfct0n97L4VzjALVGSX3iF+hCRSDX9mhfPw5tqhoSm0oHstmJs429HeXoIRs/r7Spnvt7
        t4RAHO1JUqocmrl1pFNyCJuix6J0vm9ni/VeeKM27Op3nC4ICnKPJ/GwQ/QyOhwwTbKAi8O2aLzQy
        gtBKqfGIYpJ/Lyy2KaSpJFCaGWPNvTc0ylpDlKyx9M096PiQtJIiZ0PUwUMma9mHO9A5OnWspjMNC
        iCJu+uHA==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1la5uD-002ds2-Rp; Sat, 24 Apr 2021 00:12:18 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2] drm: rcar-du: fix linker undefined references
Date:   Fri, 23 Apr 2021 17:12:14 -0700
Message-Id: <20210424001214.30642-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When DRM_RCAR_DU=y and DRM_RCAR_LVDS=m, there are several build errors
as reported by 'kernel test robot'. These can be corrected by changing
source code occurrences of IS_ENABLED(...) to IS_REACHABLE(...).

In looking at this, the same problem (build errors) happens when
DRM_RCAR_DU=y and DRM_RCAR_CMM=m, so again change an IS_ENABLED()
to IS_REACHABLE() for this case as well.

These changes fix the following 8 build/link errors:

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

All RCAR kconfig combinations now build for me.

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
v2: also send to LKML;
    don't change Kconfig "imply" to "select" since not all platforms
    with DU have CMM and/or LVDS support. Use IS_REACHABLE() instead.

 drivers/gpu/drm/rcar-du/rcar_cmm.h   |    4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_of.h |    2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h  |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/rcar_lvds.h
+++ linux-next-20210420/drivers/gpu/drm/rcar-du/rcar_lvds.h
@@ -12,7 +12,7 @@
 
 struct drm_bridge;
 
-#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
+#if IS_REACHABLE(CONFIG_DRM_RCAR_LVDS)
 int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
 void rcar_lvds_clk_disable(struct drm_bridge *bridge);
 bool rcar_lvds_dual_link(struct drm_bridge *bridge);
--- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/rcar_du_of.h
+++ linux-next-20210420/drivers/gpu/drm/rcar-du/rcar_du_of.h
@@ -11,7 +11,7 @@
 
 struct of_device_id;
 
-#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
+#if IS_REACHABLE(CONFIG_DRM_RCAR_LVDS)
 void __init rcar_du_of_init(const struct of_device_id *of_ids);
 #else
 static inline void rcar_du_of_init(const struct of_device_id *of_ids) { }
--- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/rcar_cmm.h
+++ linux-next-20210420/drivers/gpu/drm/rcar-du/rcar_cmm.h
@@ -25,7 +25,7 @@ struct rcar_cmm_config {
 	} lut;
 };
 
-#if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
+#if IS_REACHABLE(CONFIG_DRM_RCAR_CMM)
 int rcar_cmm_init(struct platform_device *pdev);
 
 int rcar_cmm_enable(struct platform_device *pdev);
@@ -53,6 +53,6 @@ static inline int rcar_cmm_setup(struct
 {
 	return 0;
 }
-#endif /* IS_ENABLED(CONFIG_DRM_RCAR_CMM) */
+#endif /* IS_REACHABLE(CONFIG_DRM_RCAR_CMM) */
 
 #endif /* __RCAR_CMM_H__ */
