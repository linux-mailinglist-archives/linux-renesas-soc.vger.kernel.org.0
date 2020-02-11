Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923E1159820
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgBKST7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:59 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34334 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731106AbgBKSTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1WKV2200W5USYZQ01WKVTf; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002o5-Le; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yY-K8; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 10/34] crypto: ccree - use existing helpers to split 64-bit addresses
Date:   Tue, 11 Feb 2020 19:19:04 +0100
Message-Id: <20200211181928.15178-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the existing lower_32_bits() and upper_32_bits() macros instead of
explicit casts and shifts to split a 64-bit address in its two 32-bit
parts.
Drop the superfluous cast to "u16", as the FIELD_PREP() macro already
masks it to the specified field width.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_hw_queue_defs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccree/cc_hw_queue_defs.h b/drivers/crypto/ccree/cc_hw_queue_defs.h
index 9f4db9956e912f29..e3ec2a8084d864cd 100644
--- a/drivers/crypto/ccree/cc_hw_queue_defs.h
+++ b/drivers/crypto/ccree/cc_hw_queue_defs.h
@@ -239,9 +239,9 @@ static inline void set_din_type(struct cc_hw_desc *pdesc,
 				enum cc_dma_mode dma_mode, dma_addr_t addr,
 				u32 size, enum cc_axi_sec axi_sec)
 {
-	pdesc->word[0] = (u32)addr;
+	pdesc->word[0] = lower_32_bits(addr);
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	pdesc->word[5] |= FIELD_PREP(WORD5_DIN_ADDR_HIGH, ((u16)(addr >> 32)));
+	pdesc->word[5] |= FIELD_PREP(WORD5_DIN_ADDR_HIGH, upper_32_bits(addr));
 #endif
 	pdesc->word[1] |= FIELD_PREP(WORD1_DIN_DMA_MODE, dma_mode) |
 				FIELD_PREP(WORD1_DIN_SIZE, size) |
@@ -336,9 +336,9 @@ static inline void set_dout_type(struct cc_hw_desc *pdesc,
 				 enum cc_dma_mode dma_mode, dma_addr_t addr,
 				 u32 size, enum cc_axi_sec axi_sec)
 {
-	pdesc->word[2] = (u32)addr;
+	pdesc->word[2] = lower_32_bits(addr);
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	pdesc->word[5] |= FIELD_PREP(WORD5_DOUT_ADDR_HIGH, ((u16)(addr >> 32)));
+	pdesc->word[5] |= FIELD_PREP(WORD5_DOUT_ADDR_HIGH, upper_32_bits(addr));
 #endif
 	pdesc->word[3] |= FIELD_PREP(WORD3_DOUT_DMA_MODE, dma_mode) |
 				FIELD_PREP(WORD3_DOUT_SIZE, size) |
-- 
2.17.1

