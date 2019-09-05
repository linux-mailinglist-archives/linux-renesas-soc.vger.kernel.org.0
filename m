Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8528DA9E8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 11:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387518AbfIEJh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 05:37:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49465 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730872AbfIEJh2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 05:37:28 -0400
X-IronPort-AV: E=Sophos;i="5.64,470,1559487600"; 
   d="scan'208";a="25819803"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2019 18:37:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6C70C4003EB6;
        Thu,  5 Sep 2019 18:37:25 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/3] soc: renesas: Identify RZ/G2N
Date:   Thu,  5 Sep 2019 10:30:42 +0100
Message-Id: <1567675844-19247-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for identifying the RZ/G2N (r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 3299cf53..45135bc 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -116,6 +116,11 @@ static const struct renesas_soc soc_rz_g2m __initconst __maybe_unused = {
 	.id	= 0x52,
 };
 
+static const struct renesas_soc soc_rz_g2n __initconst __maybe_unused = {
+	.family = &fam_rzg2,
+	.id     = 0x55,
+};
+
 static const struct renesas_soc soc_rz_g2e __initconst __maybe_unused = {
 	.family	= &fam_rzg2,
 	.id	= 0x57,
@@ -227,6 +232,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A774A1
 	{ .compatible = "renesas,r8a774a1",	.data = &soc_rz_g2m },
 #endif
+#ifdef CONFIG_ARCH_R8A774B1
+	{ .compatible = "renesas,r8a774b1",	.data = &soc_rz_g2n },
+#endif
 #ifdef CONFIG_ARCH_R8A774C0
 	{ .compatible = "renesas,r8a774c0",	.data = &soc_rz_g2e },
 #endif
-- 
2.7.4

