Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3F1447D57
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 11:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237757AbhKHKO7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 05:14:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235650AbhKHKO5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 05:14:57 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41E3C061570;
        Mon,  8 Nov 2021 02:12:12 -0800 (PST)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 637521EC04DE;
        Mon,  8 Nov 2021 11:12:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1636366331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TQJym/1rmYQ4+cETXUsQAXpKycUCv2OKpLpqlLMp4Ec=;
        b=Uqo+C9vwlVvqmyoGrtoRTw3O16a0AUpdq1SX2Gz7G0aoPI3oBCWzbY7o/NkFklAhHi8jOP
        4k0JkskOEA2iWDf7cBUvtnCWIUr/7QKWlwCNCd7otRQAmCXhaayQyrbnUisCH0B82J4mq6
        iNmEsmAyNNdmWWvc0o1vQmkI5q9GmBQ=
From:   Borislav Petkov <bp@alien8.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v0 04/42] clk: renesas: Check notifier registration return value
Date:   Mon,  8 Nov 2021 11:11:19 +0100
Message-Id: <20211108101157.15189-5-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/renesas/clk-div6.c     | 4 +++-
 drivers/clk/renesas/rcar-cpg-lib.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 3abd6e5400ad..7d89ca01889a 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -306,7 +306,9 @@ struct clk * __init cpg_div6_register(const char *name,
 
 	if (notifiers) {
 		clock->nb.notifier_call = cpg_div6_clock_notifier_call;
-		raw_notifier_chain_register(notifiers, &clock->nb);
+
+		if (raw_notifier_chain_register(notifiers, &clock->nb))
+			pr_warn("CPG DIV6 clock notifier already registered\n");
 	}
 
 	return clk;
diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index e93f0011eb07..fbbb6f4a8148 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -59,7 +59,9 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 				  struct cpg_simple_notifier *csn)
 {
 	csn->nb.notifier_call = cpg_simple_notifier_call;
-	raw_notifier_chain_register(notifiers, &csn->nb);
+
+	if (raw_notifier_chain_register(notifiers, &csn->nb))
+		pr_warn("CPG notifier already registered\n");
 }
 
 /*
-- 
2.29.2

