Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A032A3F26
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 09:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbgKCImL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 03:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgKCImK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 03:42:10 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBA9C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2020 00:42:10 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id nki82300g4C55Sk01ki8bH; Tue, 03 Nov 2020 09:42:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kZrtI-002TJK-Gk; Tue, 03 Nov 2020 09:42:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kZrtH-005ml7-Pj; Tue, 03 Nov 2020 09:42:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas: defconfig: Refresh for v5.9-rc1
Date:   Tue,  3 Nov 2020 09:42:06 +0100
Message-Id: <20201103084206.1379023-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 systems:
  - Drop CONFIG_SECCOMP=y (auto-enabled since commit 282a181b1a0d66de
    ("seccomp: Move config option SECCOMP to arch/Kconfig")),
  - Disable CONFIG_ARM64_MTE (R-Car Gen3 is not ARMv8.5),
  - Move CONFIG_MDIO_BUS_MUX_MMIOREG=y (moved by commit a9770eac511ad823
    ("net: mdio: Move MDIO drivers into a new subdirectory")),
  - Reorder SoC-specific config options (cfr. commit 6d5aded8d57fc032
    ("soc: renesas: Sort driver description title")),
  - Drop CONFIG_CRYPTO_DEV_VIRTIO=n (no longer auto-enabled since commit
    b1a5c9a620f2b179 ("crypto: virtio - don't use 'default m'")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to topic/renesas-defconfig.
---
 arch/arm64/configs/renesas_defconfig | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 7e42e587dedda870..71a6cb34ca89229c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -41,7 +41,6 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
-CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
@@ -54,6 +53,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_BTI is not set
 # CONFIG_ARM64_E0PD is not set
 # CONFIG_ARCH_RANDOM is not set
+# CONFIG_ARM64_MTE is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
@@ -128,9 +128,9 @@ CONFIG_TUN=y
 CONFIG_VIRTIO_NET=y
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
-CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
+CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_WLCORE=y
 CONFIG_WLCORE_SDIO=y
 CONFIG_INPUT_MATRIXKMAP=y
@@ -309,20 +309,20 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_ARM64_ERRATUM_858921 is not set
 CONFIG_MAILBOX=y
 CONFIG_IOMMU_IO_PGTABLE_LPAE=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774B1=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774E1=y
+CONFIG_ARCH_R8A77995=y
+CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77950=y
 CONFIG_ARCH_R8A77951=y
+CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77960=y
 CONFIG_ARCH_R8A77961=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77995=y
+CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A779A0=y
+CONFIG_ARCH_R8A774C0=y
+CONFIG_ARCH_R8A774E1=y
+CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774B1=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
@@ -352,7 +352,6 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
-# CONFIG_CRYPTO_DEV_VIRTIO is not set
 CONFIG_CRYPTO_DEV_CCREE=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=128
-- 
2.25.1

