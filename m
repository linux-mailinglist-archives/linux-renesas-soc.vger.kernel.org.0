Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEFA707FB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 13:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjERLip (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 May 2023 07:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbjERLi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2023 07:38:28 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5C4BF3589;
        Thu, 18 May 2023 04:37:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,285,1677510000"; 
   d="scan'208";a="163369232"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 May 2023 20:37:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.79])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AB90A4004467;
        Thu, 18 May 2023 20:37:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 04/11] rtc: isl1208: Drop name variable
Date:   Thu, 18 May 2023 12:36:36 +0100
Message-Id: <20230518113643.420806-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop unused name variable from struct isl1208_config.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/rtc/rtc-isl1208.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 73cc6aaf9b8b..a73eb78b8a40 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -79,15 +79,14 @@ enum isl1208_id {
 
 /* Chip capabilities table */
 static const struct isl1208_config {
-	const char	name[8];
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
 } isl1208_configs[] = {
-	[TYPE_ISL1208] = { "isl1208", 2, false, false },
-	[TYPE_ISL1209] = { "isl1209", 2, true,  false },
-	[TYPE_ISL1218] = { "isl1218", 8, false, false },
-	[TYPE_ISL1219] = { "isl1219", 2, true,  true },
+	[TYPE_ISL1208] = { 2, false, false },
+	[TYPE_ISL1209] = { 2, true,  false },
+	[TYPE_ISL1218] = { 8, false, false },
+	[TYPE_ISL1219] = { 2, true,  true },
 };
 
 static const struct i2c_device_id isl1208_id[] = {
-- 
2.25.1

