Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA225462E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 11:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238786AbiFJJ6d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 05:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348057AbiFJJ6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 05:58:19 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D042AFB23
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 02:58:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6907:80d7:a5b:48f8])
        by laurent.telenet-ops.be with bizsmtp
        id hMyD2700P35NJNs01MyDFx; Fri, 10 Jun 2022 11:58:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzbPB-003RIn-8Q; Fri, 10 Jun 2022 11:58:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzbPA-00BJay-IQ; Fri, 10 Jun 2022 11:58:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.19-rc1
Date:   Fri, 10 Jun 2022 11:58:11 +0200
Message-Id: <7ef31a41e1a15d0cedeb6cfc496ce70a78102e32.1654855000.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_SLAB=y (moved in commit 7b42f1041c98f5d7 ("mm: Kconfig:
    move swap and slab config options to the MM section")),
  - Enable CONFIG_RENESAS_RZN1WDT (RZN1D-DB),
  - Enable CONFIG_RTC_DRV_RZN1 (RZN1-DB).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.20.
---
 arch/arm/configs/shmobile_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 362643cbeffdc539..a29bebb3742ed386 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -6,7 +6,6 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_PERF_EVENTS=y
-CONFIG_SLAB=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_PL310_ERRATA_588369=y
 CONFIG_SMP=y
@@ -25,6 +24,7 @@ CONFIG_CPUFREQ_DT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -106,6 +106,7 @@ CONFIG_WATCHDOG=y
 CONFIG_DA9063_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZAWDT=y
+CONFIG_RENESAS_RZN1WDT=y
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_STMPE=y
@@ -177,6 +178,7 @@ CONFIG_RTC_DRV_S35390A=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_RTC_DRV_DA9063=y
 CONFIG_RTC_DRV_SH=y
+CONFIG_RTC_DRV_RZN1=y
 CONFIG_DMADEVICES=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
-- 
2.25.1

