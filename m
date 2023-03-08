Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B416B0B58
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjCHOgS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbjCHOgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:36:17 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFCD9AFC5
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 06:36:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by michel.telenet-ops.be with bizsmtp
        id VqcE290023mNwr406qcE88; Wed, 08 Mar 2023 15:36:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZutH-00BFXx-R9;
        Wed, 08 Mar 2023 15:36:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZutp-00FazF-VA;
        Wed, 08 Mar 2023 15:36:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas: defconfig: Refresh for v6.3-rc1
Date:   Wed,  8 Mar 2023 15:36:12 +0100
Message-Id: <b852a3302fbc2e7729d95dad9e56c3636ff9624e.1678286092.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_ARM64_ERRATUM_2645198 (No Cortex-A715),
  - Disable CONFIG_SERIAL_8250_PCI1XXXX (No Microchip 8250 based serial
    ports),
  - Enable RZ/V2M xHCI and USB3.1 DRD controller support,
  - Drop CONFIG_ARCH_R8A77950=y (R-Car H3 ES1.x is no longer supported
    since commit b1dec4e78599a2ce ("clk: renesas: rcar-gen3: Disable
    R-Car H3 ES1.*")),
  - Drop CONFIG_DEBUG_PREEMPT=n (no longer auto-enabled since commit
    cc6003916ed46d7a ("lib/Kconfig.debug: do not enable DEBUG_PREEMPT by
    default")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 0f73d81f333d3344..f60f4ddcbf9fb7bc 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -34,6 +34,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_2054223 is not set
 # CONFIG_ARM64_ERRATUM_2067961 is not set
 # CONFIG_ARM64_ERRATUM_2441009 is not set
+# CONFIG_ARM64_ERRATUM_2645198 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -158,6 +159,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
 CONFIG_SERIAL_8250_NR_UARTS=2
 CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+# CONFIG_SERIAL_8250_PCI1XXXX is not set
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
 CONFIG_SERIAL_SH_SCI=y
@@ -295,6 +297,7 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_XHCI_RZV2M=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
@@ -308,6 +311,7 @@ CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=y
+CONFIG_USB_RZV2M_USB3DRD=y
 CONFIG_USB_RENESAS_USB3=y
 CONFIG_USB_SNP_UDC_PLAT=y
 CONFIG_USB_BDC_UDC=y
@@ -353,7 +357,6 @@ CONFIG_MAILBOX=y
 CONFIG_IOMMU_IO_PGTABLE_LPAE=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77950=y
 CONFIG_ARCH_R8A77951=y
 CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77960=y
@@ -418,6 +421,5 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 CONFIG_PROVE_LOCKING=y
 # CONFIG_FTRACE is not set
-- 
2.34.1

