Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A066D6FD8C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 09:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236525AbjEJH6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 03:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236517AbjEJH6B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 03:58:01 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174656EA6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 00:57:47 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:5484:c4b7:4aff:589c])
        by albert.telenet-ops.be with bizsmtp
        id uvxh2900W2rLuoZ06vxhaa; Wed, 10 May 2023 09:57:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pwehZ-001lUL-UH;
        Wed, 10 May 2023 09:57:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pwehh-00F2TZ-LB;
        Wed, 10 May 2023 09:57:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.4-rc1
Date:   Wed, 10 May 2023 09:57:38 +0200
Message-Id: <e32e3f5387be128bd913b3b7ffcb327dcd2c2205.1683705413.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_ROCKCHIP_ERRATUM_3588001 (not applicable),
  - Move CONFIG_PCI_HOST_GENERIC=y (moved in commit 81c362e798d41592
    ("PCI: Sort controller Kconfig entries by vendor")),
  - Drop CONFIG_SERIAL_8250_PCI1XXXX=n (no longer auto-enabled since
    commit 5d943b5d69c032de ("serial: 8250_pci1xxxx: Disable
    SERIAL_8250_PCI1XXXX config by default")),
  - Enable Renesas RZ/G2L Multi-Function Timer Pulse Unit 3 Counter
    support (RZ/G2L SMARC EVK).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/arm64/configs/renesas_defconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d11d890647013c5c..231139e2b8646062 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -47,6 +47,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_E1041 is not set
 # CONFIG_NVIDIA_CARMEL_CNP_ERRATUM is not set
+# CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
@@ -103,9 +104,9 @@ CONFIG_PCIEPORTBUS=y
 CONFIG_HOTPLUG_PCI_PCIE=y
 CONFIG_PCI_IOV=y
 CONFIG_HOTPLUG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
-CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=y
@@ -159,7 +160,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
 CONFIG_SERIAL_8250_NR_UARTS=2
 CONFIG_SERIAL_8250_RUNTIME_UARTS=2
-# CONFIG_SERIAL_8250_PCI1XXXX is not set
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
 CONFIG_SERIAL_SH_SCI=y
@@ -193,6 +193,7 @@ CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_RZ_MTU3=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_BD9571MWV=y
@@ -393,6 +394,8 @@ CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
+CONFIG_COUNTER=y
+CONFIG_RZ_MTU3_CNT=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_FANOTIFY=y
-- 
2.34.1

