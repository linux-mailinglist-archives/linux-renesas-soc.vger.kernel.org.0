Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D1F42BCF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 12:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJMKjP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 06:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbhJMKjO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 06:39:14 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A10C061746
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 03:37:04 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by xavier.telenet-ops.be with bizsmtp
        id 5Nd22600E0KW32a01Nd22Q; Wed, 13 Oct 2021 12:37:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mabMh-004XwN-5I; Wed, 13 Oct 2021 12:20:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maa86-002spN-0O; Wed, 13 Oct 2021 11:00:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/4] arm64: renesas: defconfig: Refresh for v5.15-rc5
Date:   Wed, 13 Oct 2021 11:00:43 +0200
Message-Id: <050b89432129bc2816c6e1ea4419aabebf7c9488.1634115568.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
References: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 systems:
  - Move CONFIG_DMIID (moved in commit 951cd3a0866d29cb ("firmware:
    include drivers/firmware/Kconfig unconditionally")),

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 829d459a2e1067fc..71fb5acd98b1ff5e 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -62,7 +62,6 @@ CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
-# CONFIG_DMIID is not set
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
 CONFIG_ARM64_CRYPTO=y
@@ -111,6 +110,7 @@ CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_DMIID is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_SPI_NOR=y
-- 
2.25.1

