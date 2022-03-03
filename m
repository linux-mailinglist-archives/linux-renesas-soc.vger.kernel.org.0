Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26384CBE2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiCCMvp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiCCMvo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:51:44 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CD8184B79
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:50:57 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6495:14e6:1343:3ecb])
        by xavier.telenet-ops.be with bizsmtp
        id 1oqw270095ER6nL01oqwo2; Thu, 03 Mar 2022 13:50:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPkv1-002XtZ-Nm; Thu, 03 Mar 2022 13:50:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPkv1-008DPY-3f; Thu, 03 Mar 2022 13:50:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: Drop commas after dt_compat sentinels
Date:   Thu,  3 Mar 2022 13:50:54 +0100
Message-Id: <ab4acc22eebb96a0747eb301c878b24b1200736a.1646311825.git.geert+renesas@glider.be>
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

It does not make sense to have a comma after a sentinel, as any new
elements must be added before the sentinel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.19.
---
 arch/arm/mach-shmobile/setup-emev2.c     | 2 +-
 arch/arm/mach-shmobile/setup-r7s72100.c  | 2 +-
 arch/arm/mach-shmobile/setup-r7s9210.c   | 2 +-
 arch/arm/mach-shmobile/setup-r8a73a4.c   | 2 +-
 arch/arm/mach-shmobile/setup-r8a7740.c   | 2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c   | 2 +-
 arch/arm/mach-shmobile/setup-r8a7779.c   | 2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 4 ++--
 arch/arm/mach-shmobile/setup-sh73a0.c    | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-emev2.c b/arch/arm/mach-shmobile/setup-emev2.c
index a328d2f526783f59..ed82d64296238e0f 100644
--- a/arch/arm/mach-shmobile/setup-emev2.c
+++ b/arch/arm/mach-shmobile/setup-emev2.c
@@ -16,7 +16,7 @@
 
 static const char *const emev2_boards_compat_dt[] __initconst = {
 	"renesas,emev2",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(EMEV2_DT, "Generic Emma Mobile EV2 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-r7s72100.c b/arch/arm/mach-shmobile/setup-r7s72100.c
index 14867226f8f46e14..a70b99495e2ecf66 100644
--- a/arch/arm/mach-shmobile/setup-r7s72100.c
+++ b/arch/arm/mach-shmobile/setup-r7s72100.c
@@ -14,7 +14,7 @@
 
 static const char *const r7s72100_boards_compat_dt[] __initconst = {
 	"renesas,r7s72100",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(R7S72100_DT, "Generic R7S72100 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-r7s9210.c b/arch/arm/mach-shmobile/setup-r7s9210.c
index 573fb9955e7eb1e4..90add728bc3d9b4f 100644
--- a/arch/arm/mach-shmobile/setup-r7s9210.c
+++ b/arch/arm/mach-shmobile/setup-r7s9210.c
@@ -15,7 +15,7 @@
 
 static const char *const r7s9210_boards_compat_dt[] __initconst = {
 	"renesas,r7s9210",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(R7S72100_DT, "Generic R7S9210 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-r8a73a4.c b/arch/arm/mach-shmobile/setup-r8a73a4.c
index 23a29a0ea9c96c35..9e3f4dc08372cb62 100644
--- a/arch/arm/mach-shmobile/setup-r8a73a4.c
+++ b/arch/arm/mach-shmobile/setup-r8a73a4.c
@@ -14,7 +14,7 @@
 
 static const char *const r8a73a4_boards_compat_dt[] __initconst = {
 	"renesas,r8a73a4",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(R8A73A4_DT, "Generic R8A73A4 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-r8a7740.c b/arch/arm/mach-shmobile/setup-r8a7740.c
index 9eebb35da341ff33..8a750672f6513ba9 100644
--- a/arch/arm/mach-shmobile/setup-r8a7740.c
+++ b/arch/arm/mach-shmobile/setup-r8a7740.c
@@ -74,7 +74,7 @@ static void __init r8a7740_generic_init(void)
 
 static const char *const r8a7740_boards_compat_dt[] __initconst = {
 	"renesas,r8a7740",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(R8A7740_DT, "Generic R8A7740 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-r8a7778.c b/arch/arm/mach-shmobile/setup-r8a7778.c
index 02cda9cada4c4546..445017e8cfe8cfbd 100644
--- a/arch/arm/mach-shmobile/setup-r8a7778.c
+++ b/arch/arm/mach-shmobile/setup-r8a7778.c
@@ -43,7 +43,7 @@ static void __init r8a7778_init_irq_dt(void)
 
 static const char *const r8a7778_compat_dt[] __initconst = {
 	"renesas,r8a7778",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(R8A7778_DT, "Generic R8A7778 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index b6e282116d664705..c3af2c8925ba0b7f 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -49,7 +49,7 @@ static void __init r8a7779_init_irq_dt(void)
 
 static const char *const r8a7779_compat_dt[] __initconst = {
 	"renesas,r8a7779",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(R8A7779_DT, "Generic R8A7779 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 090e9faafb00ba34..6521db2af48aefce 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -218,7 +218,7 @@ static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
 	"renesas,r8a7792",
 	"renesas,r8a7793",
 	"renesas,r8a7794",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(RCAR_GEN2_DT, "Generic R-Car Gen2 (Flattened Device Tree)")
@@ -235,7 +235,7 @@ static const char * const rz_g1_boards_compat_dt[] __initconst = {
 	"renesas,r8a7744",
 	"renesas,r8a7745",
 	"renesas,r8a77470",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(RZ_G1_DT, "Generic RZ/G1 (Flattened Device Tree)")
diff --git a/arch/arm/mach-shmobile/setup-sh73a0.c b/arch/arm/mach-shmobile/setup-sh73a0.c
index 405e1af68a684f9a..7c317ac9cede293e 100644
--- a/arch/arm/mach-shmobile/setup-sh73a0.c
+++ b/arch/arm/mach-shmobile/setup-sh73a0.c
@@ -33,7 +33,7 @@ static void __init sh73a0_generic_init(void)
 
 static const char *const sh73a0_boards_compat_dt[] __initconst = {
 	"renesas,sh73a0",
-	NULL,
+	NULL
 };
 
 DT_MACHINE_START(SH73A0_DT, "Generic SH73A0 (Flattened Device Tree)")
-- 
2.25.1

