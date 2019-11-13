Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19682FAE6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfKMK1f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:27:35 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:42040 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKMK1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:27:35 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id RNTW2100M5USYZQ01NTWQT; Wed, 13 Nov 2019 11:27:32 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUps2-0002S2-Lf; Wed, 13 Nov 2019 11:27:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUps2-0007dR-Ic; Wed, 13 Nov 2019 11:27:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A with CS3 SDRAM
Date:   Wed, 13 Nov 2019 11:27:29 +0100
Message-Id: <20191113102729.29303-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
Hence the mask for CONFIG_AUTO_ZRELADDR needs to be changed, otherwise
the system will crash because it will try to decompress a zImage or
uImage to a non-RAM garbage address.

Based on a patch in the BSP by Chris Brandt <chris.brandt@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No idea what to do with the rest of the comment, or if this breaks
existing platforms.

Thanks for your comments!
---
 arch/arm/boot/compressed/head.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 93dffed0ac6e02b4..cfee6bd1e7a0a582 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -231,10 +231,10 @@ not_angel:
 		 * address.
 		 *
 		 * This alignment is a balance between the requirements of
-		 * different platforms - we have chosen 128MB to allow
+		 * different platforms - we have chosen 64MB to allow
 		 * platforms which align the start of their physical memory
-		 * to 128MB to use this feature, while allowing the zImage
-		 * to be placed within the first 128MB of memory on other
+		 * to 64MB to use this feature, while allowing the zImage
+		 * to be placed within the first 64MB of memory on other
 		 * platforms.  Increasing the alignment means we place
 		 * stricter alignment requirements on the start of physical
 		 * memory, but relaxing it means that we break people who
@@ -242,7 +242,7 @@ not_angel:
 		 * of this range.
 		 */
 		mov	r4, pc
-		and	r4, r4, #0xf8000000
+		and	r4, r4, #0xfc000000
 		/* Determine final kernel image address. */
 		add	r4, r4, #TEXT_OFFSET
 #else
-- 
2.17.1

