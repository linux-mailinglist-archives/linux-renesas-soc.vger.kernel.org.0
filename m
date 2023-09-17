Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E145B7A350B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Sep 2023 11:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236161AbjIQJ7T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Sep 2023 05:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbjIQJ6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Sep 2023 05:58:53 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316B418B;
        Sun, 17 Sep 2023 02:58:48 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RpNft2Fqqz9sTH;
        Sun, 17 Sep 2023 11:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1694944726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rRchFMkYjDHunyns7t89UibgDRtGEiZxqa3pX6WkczU=;
        b=aHWf6Q6/SNJQ3cJyyOf9Cgql8Svdn8YO4ZLOIjD3zg4VUOvvml1PzjehqE9O5txsvmkjz1
        MoKuCp1C36cyILgTVfuMGup35yQsF37We5BKWh2FB9vaCMf47rfuyPDlHK7n+0CTIHD39N
        btSkfPoz9EfKhCFgPu18H7xbx8HX+8UeSySCVA7KCkg0zgKydm11STZ/D6dnLoocdX31LD
        do8eZL4tHyx/xaYAtMqWI6FAI5nvYwVQy+IDHGoHFnPLJo0HqaJR5DEEEqtEvzMFMrNyTK
        pEhsAJylLmO1OJkHrFwKvKPrgymkADDcV0T4WJHZobSKI07d/4kJAIIOgA2vcw==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1694944724;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rRchFMkYjDHunyns7t89UibgDRtGEiZxqa3pX6WkczU=;
        b=Fnpl+WRUl9vxqztebmNzEp0iixEd60vp5ImSNtQE9Tahrg6mYF1gaOF9S5cZUZPRitufkP
        I+5uSUC2cdA0VU4oG9I4PwEW0vq52KfUmmRC/KrIXKXCz49iATodkH0tyzu/vy2EYwmgPH
        9UlfNQHb3LA2dQZNtNIzoSrq1JpKmb1bJBe29BB3z10XqZIHiuA5rc4tZQB3WzWybLEDPe
        em8bi86uDWAV7lO8SLl6kD7ArcHyjhIYzU42ihUz9m1mG4hS+5De5biQHaW1GmQ3KBicyO
        Zb+Tt/Gcv7SypTyhuk8fofzSXKkkAG7cGdebBxv8PhqkUuJ6M+E7Tg+t549a9g==
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7795: Constify r8a7795_*_clks
Date:   Sun, 17 Sep 2023 11:58:32 +0200
Message-Id: <20230917095832.39007-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5050228945451b1f8c4
X-MBO-RS-META: qm5sjf7soujp3mdr3974gaj74bnauad9
X-Rspamd-Queue-Id: 4RpNft2Fqqz9sTH
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make r8a7795_core_clks and r8a7795_mod_clks arrays const and align them
with the other clock tables in other *cpg-mssr.c . No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ad20b3301ef6..e47d9b1fcc0a 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -51,7 +51,7 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
-static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
+static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",      CLK_EXTAL),
 	DEF_INPUT("extalr",     CLK_EXTALR),
@@ -128,7 +128,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_BASE("r",           R8A7795_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
 
-static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
+static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("3dge",			 112,	R8A7795_CLK_ZG),
 	DEF_MOD("fdp1-1",		 118,	R8A7795_CLK_S0D1),
 	DEF_MOD("fdp1-0",		 119,	R8A7795_CLK_S0D1),
-- 
2.40.1

