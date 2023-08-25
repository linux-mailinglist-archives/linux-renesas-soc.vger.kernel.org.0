Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076A0789002
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 22:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjHYUyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 16:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjHYUyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 16:54:03 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E4AC2136;
        Fri, 25 Aug 2023 13:54:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,201,1688396400"; 
   d="scan'208";a="173998522"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2023 05:54:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 63B144048F0D;
        Sat, 26 Aug 2023 05:53:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/3] hwmon: tmp513: Simplify tmp51x_read_properties()
Date:   Fri, 25 Aug 2023 21:53:45 +0100
Message-Id: <20230825205345.632792-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Simplify tmp51x_read_properties() by replacing 'nfactor' ->'data->nfactor'
in device_property_read_u32_array() and drop the local variable as it is
unused.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/hwmon/tmp513.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 6bbae4735a4b..a1104833252d 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -662,7 +662,6 @@ static int tmp51x_pga_gain_to_reg(struct device *dev, struct tmp51x_data *data)
 static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 {
 	int ret;
-	u32 nfactor[3];
 	u32 val;
 
 	ret = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
@@ -680,10 +679,8 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
-					    data->max_channels - 1);
-	if (ret >= 0)
-		memcpy(data->nfactor, nfactor, data->max_channels - 1);
+	device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
+				       data->max_channels - 1);
 
 	// Check if shunt value is compatible with pga-gain
 	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
-- 
2.25.1

