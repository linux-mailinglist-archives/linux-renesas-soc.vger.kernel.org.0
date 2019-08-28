Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC23DA0125
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfH1L6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:58:48 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:43790 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfH1L6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:58:48 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id ubyi2000H05gfCL01byigs; Wed, 28 Aug 2019 13:58:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wb4-0008As-8P; Wed, 28 Aug 2019 13:58:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wFQ-0001kh-CR; Wed, 28 Aug 2019 13:36:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/7] soc: renesas: r8a77970-sysc: Fix power request conflicts
Date:   Wed, 28 Aug 2019 13:36:16 +0200
Message-Id: <20190828113618.6672-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828113618.6672-1-geert+renesas@glider.be>
References: <20190828113618.6672-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the location and contents of the SYSCEXTMASK register on R-Car
V3M, to prevent conflicts between internal and external power requests.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/soc/renesas/r8a77970-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/r8a77970-sysc.c b/drivers/soc/renesas/r8a77970-sysc.c
index 280c48b80f240424..b3033e3f0fd0b0ff 100644
--- a/drivers/soc/renesas/r8a77970-sysc.c
+++ b/drivers/soc/renesas/r8a77970-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Cogent Embedded Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 
@@ -32,4 +33,6 @@ static const struct rcar_sysc_area r8a77970_areas[] __initconst = {
 const struct rcar_sysc_info r8a77970_sysc_info __initconst = {
 	.areas = r8a77970_areas,
 	.num_areas = ARRAY_SIZE(r8a77970_areas),
+	.extmask_offs = 0x1b0,
+	.extmask_val = BIT(0),
 };
-- 
2.17.1

