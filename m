Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFD0D93F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392232AbfJPOdK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:33:10 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:37408 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392214AbfJPOdK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:33:10 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id EEZ82100N05gfCL01EZ856; Wed, 16 Oct 2019 16:33:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkMO-0003nj-CK; Wed, 16 Oct 2019 16:33:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkMO-0007YO-Aq; Wed, 16 Oct 2019 16:33:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Add missing check for non-zero product register address
Date:   Wed, 16 Oct 2019 16:33:06 +0200
Message-Id: <20191016143306.28995-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If the DTB for a device with an RZ/A2 SoC lacks a device node for the
BSID register, the ID validation code falls back to using a register at
address 0x0, which leads to undefined behavior (e.g. reading back a
random value).

This could be fixed by letting fam_rza2.reg point to the actual BSID
register.  However, the hardcoded fallbacks were meant for backwards
compatibility with old DTBs only, not for new SoCs.  Hence fix this by
validating renesas_family.reg before using it.

Fixes: 175f435f44b724e3 ("soc: renesas: identify RZ/A2")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/renesas-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 5dc2ae55f746a48a..85aaf85ce6b192d9 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -337,7 +337,7 @@ static int __init renesas_soc_init(void)
 	if (np) {
 		chipid = of_iomap(np, 0);
 		of_node_put(np);
-	} else if (soc->id) {
+	} else if (soc->id && family->reg) {
 		chipid = ioremap(family->reg, 4);
 	}
 	if (chipid) {
-- 
2.17.1

