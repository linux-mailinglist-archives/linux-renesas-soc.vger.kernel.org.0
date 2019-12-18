Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1901248BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 14:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfLRNwe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 08:52:34 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:44162 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726788AbfLRNwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 08:52:34 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihZke-0004yC-68; Wed, 18 Dec 2019 13:52:32 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihZkd-00Ax2A-Ts; Wed, 18 Dec 2019 13:52:31 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: renesas: rcar-rst: fix __iomem on configure call
Date:   Wed, 18 Dec 2019 13:52:30 +0000
Message-Id: <20191218135230.2610161-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The configure call back takes a register pointer, so should
have been marked with __iomem. Add this to silence the
following sparse warnings:

rivers/soc/renesas/rcar-rst.c:33:22: warning: incorrect type in initializer (incompatible argument 1 (different address spaces))
drivers/soc/renesas/rcar-rst.c:33:22:    expected int ( *configure )( ... )
drivers/soc/renesas/rcar-rst.c:33:22:    got int ( * )( ... )
drivers/soc/renesas/rcar-rst.c:97:40: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/renesas/rcar-rst.c:97:40:    expected void *base
drivers/soc/renesas/rcar-rst.c:97:40:    got void [noderef] <asn:2> *[assigned] base

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/soc/renesas/rcar-rst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 14d05a070dd3..794d0a2659fe 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -21,7 +21,7 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 
 struct rst_config {
 	unsigned int modemr;		/* Mode Monitoring Register Offset */
-	int (*configure)(void *base);	/* Platform specific configuration */
+	int (*configure)(void __iomem *base);	/* Platform specific configuration */
 };
 
 static const struct rst_config rcar_rst_gen1 __initconst = {
-- 
2.24.0

