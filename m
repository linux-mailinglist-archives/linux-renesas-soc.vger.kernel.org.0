Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC4F2B92DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 13:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKSMwS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 07:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgKSMwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 07:52:18 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CFDC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 04:52:17 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id uCsG2300H4C55Sk01CsGZm; Thu, 19 Nov 2020 13:52:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjQ7-003prb-U0; Thu, 19 Nov 2020 13:52:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjQ7-00H3kC-FW; Thu, 19 Nov 2020 13:52:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors
Date:   Thu, 19 Nov 2020 13:52:14 +0100
Message-Id: <20201119125214.4065925-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no reason to keep on using the __raw_{read,write}l() I/O
accessors in Renesas ARM driver code.  Switch to using the plain
{read,write}l() I/O accessors, to have a chance that this works on
big-endian.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.11.

 drivers/soc/renesas/rmobile-sysc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index beb1c7211c3d62d3..9046b8c933cbe031 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -57,19 +57,19 @@ static int rmobile_pd_power_down(struct generic_pm_domain *genpd)
 			return ret;
 	}
 
-	if (__raw_readl(rmobile_pd->base + PSTR) & mask) {
+	if (readl(rmobile_pd->base + PSTR) & mask) {
 		unsigned int retry_count;
-		__raw_writel(mask, rmobile_pd->base + SPDCR);
+		writel(mask, rmobile_pd->base + SPDCR);
 
 		for (retry_count = PSTR_RETRIES; retry_count; retry_count--) {
-			if (!(__raw_readl(rmobile_pd->base + SPDCR) & mask))
+			if (!(readl(rmobile_pd->base + SPDCR) & mask))
 				break;
 			cpu_relax();
 		}
 	}
 
 	pr_debug("%s: Power off, 0x%08x -> PSTR = 0x%08x\n", genpd->name, mask,
-		 __raw_readl(rmobile_pd->base + PSTR));
+		 readl(rmobile_pd->base + PSTR));
 
 	return 0;
 }
@@ -80,13 +80,13 @@ static int __rmobile_pd_power_up(struct rmobile_pm_domain *rmobile_pd)
 	unsigned int retry_count;
 	int ret = 0;
 
-	if (__raw_readl(rmobile_pd->base + PSTR) & mask)
+	if (readl(rmobile_pd->base + PSTR) & mask)
 		return ret;
 
-	__raw_writel(mask, rmobile_pd->base + SWUCR);
+	writel(mask, rmobile_pd->base + SWUCR);
 
 	for (retry_count = 2 * PSTR_RETRIES; retry_count; retry_count--) {
-		if (!(__raw_readl(rmobile_pd->base + SWUCR) & mask))
+		if (!(readl(rmobile_pd->base + SWUCR) & mask))
 			break;
 		if (retry_count > PSTR_RETRIES)
 			udelay(PSTR_DELAY_US);
@@ -98,7 +98,7 @@ static int __rmobile_pd_power_up(struct rmobile_pm_domain *rmobile_pd)
 
 	pr_debug("%s: Power on, 0x%08x -> PSTR = 0x%08x\n",
 		 rmobile_pd->genpd.name, mask,
-		 __raw_readl(rmobile_pd->base + PSTR));
+		 readl(rmobile_pd->base + PSTR));
 
 	return ret;
 }
-- 
2.25.1

