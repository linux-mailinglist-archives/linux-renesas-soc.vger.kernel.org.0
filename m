Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C104CBE30
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbiCCMwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbiCCMwC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:52:02 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB124184B79
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:51:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6495:14e6:1343:3ecb])
        by xavier.telenet-ops.be with bizsmtp
        id 1orG270085ER6nL01orGrQ; Thu, 03 Mar 2022 13:51:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPkvL-002Xtj-Vk; Thu, 03 Mar 2022 13:51:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPkvL-008DRU-AP; Thu, 03 Mar 2022 13:51:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Drop comma after OF match table sentinel
Date:   Thu,  3 Mar 2022 13:51:14 +0100
Message-Id: <baaa4df6284401eb126573eb1c8ea5a88705cc37.1646311858.git.geert+renesas@glider.be>
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

Add a comment to clarify the purpose of the empty element.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.19.
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 09ef73b99dd86a85..abea41f7782e50d3 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -67,7 +67,7 @@ static const struct of_device_id rcar_gen2_quirk_match[] = {
 	{ .compatible = "dlg,da9063", .data = &da9063_msg },
 	{ .compatible = "dlg,da9063l", .data = &da9063_msg },
 	{ .compatible = "dlg,da9210", .data = &da9210_msg },
-	{},
+	{ /* sentinel */ }
 };
 
 static int regulator_quirk_notify(struct notifier_block *nb,
-- 
2.25.1

