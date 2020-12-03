Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF4A2CD559
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730403AbgLCMUQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730399AbgLCMUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:20:14 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DE6C061A53
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Dec 2020 04:19:33 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id zoKP230044C55Sk01oKPbP; Thu, 03 Dec 2020 13:19:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknZy-007hFo-Su; Thu, 03 Dec 2020 13:19:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknZy-00C2tD-4Y; Thu, 03 Dec 2020 13:19:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v10 1/3] ARM: uncompress: Add be32tocpu macro
Date:   Thu,  3 Dec 2020 13:19:14 +0100
Message-Id: <20201203121916.2870975-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203121916.2870975-1-geert+renesas@glider.be>
References: <20201203121916.2870975-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DTB stores all values as 32-bit big-endian integers.
Add a macro to convert such values to native CPU endianness, to reduce
duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10:
  - New.
---
 arch/arm/boot/compressed/head.S | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 835ce64f1674c9a2..aabdc544c03aafdc 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -165,6 +165,16 @@
 		orr	\res, \res, \tmp1, lsl #24
 		.endm
 
+		.macro	be32tocpu, val, tmp
+#ifndef __ARMEB__
+		/* convert to little endian */
+		eor	\tmp, \val, \val, ror #16
+		bic	\tmp, \tmp, #0x00ff0000
+		mov	\val, \val, ror #8
+		eor	\val, \val, \tmp, lsr #8
+#endif
+		.endm
+
 		.section ".start", "ax"
 /*
  * sort out different calling conventions
@@ -345,13 +355,7 @@ restart:	adr	r0, LC1
 
 		/* Get the initial DTB size */
 		ldr	r5, [r6, #4]
-#ifndef __ARMEB__
-		/* convert to little endian */
-		eor	r1, r5, r5, ror #16
-		bic	r1, r1, #0x00ff0000
-		mov	r5, r5, ror #8
-		eor	r5, r5, r1, lsr #8
-#endif
+		be32tocpu r5, r1
 		dbgadtb	r6, r5
 		/* 50% DTB growth should be good enough */
 		add	r5, r5, r5, lsr #1
@@ -403,13 +407,7 @@ restart:	adr	r0, LC1
 
 		/* Get the current DTB size */
 		ldr	r5, [r6, #4]
-#ifndef __ARMEB__
-		/* convert r5 (dtb size) to little endian */
-		eor	r1, r5, r5, ror #16
-		bic	r1, r1, #0x00ff0000
-		mov	r5, r5, ror #8
-		eor	r5, r5, r1, lsr #8
-#endif
+		be32tocpu r5, r1
 
 		/* preserve 64-bit alignment */
 		add	r5, r5, #7
-- 
2.25.1

