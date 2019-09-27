Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A51EC03BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 12:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfI0Kxk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 06:53:40 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:27960 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726796AbfI0Kxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 06:53:40 -0400
X-IronPort-AV: E=Sophos;i="5.64,555,1559487600"; 
   d="scan'208";a="27462516"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Sep 2019 19:53:38 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B568241F9341;
        Fri, 27 Sep 2019 19:53:36 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        iommu@lists.linux-foundation.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] iommu/ipmmu-vmsa: Hook up r8a774b1 DT matching code
Date:   Fri, 27 Sep 2019 11:53:21 +0100
Message-Id: <1569581601-34027-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Support RZ/G2N (R8A774B1) IPMMU.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
  * Incorporated Geet's review comment
  * Added Geert's Reviewed-by tag
---
 drivers/iommu/ipmmu-vmsa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ad0098c..9285be7 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -775,6 +775,7 @@ static int ipmmu_init_platform_device(struct device *dev,
 
 static const struct soc_device_attribute soc_rcar_gen3[] = {
 	{ .soc_id = "r8a774a1", },
+	{ .soc_id = "r8a774b1", },
 	{ .soc_id = "r8a774c0", },
 	{ .soc_id = "r8a7795", },
 	{ .soc_id = "r8a7796", },
@@ -786,6 +787,7 @@ static const struct soc_device_attribute soc_rcar_gen3[] = {
 };
 
 static const struct soc_device_attribute soc_rcar_gen3_whitelist[] = {
+	{ .soc_id = "r8a774b1", },
 	{ .soc_id = "r8a774c0", },
 	{ .soc_id = "r8a7795", .revision = "ES3.*" },
 	{ .soc_id = "r8a77965", },
@@ -1008,6 +1010,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
 		.compatible = "renesas,ipmmu-r8a774a1",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
+		.compatible = "renesas,ipmmu-r8a774b1",
+		.data = &ipmmu_features_rcar_gen3,
+	}, {
 		.compatible = "renesas,ipmmu-r8a774c0",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
-- 
2.7.4

