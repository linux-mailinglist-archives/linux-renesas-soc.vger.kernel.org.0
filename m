Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 280B0B92CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 16:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390806AbfITOfd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 10:35:33 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:43512 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388135AbfITOfc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 10:35:32 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id 3qbQ2100f05gfCL06qbQyB; Fri, 20 Sep 2019 16:35:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iBK0K-0001M4-LH; Fri, 20 Sep 2019 16:35:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iBK0K-00061i-Ij; Fri, 20 Sep 2019 16:35:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: r8a774c0-sysc: Fix power request conflicts
Date:   Fri, 20 Sep 2019 16:35:23 +0200
Message-Id: <20190920143523.23125-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the location and contents of the SYSCEXTMASK register on
RZ/G2E, to prevent conflicts between internal and external power
requests.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.5.

 drivers/soc/renesas/r8a774c0-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/r8a774c0-sysc.c b/drivers/soc/renesas/r8a774c0-sysc.c
index 11050e17ea81f7f3..40d1558aab37ca4d 100644
--- a/drivers/soc/renesas/r8a774c0-sysc.c
+++ b/drivers/soc/renesas/r8a774c0-sysc.c
@@ -6,6 +6,7 @@
  * Based on Renesas R-Car E3 System Controller
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
@@ -50,4 +51,6 @@ const struct rcar_sysc_info r8a774c0_sysc_info __initconst = {
 	.init = r8a774c0_sysc_init,
 	.areas = r8a774c0_areas,
 	.num_areas = ARRAY_SIZE(r8a774c0_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
 };
-- 
2.17.1

