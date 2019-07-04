Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34645FAFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2019 17:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfGDPhe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jul 2019 11:37:34 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:43316 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfGDPhe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jul 2019 11:37:34 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id YfdY2000B05gfCL06fdYJV; Thu, 04 Jul 2019 17:37:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hj3ng-000838-4G; Thu, 04 Jul 2019 17:37:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hj3ng-0002kV-2A; Thu, 04 Jul 2019 17:37:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH rza_u-boot-2017.05 1/2] net: sh_eth: Fix port offset on RZ/A2
Date:   Thu,  4 Jul 2019 17:37:25 +0200
Message-Id: <20190704153726.10507-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704153726.10507-1-geert+renesas@glider.be>
References: <20190704153726.10507-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The sh_eth driver assumes a hardcoded offset of 0x800 between multiple
port instances, which is incorrect on RZ/A2.

Fix this by making the port offset configurable, depending on SoC type.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/sh_eth.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/sh_eth.h b/drivers/net/sh_eth.h
index 906d93d8e7e0421f..d20abc7873e45850 100644
--- a/drivers/net/sh_eth.h
+++ b/drivers/net/sh_eth.h
@@ -366,8 +366,13 @@ static const u16 sh_eth_offset_fast_sh4[SH_ETH_MAX_REGISTER_OFFSET] = {
 #define BASE_IO_ADDR	0xE8203000
 #elif defined(CONFIG_R7S9210)
 #define SH_ETH_TYPE_RZ
-#define BASE_IO_ADDR	0xE8204000	/* EDMAC0 + ETHERC0 */
-//#define BASE_IO_ADDR	0xE8204200	/* EDMAC1 + ETHERC1 */
+#define BASE_IO_ADDR	0xE8204000
+#endif
+
+#if defined(CONFIG_R7S9210)
+#define PORT_OFFSET	0x200
+#else
+#define PORT_OFFSET	0x800
 #endif
 
 /*
@@ -674,7 +679,7 @@ static inline unsigned long sh_eth_reg_addr(struct sh_eth_dev *eth,
 #else
 #error
 #endif
-	return BASE_IO_ADDR + reg_offset[enum_index] + 0x800 * eth->port;
+	return BASE_IO_ADDR + reg_offset[enum_index] + PORT_OFFSET * eth->port;
 }
 
 static inline void sh_eth_write(struct sh_eth_dev *eth, unsigned long data,
-- 
2.17.1

