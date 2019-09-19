Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C2DB74E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 10:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731598AbfISIRe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:17:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:25369 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731373AbfISIRe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:17:34 -0400
X-IronPort-AV: E=Sophos;i="5.64,522,1559487600"; 
   d="scan'208";a="26760308"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Sep 2019 17:17:33 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A03141F812D;
        Thu, 19 Sep 2019 17:17:31 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 4/8] soc: renesas: rcar-rst: Add support for RZ/G2N
Date:   Thu, 19 Sep 2019 09:17:12 +0100
Message-Id: <1568881036-4404-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for RZ/G2N (R8A774B1) to the R-Car RST driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * No change
---
 drivers/soc/renesas/rcar-rst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index d183c38..cd55929 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -45,6 +45,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ .compatible = "renesas,r8a77470-rst", .data = &rcar_rst_gen2 },
 	/* RZ/G2 is handled like R-Car Gen3 */
 	{ .compatible = "renesas,r8a774a1-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a774b1-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a774c0-rst", .data = &rcar_rst_gen3 },
 	/* R-Car Gen1 */
 	{ .compatible = "renesas,r8a7778-reset-wdt", .data = &rcar_rst_gen1 },
-- 
2.7.4

