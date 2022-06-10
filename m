Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA8D546325
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 12:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348662AbiFJKGD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 06:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347260AbiFJKGA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 06:06:00 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1AFB7DF4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 03:05:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6907:80d7:a5b:48f8])
        by baptiste.telenet-ops.be with bizsmtp
        id hN5x2700B35NJNs01N5x45; Fri, 10 Jun 2022 12:05:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzbWe-003RLH-U3; Fri, 10 Jun 2022 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzbWe-00BJkl-E8; Fri, 10 Jun 2022 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/3] arm64: renesas: defconfig: Refresh for v5.19-rc1
Date:   Fri, 10 Jun 2022 12:05:53 +0200
Message-Id: <8f4212c618e72423614375a57010e270629ec41c.1654855338.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654855338.git.geert+renesas@glider.be>
References: <cover.1654855338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_COMPAT_BRK=n (moved in commit 0710d0122abc93ad ("mm:
    Kconfig: reorganize misplaced mm options")),
  - Disable CONFIG_ARM64_SME (Renesas SoCs are not ARMv9),
  - Enable R-Car V4H (R8A779G0) SoC support,
  - Enable RZ/G2UL (R9A07G043) SoC support,
  - Enable RZ/V2M (R9A09G011) SoC support, incl. its UART.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 4f7421ba76fa9fe9..6f823054a525719e 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -24,7 +24,6 @@ CONFIG_CGROUP_PERF=y
 CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_1542419 is not set
@@ -63,6 +62,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARCH_RANDOM is not set
 # CONFIG_ARM64_MTE is not set
 # CONFIG_ARM64_EPAN is not set
+# CONFIG_ARM64_SME is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
@@ -80,6 +80,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_JUMP_LABEL=y
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPAT_BRK is not set
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
@@ -149,6 +150,15 @@ CONFIG_KEYBOARD_GPIO=y
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_INPUT_MISC=y
 # CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_SERIAL_8250_PCI is not set
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_EM=y
+# CONFIG_SERIAL_8250_PERICOM is not set
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
@@ -345,12 +355,15 @@ CONFIG_ARCH_R8A779F0=y
 CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A779A0=y
+CONFIG_ARCH_R8A779G0=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A774E1=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
+CONFIG_ARCH_R9A07G043=y
 CONFIG_ARCH_R9A07G044=y
 CONFIG_ARCH_R9A07G054=y
+CONFIG_ARCH_R9A09G011=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
-- 
2.25.1

