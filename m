Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA1416C451
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 15:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgBYOr7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 09:47:59 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:46108 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbgBYOr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 09:47:59 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 72nr2200M5USYZQ062nsVf; Tue, 25 Feb 2020 15:47:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6bV1-0007yI-Rg; Tue, 25 Feb 2020 15:47:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6bV1-0005AV-Oq; Tue, 25 Feb 2020 15:47:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: boot: Fix ATAGs with appended DTB
Date:   Tue, 25 Feb 2020 15:47:49 +0100
Message-Id: <20200225144749.19815-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

At early boot, register r8 may contain an ATAGs or DTB pointer.
When an appended DTB is found, its address is stored in r8, for
extraction of the RAM base address later.

However, if r8 contained an ATAGs pointer before, that pointer will be
lost, and the provided ATAGs is no longer folded into the provided DTB.

Fix this by leaving r8 untouched.

Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not tested with ATAGs, only with [uz]Image + DTB, and zImage with
appended DTB.
---
 arch/arm/boot/compressed/head.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 339d4b4cfbbeed15..a351ed2bc195ed8d 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -267,16 +267,18 @@ not_angel:
 		cmp	r0, r1		@ do we have a DTB there?
 		bne	1f
 
-		mov	r8, r6		@ use it if so
 		/* preserve 64-bit alignment */
 		add	r5, r5, #7
 		bic	r5, r5, #7
-		add	sp, sp, r5	@ and move stack above it
+		add	sp, sp, r5	@ if so, move stack above DTB
+		mov	r0, r6		@ and extract memory start from DTB
+		b	2f
 
 1:
 #endif /* CONFIG_ARM_APPENDED_DTB */
 
 		mov	r0, r8
+2:
 		bl	fdt_get_mem_start
 		mov	r4, r0
 		cmp	r0, #-1
-- 
2.17.1

