Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B3D493B98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354981AbiASOCr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354983AbiASOCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:44 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B34C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by xavier.telenet-ops.be with bizsmtp
        id ke2g2600Q2FKFx601e2hWz; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-00AS0l-Kn; Wed, 19 Jan 2022 15:02:40 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXr-009iHA-UO; Wed, 19 Jan 2022 15:02:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 03/15] pinctrl: renesas: Add PORT_GP_CFG_19 macros
Date:   Wed, 19 Jan 2022 15:02:20 +0100
Message-Id: <b2c72cceb9f03803c80d65eed2dd273adc1c3a3f.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
References: <cover.1642599415.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PORT_GP_CFG_19() and PORT_GP_19() helper macros, to be used by the
r8a779f0 subdriver.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Rework PORT_GP_CFG_20() on top of the new PORT_GP_CFG_19().
---
 drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index fba4217acb3fa3f2..f9852702a697a089 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -525,9 +525,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
 #define PORT_GP_18(bank, fn, sfx)	PORT_GP_CFG_18(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_20(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_19(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_18(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg)
+#define PORT_GP_19(bank, fn, sfx)	PORT_GP_CFG_19(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_20(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_19(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 19, fn, sfx, cfg)
 #define PORT_GP_20(bank, fn, sfx)	PORT_GP_CFG_20(bank, fn, sfx, 0)
 
-- 
2.25.1

