Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2625D781F4D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 20:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjHTSrM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 14:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbjHTSrI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 14:47:08 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D01393A85;
        Sun, 20 Aug 2023 11:44:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="177101049"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Aug 2023 03:44:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 333A5406BF94;
        Mon, 21 Aug 2023 03:44:11 +0900 (JST)
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
Subject: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for data in the match tables
Date:   Sun, 20 Aug 2023 19:44:00 +0100
Message-Id: <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
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

Convert enum->pointer for data in the match tables, so that
device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
bus type match support added to it and it returns NULL for non-match.

Therefore it is better to convert enum->pointer for data match and extend
match support for both ID and OF tables by using i2c_get_match_data() by
adding struct rt1711h_chip_info with did variable and replacing did->info
in struct rt1711h_chip. Later patches will add more hw differences to
struct rt1711h_chip_info and avoid checking did for HW differences.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 30 ++++++++++++++++++--------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 1e13ce3c4b35..c9392919226a 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -51,13 +51,17 @@
 /* 1b0 as fixed rx threshold of rd/rp 0.55V, 1b1 depends on RTCRTL4[0] */
 #define BMCIO_RXDZEN	BIT(0)
 
+struct rt1711h_chip_info {
+	u16 did;
+};
+
 struct rt1711h_chip {
 	struct tcpci_data data;
 	struct tcpci *tcpci;
 	struct device *dev;
 	struct regulator *vbus;
 	bool src_en;
-	u16 did;
+	const struct rt1711h_chip_info *info;
 };
 
 static int rt1711h_read16(struct rt1711h_chip *chip, unsigned int reg, u16 *val)
@@ -105,7 +109,7 @@ static int rt1711h_init(struct tcpci *tcpci, struct tcpci_data *tdata)
 		return ret;
 
 	/* Enable PD30 extended message for RT1715 */
-	if (chip->did == RT1715_DID) {
+	if (chip->info->did == RT1715_DID) {
 		ret = regmap_update_bits(regmap, RT1711H_RTCTRL8,
 					 RT1711H_ENEXTMSG, RT1711H_ENEXTMSG);
 		if (ret < 0)
@@ -200,7 +204,7 @@ static inline int rt1711h_init_cc_params(struct rt1711h_chip *chip, u8 status)
 	if ((cc1 >= TYPEC_CC_RP_1_5 && cc2 < TYPEC_CC_RP_DEF) ||
 	    (cc2 >= TYPEC_CC_RP_1_5 && cc1 < TYPEC_CC_RP_DEF)) {
 		rxdz_en = BMCIO_RXDZEN;
-		if (chip->did == RT1715_DID)
+		if (chip->info->did == RT1715_DID)
 			rxdz_sel = RT1711H_BMCIO_RXDZSEL;
 		else
 			rxdz_sel = 0;
@@ -319,7 +323,7 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
 	ret = i2c_smbus_read_word_data(i2c, TCPC_BCD_DEV);
 	if (ret < 0)
 		return ret;
-	if (ret != chip->did) {
+	if (ret != chip->info->did) {
 		dev_err(&i2c->dev, "did is not correct, 0x%04x\n", ret);
 		return -ENODEV;
 	}
@@ -336,7 +340,7 @@ static int rt1711h_probe(struct i2c_client *client)
 	if (!chip)
 		return -ENOMEM;
 
-	chip->did = (size_t)device_get_match_data(&client->dev);
+	chip->info = i2c_get_match_data(client);
 
 	ret = rt1711h_check_revision(client, chip);
 	if (ret < 0) {
@@ -391,17 +395,25 @@ static void rt1711h_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
+static const struct rt1711h_chip_info rt1711h = {
+	.did = RT1711H_DID,
+};
+
+static const struct rt1711h_chip_info rt1715 = {
+	.did = RT1715_DID,
+};
+
 static const struct i2c_device_id rt1711h_id[] = {
-	{ "rt1711h", RT1711H_DID },
-	{ "rt1715", RT1715_DID },
+	{ "rt1711h", (kernel_ulong_t)&rt1711h },
+	{ "rt1715", (kernel_ulong_t)&rt1715 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id rt1711h_of_match[] = {
-	{ .compatible = "richtek,rt1711h", .data = (void *)RT1711H_DID },
-	{ .compatible = "richtek,rt1715", .data = (void *)RT1715_DID },
+	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
+	{ .compatible = "richtek,rt1715", .data = &rt1715 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rt1711h_of_match);
-- 
2.25.1

