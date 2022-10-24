Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7C8609D8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 11:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiJXJLj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 05:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbiJXJLi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 05:11:38 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BCE558DC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 02:11:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1037:e7a1:b1a2:65fe])
        by baptiste.telenet-ops.be with bizsmtp
        id blBX2800U3Gfk6v01lBXTN; Mon, 24 Oct 2022 11:11:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1omtUZ-001CRu-Pc; Mon, 24 Oct 2022 11:11:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1omtUZ-00CzOd-7x; Mon, 24 Oct 2022 11:11:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.1-rc1
Date:   Mon, 24 Oct 2022 11:11:30 +0200
Message-Id: <2757e6c714fd9ee55909dcaceaf7190f2af098d9.1666602592.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
  - Disable ARM64_ERRATUM_2658417 (No Cortex-A510),
  - Drop CONFIG_ARM64_CRYPTO=y, move CONFIG_CRYPTO_*ARM64* ((re)moved in
    commit 4a329fecc9aaebb2 ("crypto: Kconfig - submenus for arm and
    arm64")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/arm64/configs/renesas_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index f7a186177a20af67..5698d17b9ff9c265 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -30,6 +30,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_1508412 is not set
 # CONFIG_ARM64_ERRATUM_2051678 is not set
 # CONFIG_ARM64_ERRATUM_2077057 is not set
+# CONFIG_ARM64_ERRATUM_2658417 is not set
 # CONFIG_ARM64_ERRATUM_2054223 is not set
 # CONFIG_ARM64_ERRATUM_2067961 is not set
 # CONFIG_ARM64_ERRATUM_2441009 is not set
@@ -71,12 +72,6 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
-CONFIG_ARM64_CRYPTO=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
-CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_JUMP_LABEL=y
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
@@ -405,6 +400,11 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_GHASH_ARM64_CE=y
+CONFIG_CRYPTO_SHA1_ARM64_CE=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
+CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_CCREE=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=128
-- 
2.25.1

