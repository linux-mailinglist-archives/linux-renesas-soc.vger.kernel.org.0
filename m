Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4282E781F52
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 20:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbjHTSre (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjHTSrd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 14:47:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22F603A98;
        Sun, 20 Aug 2023 11:44:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="177101052"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Aug 2023 03:44:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CBCB3406BF94;
        Mon, 21 Aug 2023 03:44:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add rxdz_sel variable to struct rt1711h_chip_info
Date:   Sun, 20 Aug 2023 19:44:01 +0100
Message-Id: <20230820184402.102486-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
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

The RT1715 needs 0.35V/0.75V rx threshold for rd/rp whereas it is 0.4V/0.7V
for RT1711H. Add rxdz_sel variable to struct rt1711h_chip_info for
handling this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index c9392919226a..1b1753895ca5 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -53,6 +53,7 @@
 
 struct rt1711h_chip_info {
 	u16 did;
+	u32 rxdz_sel;
 };
 
 struct rt1711h_chip {
@@ -204,10 +205,7 @@ static inline int rt1711h_init_cc_params(struct rt1711h_chip *chip, u8 status)
 	if ((cc1 >= TYPEC_CC_RP_1_5 && cc2 < TYPEC_CC_RP_DEF) ||
 	    (cc2 >= TYPEC_CC_RP_1_5 && cc1 < TYPEC_CC_RP_DEF)) {
 		rxdz_en = BMCIO_RXDZEN;
-		if (chip->info->did == RT1715_DID)
-			rxdz_sel = RT1711H_BMCIO_RXDZSEL;
-		else
-			rxdz_sel = 0;
+		rxdz_sel = chip->info->rxdz_sel;
 	} else {
 		rxdz_en = 0;
 		rxdz_sel = RT1711H_BMCIO_RXDZSEL;
@@ -397,10 +395,12 @@ static void rt1711h_remove(struct i2c_client *client)
 
 static const struct rt1711h_chip_info rt1711h = {
 	.did = RT1711H_DID,
+	.rxdz_sel = 0,
 };
 
 static const struct rt1711h_chip_info rt1715 = {
 	.did = RT1715_DID,
+	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
-- 
2.25.1

