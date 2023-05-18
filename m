Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F88E708565
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 17:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjERP46 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 May 2023 11:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjERP46 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2023 11:56:58 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17269E3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2023 08:56:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,285,1677510000"; 
   d="scan'208";a="159865402"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2023 00:56:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.79])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B012400F7FC;
        Fri, 19 May 2023 00:56:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 1/3] reset: Add reset_controller_get_dev()
Date:   Thu, 18 May 2023 16:56:47 +0100
Message-Id: <20230518155649.516346-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
References: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
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

Add support for finding the device associated with the reset controller.

A reset consumer can use this API to find the reset controller device
and then call the corresponding provider device to configure some register.
(eg: As per latest RZ/G2L HW manual Rev 1.30 RZ/G2L USB phy controller
IP exposes a register for vbus control selection)

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/core.c             | 14 ++++++++++++++
 include/linux/reset-controller.h |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index f0a076e94118..e85d268ada98 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -191,6 +191,20 @@ void reset_controller_add_lookup(struct reset_control_lookup *lookup,
 }
 EXPORT_SYMBOL_GPL(reset_controller_add_lookup);
 
+/**
+ * reset_controller_get_dev - get reset controller device
+ * @rstc: reset controller
+ */
+struct reset_controller_dev *
+reset_controller_get_dev(struct reset_control *rstc)
+{
+	if (!rstc)
+		return NULL;
+
+	return rstc->rcdev;
+}
+EXPORT_SYMBOL_GPL(reset_controller_get_dev);
+
 static inline struct reset_control_array *
 rstc_to_array(struct reset_control *rstc) {
 	return container_of(rstc, struct reset_control_array, base);
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 0fa4f60e1186..304f79b3eb44 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -5,6 +5,7 @@
 #include <linux/list.h>
 
 struct reset_controller_dev;
+struct reset_control;
 
 /**
  * struct reset_control_ops - reset controller driver callbacks
@@ -89,6 +90,8 @@ int devm_reset_controller_register(struct device *dev,
 
 void reset_controller_add_lookup(struct reset_control_lookup *lookup,
 				 unsigned int num_entries);
+
+struct reset_controller_dev *reset_controller_get_dev(struct reset_control *rstc);
 #else
 static inline int reset_controller_register(struct reset_controller_dev *rcdev)
 {
@@ -109,6 +112,12 @@ static inline void reset_controller_add_lookup(struct reset_control_lookup *look
 					       unsigned int num_entries)
 {
 }
+
+static inline struct reset_controller_dev *
+reset_controller_get_dev(struct reset_control *rstc)
+{
+	return 0;
+}
 #endif
 
 #endif
-- 
2.25.1

