Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8690422C81
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 17:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhJEPbS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 11:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbhJEPbS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 11:31:18 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71419C061749
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Oct 2021 08:29:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9ca4:a53a:9ffa:e003])
        by albert.telenet-ops.be with bizsmtp
        id 2FVR2600L11933306FVRFb; Tue, 05 Oct 2021 17:29:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mXmNh-002Hd8-6Z; Tue, 05 Oct 2021 17:29:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mXmNg-005lAW-2g; Tue, 05 Oct 2021 17:29:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] memory: RENESAS_RPCIF should select RESET_CONTROLLER
Date:   Tue,  5 Oct 2021 17:29:22 +0200
Message-Id: <e443aa66d146da5646b7ebece8876545b8621063.1633447756.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RPC-IF driver calls devm_reset_control_get_exclusive(),
which returns -ENOTSUPP if CONFIG_RESET_CONTROLLER is not enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop bogus part about reset_control_reset() failures.
---
 drivers/memory/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 72c0df129d5c5065..547f956f6c29e9bd 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -210,6 +210,7 @@ config RENESAS_RPCIF
 	tristate "Renesas RPC-IF driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select REGMAP_MMIO
+	select RESET_CONTROLLER
 	help
 	  This supports Renesas R-Car Gen3 or RZ/G2 RPC-IF which provides
 	  either SPI host or HyperFlash. You'll have to select individual
-- 
2.25.1

