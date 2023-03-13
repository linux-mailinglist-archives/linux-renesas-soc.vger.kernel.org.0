Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75ECA6B7515
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Mar 2023 12:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjCMLDE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Mar 2023 07:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCMLDD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 07:03:03 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9B549D0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 04:03:00 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:7ed1:e2c6:b94:264a])
        by albert.telenet-ops.be with bizsmtp
        id Xn2x2900K01Vtj806n2x4i; Mon, 13 Mar 2023 12:02:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pbfwa-00C3JZ-05;
        Mon, 13 Mar 2023 12:02:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pbfxB-008ceH-Cd;
        Mon, 13 Mar 2023 12:02:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Use "#ifdef" for single-symbol definition checks
Date:   Mon, 13 Mar 2023 12:02:56 +0100
Message-Id: <6026a3fe36735f0e6a0ecb037bf7c45f42aa3daf.1678705241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Replace "#if defined(CONFIG_<foo>)" by "#ifdef CONFIG_<foo>" for
brevity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel-for-v6.4.

 drivers/soc/renesas/renesas-soc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index e562d53ae1125d8a..667b8d179871536f 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -374,20 +374,20 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A779G0
 	{ .compatible = "renesas,r8a779g0",	.data = &soc_rcar_v4h },
 #endif
-#if defined(CONFIG_ARCH_R9A07G043)
+#ifdef CONFIG_ARCH_R9A07G043
 #ifdef CONFIG_RISCV
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_five },
 #else
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_g2ul },
 #endif
 #endif
-#if defined(CONFIG_ARCH_R9A07G044)
+#ifdef CONFIG_ARCH_R9A07G044
 	{ .compatible = "renesas,r9a07g044",	.data = &soc_rz_g2l },
 #endif
-#if defined(CONFIG_ARCH_R9A07G054)
+#ifdef CONFIG_ARCH_R9A07G054
 	{ .compatible = "renesas,r9a07g054",	.data = &soc_rz_v2l },
 #endif
-#if defined(CONFIG_ARCH_R9A09G011)
+#ifdef CONFIG_ARCH_R9A09G011
 	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
 #endif
 #ifdef CONFIG_ARCH_SH73A0
-- 
2.34.1

