Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C3359BD2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 11:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbiHVJzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 05:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbiHVJzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 05:55:15 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8480331DC0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 02:55:14 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id AZvC2800F4C55Sk06ZvCJU; Mon, 22 Aug 2022 11:55:12 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oQ49H-0023oZ-UF; Mon, 22 Aug 2022 11:55:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oQ49H-00GFKP-F9; Mon, 22 Aug 2022 11:55:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.0-rc1
Date:   Mon, 22 Aug 2022 11:55:10 +0200
Message-Id: <aaebb94f3a49a495b82da787b1386f40f1ea118e.1661161941.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
  - Disable CONFIG_ARM64_ERRATUM_2441009 (No Cortex-A510),
  - Drop CONFIG_ARCH_RANDOM=n (removed in commit 9592eef7c16ec5fb
    ("random: remove CONFIG_ARCH_RANDOM")),
  - Drop CONFIG_ARM_CPUIDLE=y (removed in commit 51280acad8559bd9
    ("cpuidle: cpuidle-arm: remove arm64 support")),
  - Move CONFIG_CAN_RCAR=y and CONFIG_CAN_RCAR_CANFD=y (moved in commit
    d7786af59860a113 ("net: Kconfig: move the CAN device menu to the
    "Device Drivers" section")),
  - Enable RZ/V2M I2C support,
  - Enable Renesas Universal Flash Storage Controller support incl.
    dependencies (R-Car S4-8).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index f38272a641873016..1fb9020adf39b2e5 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -32,6 +32,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_2077057 is not set
 # CONFIG_ARM64_ERRATUM_2054223 is not set
 # CONFIG_ARM64_ERRATUM_2067961 is not set
+# CONFIG_ARM64_ERRATUM_2441009 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -59,14 +60,12 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_TLB_RANGE is not set
 # CONFIG_ARM64_BTI is not set
 # CONFIG_ARM64_E0PD is not set
-# CONFIG_ARCH_RANDOM is not set
 # CONFIG_ARM64_MTE is not set
 # CONFIG_ARM64_EPAN is not set
 # CONFIG_ARM64_SME is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
-CONFIG_ARM_CPUIDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
@@ -97,8 +96,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
 CONFIG_CAN=y
-CONFIG_CAN_RCAR=y
-CONFIG_CAN_RCAR_CANFD=y
 CONFIG_BT=y
 CONFIG_BT_LEDS=y
 CONFIG_BT_HCIUART=y
@@ -145,6 +142,8 @@ CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
+CONFIG_CAN_RCAR=y
+CONFIG_CAN_RCAR_CANFD=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_WLCORE=y
 CONFIG_WLCORE_SDIO=y
@@ -173,6 +172,7 @@ CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_RIIC=y
+CONFIG_I2C_RZV2M=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_RCAR=y
 CONFIG_SPI=y
@@ -316,6 +316,9 @@ CONFIG_TYPEC=y
 CONFIG_TYPEC_HD3SS3220=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHI=y
+CONFIG_SCSI_UFSHCD=y
+CONFIG_SCSI_UFSHCD_PLATFORM=y
+CONFIG_SCSI_UFS_RENESAS=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
2.25.1

