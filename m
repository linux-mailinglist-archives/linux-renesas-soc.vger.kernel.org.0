Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C09422C4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 17:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhJEPZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 11:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJEPZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 11:25:01 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2592C06174E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Oct 2021 08:23:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9ca4:a53a:9ffa:e003])
        by albert.telenet-ops.be with bizsmtp
        id 2FP72600e11933306FP7wH; Tue, 05 Oct 2021 17:23:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mXmHb-002HVs-Hj; Tue, 05 Oct 2021 17:23:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mXmHa-005kzp-ON; Tue, 05 Oct 2021 17:23:06 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] memory: RENESAS_RPCIF should select RESET_CONTROLLER
Date:   Tue,  5 Oct 2021 17:23:02 +0200
Message-Id: <d4383bd1a97c0490c0bdc9dae5695f4230d4a420.1633447185.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RPC-IF driver calls devm_reset_control_get_exclusive(),
which returns -ENOTSUPP if CONFIG_RESET_CONTROLLER is not enabled.
Even if this error is ignored, later calls to reset_control_reset() will
fail with a scary WARN_ON() backtrace.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

