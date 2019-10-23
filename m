Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42728E1AA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389931AbfJWMdw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:33:52 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:53590 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390072AbfJWMdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:33:45 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id H0Zk2100705gfCL010Zk8o; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003ts-0N; Wed, 23 Oct 2019 14:33:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003QN-V2; Wed, 23 Oct 2019 14:33:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 04/11] soc: renesas: Identify R-Car M3-W+
Date:   Wed, 23 Oct 2019 14:33:35 +0200
Message-Id: <20191023123342.13100-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023123342.13100-1-geert+renesas@glider.be>
References: <20191023123342.13100-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the R-Car M3-W+ (R8A77961) SoC, which shares
the Product ID Number with R-Car M3-W (R8A77960), but differs in CUT
Number (Ver. 3.0), and uses a different compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by, Tested-by,
  - Reword.
---
 drivers/soc/renesas/renesas-soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 319e47bb1d99cfcf..573cc6a98177ba2c 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -265,6 +265,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A77960
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
+#ifdef CONFIG_ARCH_R8A77961
+	{ .compatible = "renesas,r8a77961",	.data = &soc_rcar_m3_w },
+#endif
 #ifdef CONFIG_ARCH_R8A77965
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
 #endif
-- 
2.17.1

