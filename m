Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF161AE1AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 17:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgDQP4w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 11:56:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50219 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbgDQP4w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:56:52 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MIdW7-1jUiXm100z-00EZfR; Fri, 17 Apr 2020 17:56:27 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-fbdev@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Saeed Mahameed <saeedm@mellanox.com>, masahiroy@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, daniel@ffwll.ch, marex@denx.de,
        stefan@agner.ch, linux-graphics-maintainer@vmware.com,
        thellstrom@vmware.com, jfrederich@gmail.com, dsd@laptop.org,
        geert@linux-m68k.org
Subject: [PATCH 8/8] drm/bridge/sii8620: fix extcon dependency
Date:   Fri, 17 Apr 2020 17:55:53 +0200
Message-Id: <20200417155553.675905-9-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UJfZE5doXQXPVZErHGo/jr5SBujC3aYcMMYtNkgKRBF2nc0duPM
 08ExwIQTE+EcQe7GilksYVZq8wjVRkU8P8k3vB5MKuopHwNqy/AjaVPeZeCJmXH6egv4IqM
 VZEQBI/GcnYuDWE25eDN5M9eQPLp1/MvtAC8sE37e4xQqQR79mx3h6eHTZvuvxCt2guGuX8
 HdzQN1IbXJRnIpaPlG44g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:miWYTRa2EbE=:JuLeeZ/tDWudAlfDrZtrJ+
 ARPya4R+tGG5n6EGjv3NzTtynhx8vdzXF8zC38jHjKqlocFRzyVABI5PTCFNhK9Z9/moLt6pG
 qX7Z8rlopstKaL8fIyZ4gkEeVIPyvABY83MTg7mPwTtrz4glfgy8LSGdesRSUfK/xk3suUSGs
 /fGdtkxYNQ0lRBk8n4e+b/fYoLNNLsooxKLt9XkYbFDFULavPYAabmm8XQi8WNgZfhDskwAyk
 XE9JKinpRPx7N5AF8A/J3PEKUz3KKwQri6QVUtX7AlUMiTWVY+pA6gCAO0zN9bTf9yJfLOB6K
 PIN/r+U+jkYXts/yJIiuEj9AqNalQcp1rCdLdFHU3TiWNBOMECqKOwn5MaIE6VE/MN9mSIqYP
 BpOnX+GFaVeYBIV0obo/p0bNEqm1pOcxWnDuvDvGZPWIEGajuBDyeC++Wz5Fb1aI9WC/jtXKn
 YQu3z8pzjJJzn8r3wxlSWsMjtDc9w095nSiCcB/t1EG7U/qRqKOJICstwhYJjQUB+SKBwYC9D
 8okqr8N8tRBxjwjECmzqMOzVtUixGEXOlHwJwv5BIDOSikqZoXNJuaDJhprJlwpelTDl/d5kt
 1lKcaO9LFcS5SZE0SQ0kyOEb/zbxUzuTuzrql1DT3q770SqP0u5JO07YfEO40BVSj5bl60IC5
 M45DeEeqwc3/c81jQjuAfj3wfp8oFYCt15oUAQFGxgQcD/mqMyqJv6QTUTKdIQXWGhiCJH2mZ
 RfQ0nirokH8sfCDhLVkZZHNFFcrwSL7rV3FY8FR/mrQbTXRW2hYlWXz0YaRfTK1Nf/7Ejnntq
 ZnsXjna2GcTDIeVcbVtCt6yCdYwh1bm1Gt0Z64lvDB98iBfMZ4=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Using 'imply' does not work here, it still cause the same build
failure:

arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_remove':
sil-sii8620.c:(.text+0x1b8): undefined reference to `extcon_unregister_notifier'
arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_probe':
sil-sii8620.c:(.text+0x27e8): undefined reference to `extcon_find_edev_by_node'
arm-linux-gnueabi-ld: sil-sii8620.c:(.text+0x2870): undefined reference to `extcon_register_notifier'
arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_extcon_work':
sil-sii8620.c:(.text+0x2908): undefined reference to `extcon_get_state'

Now that the framebuffer configuration is cleaned up, we can use the
usual 'depends on EXTCON || !EXTCON' trick.

Fixes: 7a109673899b ("drm/bridge/sii8620: add Kconfig dependency on extcon")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index aaed2347ace9..29c837625f03 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,7 +90,7 @@ config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	imply EXTCON
+	depends on EXTCON || !EXTCON
 	depends on RC_CORE || !RC_CORE
 	help
 	  Silicon Image SII8620 HDMI/MHL bridge chip driver.
-- 
2.26.0

