Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525B7609584
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Oct 2022 20:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiJWSZ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Oct 2022 14:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiJWSZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Oct 2022 14:25:23 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5120A46D8B;
        Sun, 23 Oct 2022 11:25:19 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29NIOf0I015749;
        Sun, 23 Oct 2022 13:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1666549481;
        bh=H8rYH24NL8AZeTj62nOK+wRvyYl367Qs0WAvvbADlls=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=utIX+xyuAADGaQaM0t3+yOOQUipC5Btk9rtz+rWRZ/VeOelZXh5UwUnLtk3IWjm2p
         /qD00/051TwzE7Ay39d7DDbLRb/w7fo0i2+IuaVQwW4jzVjDejIrCdkT3tUWlNLfT2
         HpF0Tw/Z9kwSFhAHNE1rChpb5WnRepWff3GxXRa4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29NIOftP043400
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 23 Oct 2022 13:24:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Sun, 23
 Oct 2022 13:24:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Sun, 23 Oct 2022 13:24:41 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29NIObVa042708;
        Sun, 23 Oct 2022 13:24:40 -0500
From:   Andrew Davis <afd@ti.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Frank Rowand <frowand.list@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 3/6] of: overlay: rename overlay source files from .dts to .dtso
Date:   Sun, 23 Oct 2022 13:24:34 -0500
Message-ID: <20221023182437.15263-4-afd@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221023182437.15263-1-afd@ti.com>
References: <20221023182437.15263-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

In drivers/of/unittest-data/:
   - Rename .dts overlay source files to use .dtso suffix.

Modify driver/of/unitest.c to use .dtbo.o based symbols instead of .dtb.o

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/of/unittest-data/Makefile             | 66 +++++++++----------
 .../{overlay.dts => overlay.dtso}             |  0
 .../{overlay_0.dts => overlay_0.dtso}         |  0
 .../{overlay_1.dts => overlay_1.dtso}         |  0
 .../{overlay_10.dts => overlay_10.dtso}       |  0
 .../{overlay_11.dts => overlay_11.dtso}       |  0
 .../{overlay_12.dts => overlay_12.dtso}       |  0
 .../{overlay_13.dts => overlay_13.dtso}       |  0
 .../{overlay_15.dts => overlay_15.dtso}       |  0
 .../{overlay_16.dts => overlay_16.dtso}       |  0
 .../{overlay_17.dts => overlay_17.dtso}       |  0
 .../{overlay_18.dts => overlay_18.dtso}       |  0
 .../{overlay_19.dts => overlay_19.dtso}       |  0
 .../{overlay_2.dts => overlay_2.dtso}         |  0
 .../{overlay_20.dts => overlay_20.dtso}       |  0
 .../{overlay_3.dts => overlay_3.dtso}         |  0
 .../{overlay_4.dts => overlay_4.dtso}         |  0
 .../{overlay_5.dts => overlay_5.dtso}         |  0
 .../{overlay_6.dts => overlay_6.dtso}         |  0
 .../{overlay_7.dts => overlay_7.dtso}         |  0
 .../{overlay_8.dts => overlay_8.dtso}         |  0
 .../{overlay_9.dts => overlay_9.dtso}         |  0
 ...node.dts => overlay_bad_add_dup_node.dtso} |  0
 ...prop.dts => overlay_bad_add_dup_prop.dtso} |  0
 ...d_phandle.dts => overlay_bad_phandle.dtso} |  0
 ...bad_symbol.dts => overlay_bad_symbol.dtso} |  0
 .../{overlay_base.dts => overlay_base.dtso}   |  0
 ...erlay_gpio_01.dts => overlay_gpio_01.dtso} |  0
 ...lay_gpio_02a.dts => overlay_gpio_02a.dtso} |  0
 ...lay_gpio_02b.dts => overlay_gpio_02b.dtso} |  0
 ...erlay_gpio_03.dts => overlay_gpio_03.dtso} |  0
 ...lay_gpio_04a.dts => overlay_gpio_04a.dtso} |  0
 ...lay_gpio_04b.dts => overlay_gpio_04b.dtso} |  0
 .../{testcases.dts => testcases.dtso}         |  0
 drivers/of/unittest.c                         | 48 +++++++-------
 35 files changed, 57 insertions(+), 57 deletions(-)
 rename drivers/of/unittest-data/{overlay.dts => overlay.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_0.dts => overlay_0.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_1.dts => overlay_1.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_10.dts => overlay_10.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_11.dts => overlay_11.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_12.dts => overlay_12.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_13.dts => overlay_13.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_15.dts => overlay_15.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_16.dts => overlay_16.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_17.dts => overlay_17.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_18.dts => overlay_18.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_19.dts => overlay_19.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_2.dts => overlay_2.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_20.dts => overlay_20.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_3.dts => overlay_3.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_4.dts => overlay_4.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_5.dts => overlay_5.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_6.dts => overlay_6.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_7.dts => overlay_7.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_8.dts => overlay_8.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_9.dts => overlay_9.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_add_dup_node.dts => overlay_bad_add_dup_node.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_add_dup_prop.dts => overlay_bad_add_dup_prop.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_phandle.dts => overlay_bad_phandle.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_symbol.dts => overlay_bad_symbol.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_base.dts => overlay_base.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_01.dts => overlay_gpio_01.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_02a.dts => overlay_gpio_02a.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_02b.dts => overlay_gpio_02b.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_03.dts => overlay_gpio_03.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_04a.dts => overlay_gpio_04a.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_04b.dts => overlay_gpio_04b.dtso} (100%)
 rename drivers/of/unittest-data/{testcases.dts => testcases.dtso} (100%)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index d072f3ba39712..ea5f4da68e23a 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -1,38 +1,38 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += testcases.dtb.o
+obj-y += testcases.dtbo.o
 
-obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
-			    overlay_0.dtb.o \
-			    overlay_1.dtb.o \
-			    overlay_2.dtb.o \
-			    overlay_3.dtb.o \
-			    overlay_4.dtb.o \
-			    overlay_5.dtb.o \
-			    overlay_6.dtb.o \
-			    overlay_7.dtb.o \
-			    overlay_8.dtb.o \
-			    overlay_9.dtb.o \
-			    overlay_10.dtb.o \
-			    overlay_11.dtb.o \
-			    overlay_12.dtb.o \
-			    overlay_13.dtb.o \
-			    overlay_15.dtb.o \
-			    overlay_16.dtb.o \
-			    overlay_17.dtb.o \
-			    overlay_18.dtb.o \
-			    overlay_19.dtb.o \
-			    overlay_20.dtb.o \
-			    overlay_bad_add_dup_node.dtb.o \
-			    overlay_bad_add_dup_prop.dtb.o \
-			    overlay_bad_phandle.dtb.o \
-			    overlay_bad_symbol.dtb.o \
-			    overlay_base.dtb.o \
-			    overlay_gpio_01.dtb.o \
-			    overlay_gpio_02a.dtb.o \
-			    overlay_gpio_02b.dtb.o \
-			    overlay_gpio_03.dtb.o \
-			    overlay_gpio_04a.dtb.o \
-			    overlay_gpio_04b.dtb.o
+obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
+			    overlay_0.dtbo.o \
+			    overlay_1.dtbo.o \
+			    overlay_2.dtbo.o \
+			    overlay_3.dtbo.o \
+			    overlay_4.dtbo.o \
+			    overlay_5.dtbo.o \
+			    overlay_6.dtbo.o \
+			    overlay_7.dtbo.o \
+			    overlay_8.dtbo.o \
+			    overlay_9.dtbo.o \
+			    overlay_10.dtbo.o \
+			    overlay_11.dtbo.o \
+			    overlay_12.dtbo.o \
+			    overlay_13.dtbo.o \
+			    overlay_15.dtbo.o \
+			    overlay_16.dtbo.o \
+			    overlay_17.dtbo.o \
+			    overlay_18.dtbo.o \
+			    overlay_19.dtbo.o \
+			    overlay_20.dtbo.o \
+			    overlay_bad_add_dup_node.dtbo.o \
+			    overlay_bad_add_dup_prop.dtbo.o \
+			    overlay_bad_phandle.dtbo.o \
+			    overlay_bad_symbol.dtbo.o \
+			    overlay_base.dtbo.o \
+			    overlay_gpio_01.dtbo.o \
+			    overlay_gpio_02a.dtbo.o \
+			    overlay_gpio_02b.dtbo.o \
+			    overlay_gpio_03.dtbo.o \
+			    overlay_gpio_04a.dtbo.o \
+			    overlay_gpio_04b.dtbo.o
 
 # enable creation of __symbols__ node
 DTC_FLAGS_overlay += -@
diff --git a/drivers/of/unittest-data/overlay.dts b/drivers/of/unittest-data/overlay.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay.dts
rename to drivers/of/unittest-data/overlay.dtso
diff --git a/drivers/of/unittest-data/overlay_0.dts b/drivers/of/unittest-data/overlay_0.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_0.dts
rename to drivers/of/unittest-data/overlay_0.dtso
diff --git a/drivers/of/unittest-data/overlay_1.dts b/drivers/of/unittest-data/overlay_1.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_1.dts
rename to drivers/of/unittest-data/overlay_1.dtso
diff --git a/drivers/of/unittest-data/overlay_10.dts b/drivers/of/unittest-data/overlay_10.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_10.dts
rename to drivers/of/unittest-data/overlay_10.dtso
diff --git a/drivers/of/unittest-data/overlay_11.dts b/drivers/of/unittest-data/overlay_11.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_11.dts
rename to drivers/of/unittest-data/overlay_11.dtso
diff --git a/drivers/of/unittest-data/overlay_12.dts b/drivers/of/unittest-data/overlay_12.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_12.dts
rename to drivers/of/unittest-data/overlay_12.dtso
diff --git a/drivers/of/unittest-data/overlay_13.dts b/drivers/of/unittest-data/overlay_13.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_13.dts
rename to drivers/of/unittest-data/overlay_13.dtso
diff --git a/drivers/of/unittest-data/overlay_15.dts b/drivers/of/unittest-data/overlay_15.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_15.dts
rename to drivers/of/unittest-data/overlay_15.dtso
diff --git a/drivers/of/unittest-data/overlay_16.dts b/drivers/of/unittest-data/overlay_16.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_16.dts
rename to drivers/of/unittest-data/overlay_16.dtso
diff --git a/drivers/of/unittest-data/overlay_17.dts b/drivers/of/unittest-data/overlay_17.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_17.dts
rename to drivers/of/unittest-data/overlay_17.dtso
diff --git a/drivers/of/unittest-data/overlay_18.dts b/drivers/of/unittest-data/overlay_18.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_18.dts
rename to drivers/of/unittest-data/overlay_18.dtso
diff --git a/drivers/of/unittest-data/overlay_19.dts b/drivers/of/unittest-data/overlay_19.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_19.dts
rename to drivers/of/unittest-data/overlay_19.dtso
diff --git a/drivers/of/unittest-data/overlay_2.dts b/drivers/of/unittest-data/overlay_2.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_2.dts
rename to drivers/of/unittest-data/overlay_2.dtso
diff --git a/drivers/of/unittest-data/overlay_20.dts b/drivers/of/unittest-data/overlay_20.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_20.dts
rename to drivers/of/unittest-data/overlay_20.dtso
diff --git a/drivers/of/unittest-data/overlay_3.dts b/drivers/of/unittest-data/overlay_3.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_3.dts
rename to drivers/of/unittest-data/overlay_3.dtso
diff --git a/drivers/of/unittest-data/overlay_4.dts b/drivers/of/unittest-data/overlay_4.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_4.dts
rename to drivers/of/unittest-data/overlay_4.dtso
diff --git a/drivers/of/unittest-data/overlay_5.dts b/drivers/of/unittest-data/overlay_5.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_5.dts
rename to drivers/of/unittest-data/overlay_5.dtso
diff --git a/drivers/of/unittest-data/overlay_6.dts b/drivers/of/unittest-data/overlay_6.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_6.dts
rename to drivers/of/unittest-data/overlay_6.dtso
diff --git a/drivers/of/unittest-data/overlay_7.dts b/drivers/of/unittest-data/overlay_7.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_7.dts
rename to drivers/of/unittest-data/overlay_7.dtso
diff --git a/drivers/of/unittest-data/overlay_8.dts b/drivers/of/unittest-data/overlay_8.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_8.dts
rename to drivers/of/unittest-data/overlay_8.dtso
diff --git a/drivers/of/unittest-data/overlay_9.dts b/drivers/of/unittest-data/overlay_9.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_9.dts
rename to drivers/of/unittest-data/overlay_9.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_node.dts b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_add_dup_node.dts
rename to drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dts b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_add_dup_prop.dts
rename to drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_phandle.dts b/drivers/of/unittest-data/overlay_bad_phandle.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_phandle.dts
rename to drivers/of/unittest-data/overlay_bad_phandle.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_symbol.dts b/drivers/of/unittest-data/overlay_bad_symbol.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_symbol.dts
rename to drivers/of/unittest-data/overlay_bad_symbol.dtso
diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_base.dts
rename to drivers/of/unittest-data/overlay_base.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_01.dts b/drivers/of/unittest-data/overlay_gpio_01.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_01.dts
rename to drivers/of/unittest-data/overlay_gpio_01.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_02a.dts b/drivers/of/unittest-data/overlay_gpio_02a.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_02a.dts
rename to drivers/of/unittest-data/overlay_gpio_02a.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_02b.dts b/drivers/of/unittest-data/overlay_gpio_02b.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_02b.dts
rename to drivers/of/unittest-data/overlay_gpio_02b.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_03.dts b/drivers/of/unittest-data/overlay_gpio_03.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_03.dts
rename to drivers/of/unittest-data/overlay_gpio_03.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_04a.dts b/drivers/of/unittest-data/overlay_gpio_04a.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_04a.dts
rename to drivers/of/unittest-data/overlay_gpio_04a.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_04b.dts b/drivers/of/unittest-data/overlay_gpio_04b.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_04b.dts
rename to drivers/of/unittest-data/overlay_gpio_04b.dtso
diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dtso
similarity index 100%
rename from drivers/of/unittest-data/testcases.dts
rename to drivers/of/unittest-data/testcases.dtso
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index b89ab5d9fea55..1d810c0e18f8c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1423,12 +1423,12 @@ static int __init unittest_data_add(void)
 	void *unittest_data_align;
 	struct device_node *unittest_data_node = NULL, *np;
 	/*
-	 * __dtb_testcases_begin[] and __dtb_testcases_end[] are magically
-	 * created by cmd_dt_S_dtb in scripts/Makefile.lib
+	 * __dtbo_testcases_begin[] and __dtbo_testcases_end[] are magically
+	 * created by cmd_dt_S_dtbo in scripts/Makefile.lib
 	 */
-	extern uint8_t __dtb_testcases_begin[];
-	extern uint8_t __dtb_testcases_end[];
-	const int size = __dtb_testcases_end - __dtb_testcases_begin;
+	extern uint8_t __dtbo_testcases_begin[];
+	extern uint8_t __dtbo_testcases_end[];
+	const int size = __dtbo_testcases_end - __dtbo_testcases_begin;
 	int rc;
 	void *ret;
 
@@ -1443,7 +1443,7 @@ static int __init unittest_data_add(void)
 		return -ENOMEM;
 
 	unittest_data_align = PTR_ALIGN(unittest_data, FDT_ALIGN_SIZE);
-	memcpy(unittest_data_align, __dtb_testcases_begin, size);
+	memcpy(unittest_data_align, __dtbo_testcases_begin, size);
 
 	ret = of_fdt_unflatten_tree(unittest_data_align, NULL, &unittest_data_node);
 	if (!ret) {
@@ -3003,24 +3003,24 @@ static inline void __init of_unittest_overlay(void) { }
 #ifdef CONFIG_OF_OVERLAY
 
 /*
- * __dtb_ot_begin[] and __dtb_ot_end[] are created by cmd_dt_S_dtb
- * in scripts/Makefile.lib
+ * __dtbo_##overlay_name##_begin[] and __dtbo_##overlay_name##_end[] are
+ * created by cmd_dt_S_dtbo in scripts/Makefile.lib
  */
 
-#define OVERLAY_INFO_EXTERN(name) \
-	extern uint8_t __dtb_##name##_begin[]; \
-	extern uint8_t __dtb_##name##_end[]
+#define OVERLAY_INFO_EXTERN(overlay_name) \
+	extern uint8_t __dtbo_##overlay_name##_begin[]; \
+	extern uint8_t __dtbo_##overlay_name##_end[]
 
-#define OVERLAY_INFO(overlay_name, expected)             \
-{	.dtb_begin       = __dtb_##overlay_name##_begin, \
-	.dtb_end         = __dtb_##overlay_name##_end,   \
-	.expected_result = expected,                     \
-	.name            = #overlay_name,                \
+#define OVERLAY_INFO(overlay_name, expected) \
+{	.dtbo_begin       = __dtbo_##overlay_name##_begin, \
+	.dtbo_end         = __dtbo_##overlay_name##_end, \
+	.expected_result = expected, \
+	.name            = #overlay_name, \
 }
 
 struct overlay_info {
-	uint8_t		*dtb_begin;
-	uint8_t		*dtb_end;
+	uint8_t		*dtbo_begin;
+	uint8_t		*dtbo_end;
 	int		expected_result;
 	int		ovcs_id;
 	char		*name;
@@ -3094,7 +3094,7 @@ static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
 	OVERLAY_INFO(overlay_bad_symbol, -EINVAL),
 	/* end marker */
-	{.dtb_begin = NULL, .dtb_end = NULL, .expected_result = 0, .name = NULL}
+	{.dtbo_begin = NULL, .dtbo_end = NULL, .expected_result = 0, .name = NULL}
 };
 
 static struct device_node *overlay_base_root;
@@ -3151,13 +3151,13 @@ void __init unittest_unflatten_overlay_base(void)
 		return;
 	}
 
-	data_size = info->dtb_end - info->dtb_begin;
+	data_size = info->dtbo_end - info->dtbo_begin;
 	if (!data_size) {
 		pr_err("No dtb 'overlay_base' to attach\n");
 		return;
 	}
 
-	size = fdt_totalsize(info->dtb_begin);
+	size = fdt_totalsize(info->dtbo_begin);
 	if (size != data_size) {
 		pr_err("dtb 'overlay_base' header totalsize != actual size");
 		return;
@@ -3169,7 +3169,7 @@ void __init unittest_unflatten_overlay_base(void)
 		return;
 	}
 
-	memcpy(new_fdt, info->dtb_begin, size);
+	memcpy(new_fdt, info->dtbo_begin, size);
 
 	__unflatten_device_tree(new_fdt, NULL, &overlay_base_root,
 				dt_alloc_memory, true);
@@ -3204,11 +3204,11 @@ static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
 		return 0;
 	}
 
-	size = info->dtb_end - info->dtb_begin;
+	size = info->dtbo_end - info->dtbo_begin;
 	if (!size)
 		pr_err("no overlay data for %s\n", overlay_name);
 
-	ret = of_overlay_fdt_apply(info->dtb_begin, size, &info->ovcs_id);
+	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &info->ovcs_id);
 	if (ovcs_id)
 		*ovcs_id = info->ovcs_id;
 	if (ret < 0)
-- 
2.37.3

