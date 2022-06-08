Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A94054373A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243323AbiFHPV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244860AbiFHPTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:19:55 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BDB3FBE0
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:14:28 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by laurent.telenet-ops.be with bizsmtp
        id gfEQ270041qF9lr01fEQPt; Wed, 08 Jun 2022 17:14:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxO3-003DnB-MZ; Wed, 08 Jun 2022 17:14:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxO3-008jwH-0r; Wed, 08 Jun 2022 17:14:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes
Date:   Wed,  8 Jun 2022 17:14:21 +0200
Message-Id: <cbbc8f464743d636895c048de61aa610d75392de.1654701156.git.geert+renesas@glider.be>
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

Reduce the sizes of the rcar_sysc_area and rcar_gen4_sysc_area
structures:
  - parent is in the range [-1..32] or [-1..64], so s8 is sufficient,
  - flags needs just 3 bits (for now), so u8 is plenty.

This reduces kernel size by:
  - 288 bytes for an R-Car Gen1+Gen2 kernel (arm32),
  - 1772 bytes for an R-Car Gen3+Gen4 kernel (arm64).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel-for-v5.20.

 drivers/soc/renesas/rcar-gen4-sysc.h | 4 ++--
 drivers/soc/renesas/rcar-sysc.h      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/rcar-gen4-sysc.h b/drivers/soc/renesas/rcar-gen4-sysc.h
index fe2d9825475423f0..388cfa8f8f9fd656 100644
--- a/drivers/soc/renesas/rcar-gen4-sysc.h
+++ b/drivers/soc/renesas/rcar-gen4-sysc.h
@@ -25,8 +25,8 @@
 struct rcar_gen4_sysc_area {
 	const char *name;
 	u8 pdr;			/* PDRn */
-	int parent;		/* -1 if none */
-	unsigned int flags;	/* See PD_* */
+	s8 parent;		/* -1 if none */
+	u8 flags;		/* See PD_* */
 };
 
 /*
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 8d861c1cfdf78b6f..266c599a0a9b9198 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -31,8 +31,8 @@ struct rcar_sysc_area {
 	u16 chan_offs;		/* Offset of PWRSR register for this area */
 	u8 chan_bit;		/* Bit in PWR* (except for PWRUP in PWRSR) */
 	u8 isr_bit;		/* Bit in SYSCI*R */
-	int parent;		/* -1 if none */
-	unsigned int flags;	/* See PD_* */
+	s8 parent;		/* -1 if none */
+	u8 flags;		/* See PD_* */
 };
 
 
-- 
2.25.1

