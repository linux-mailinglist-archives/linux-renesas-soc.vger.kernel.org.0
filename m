Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E456F2CD55C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgLCMU5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgLCMUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:20:55 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CB6C061A56
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Dec 2020 04:19:33 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id zoKP2300H4C55Sk01oKPgz; Thu, 03 Dec 2020 13:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknZz-007hFp-42; Thu, 03 Dec 2020 13:19:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknZy-00C2tI-6K; Thu, 03 Dec 2020 13:19:22 +0100
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
Subject: [PATCH v10 2/3] ARM: uncompress: Add OF_DT_MAGIC macro
Date:   Thu,  3 Dec 2020 13:19:15 +0100
Message-Id: <20201203121916.2870975-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203121916.2870975-1-geert+renesas@glider.be>
References: <20201203121916.2870975-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DTB magic marker is stored as a 32-bit big-endian value, and thus
depends on the CPU's endianness.  Add a macro to define this value in
native endianness, to reduce #ifdef clutter and (future) duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10:
  - New.
---
 arch/arm/boot/compressed/head.S | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index aabdc544c03aafdc..d9cce7238a365081 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -11,6 +11,12 @@
 
 #include "efi-header.S"
 
+#ifdef __ARMEB__
+#define OF_DT_MAGIC 0xd00dfeed
+#else
+#define OF_DT_MAGIC 0xedfe0dd0
+#endif
+
  AR_CLASS(	.arch	armv7-a	)
  M_CLASS(	.arch	armv7-m	)
 
@@ -335,11 +341,7 @@ restart:	adr	r0, LC1
  */
 
 		ldr	lr, [r6, #0]
-#ifndef __ARMEB__
-		ldr	r1, =0xedfe0dd0		@ sig is 0xd00dfeed big endian
-#else
-		ldr	r1, =0xd00dfeed
-#endif
+		ldr	r1, =OF_DT_MAGIC
 		cmp	lr, r1
 		bne	dtb_check_done		@ not found
 
-- 
2.25.1

