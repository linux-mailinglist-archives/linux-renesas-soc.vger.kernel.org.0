Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B9649F8F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 13:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348341AbiA1MKu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 07:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbiA1MKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 07:10:49 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CFFC061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 04:10:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3999:e79d:cb59:f2ec])
        by baptiste.telenet-ops.be with bizsmtp
        id oCAm2600804fKGS01CAmGl; Fri, 28 Jan 2022 13:10:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nDQ5V-00Bkwt-V8; Fri, 28 Jan 2022 13:10:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nDQ5V-006Wng-By; Fri, 28 Jan 2022 13:10:45 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Disable unneeded 8250 serial options
Date:   Fri, 28 Jan 2022 13:10:44 +0100
Message-Id: <caefa806d66b83085c4ceab09819b469088664a1.1643371790.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The only Renesas platform with 16550 serial ports is Emma Mobile EV2,
which does not need any of the following options:
  - CONFIG_SERIAL_8250_DEPRECATED_OPTIONS,
  - CONFIG_SERIAL_8250_16550A_VARIANTS,
  - CONFIG_SERIAL_8250_PCI,
  - CONFIG_SERIAL_8250_PERICOM (new in v5.17-rc1).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.18.

 arch/arm/configs/shmobile_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 2c2702ec6d025a22..db8df8a3a7b12d13 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -69,9 +69,13 @@ CONFIG_INPUT_DA9063_ONKEY=y
 CONFIG_INPUT_ADXL34X=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_SERIAL_8250_PCI is not set
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
+# CONFIG_SERIAL_8250_PERICOM is not set
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DEMUX_PINCTRL=y
-- 
2.25.1

