Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6BABC208
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 08:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfIXGtT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 02:49:19 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:41302 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727191AbfIXGtT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 02:49:19 -0400
X-IronPort-AV: E=Sophos;i="5.64,543,1559487600"; 
   d="scan'208";a="27331397"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2019 15:49:16 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DB86D4008563;
        Tue, 24 Sep 2019 15:49:14 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Date:   Tue, 24 Sep 2019 07:49:04 +0100
Message-Id: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds SDHI support for RZ/G2N (R8A774B1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 751fe91..7c6020e 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -308,6 +308,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
 	/* generic ones */
 	{ .soc_id = "r8a774a1" },
+	{ .soc_id = "r8a774b1" },
 	{ .soc_id = "r8a774c0" },
 	{ .soc_id = "r8a77470" },
 	{ .soc_id = "r8a7795" },
-- 
2.7.4

