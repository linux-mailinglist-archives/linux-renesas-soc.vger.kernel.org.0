Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB69477632
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238635AbhLPPn7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhLPPn7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:43:59 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C04AC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 07:43:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by laurent.telenet-ops.be with bizsmtp
        id X3jx2600J250X30013jxm4; Thu, 16 Dec 2021 16:43:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvF-005RBq-Cd; Thu, 16 Dec 2021 16:43:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvE-00A3Oi-Ss; Thu, 16 Dec 2021 16:43:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/5] arm64: renesas: defconfig: Refresh for v5.16-rc1
Date:   Thu, 16 Dec 2021 16:43:52 +0100
Message-Id: <0f2c9720f87050d547f30762098012da8b8bf0b1.1639669217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639669217.git.geert+renesas@glider.be>
References: <cover.1639669217.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 systems:
  - Disable CONFIG_ARM64_ERRATUM_2054223 (no Cortex-A710),
  - Disable CONFIG_ARM64_ERRATUM_2067961 (no Neoverse-N2),
  - Enable CONFIG_SCHED_CLUSTER (several R-Car Gen3 and RZ/G2 SoCs have
    multiple clusters),
  - Enable CONFIG_VIDEO_RCAR_ISP (R-Car V3U),
  - Disable CONFIG_XEN_PCIDEV_STUB (defaults to m, which means y if
    modules are disabled).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 01ea7ff02d5d0f06..177100d7dcac94ac 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -29,6 +29,8 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_1530923 is not set
 # CONFIG_ARM64_ERRATUM_1542419 is not set
+# CONFIG_ARM64_ERRATUM_2054223 is not set
+# CONFIG_ARM64_ERRATUM_2067961 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -41,6 +43,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
+CONFIG_SCHED_CLUSTER=y
 CONFIG_NR_CPUS=8
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
@@ -182,6 +185,7 @@ CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_CSI2=y
 CONFIG_VIDEO_RCAR_VIN=y
+CONFIG_VIDEO_RCAR_ISP=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_RENESAS_FDP1=y
 CONFIG_VIDEO_RENESAS_FCP=y
@@ -305,6 +309,7 @@ CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
+# CONFIG_XEN_PCIDEV_STUB is not set
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.25.1

