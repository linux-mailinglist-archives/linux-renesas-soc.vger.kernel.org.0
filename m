Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4616E78DC78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Aug 2023 20:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238633AbjH3Spv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Aug 2023 14:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245048AbjH3OYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 10:24:44 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D50F12F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 07:24:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; 
   d="scan'208";a="174486546"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DC26942170F5;
        Wed, 30 Aug 2023 23:24:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 5/8] drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
Date:   Wed, 30 Aug 2023 15:23:55 +0100
Message-Id: <20230830142358.275459-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
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

The ADV7533 and ADV7535 have an offset(0x70) for the CEC register map
compared to ADV7511. Add the reg_cec_offset variable to struct
adv7511_chip_info to handle this difference and drop the reg_cec_offset
variable from struct adv7511.

This will avoid assigning reg_cec_offset based on chip type and also
testing for multiple chip types for calling adv7533_patch_cec_registers().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 14 +++++++-------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index edf7be9c21d3..a728bfb33d03 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -339,6 +339,7 @@ struct adv7511_chip_info {
 	unsigned int max_lane_freq_khz;
 	const char * const *supply_names;
 	unsigned int num_supplies;
+	unsigned int reg_cec_offset;
 };
 
 struct adv7511 {
@@ -349,7 +350,6 @@ struct adv7511 {
 
 	struct regmap *regmap;
 	struct regmap *regmap_cec;
-	unsigned int reg_cec_offset;
 	enum drm_connector_status status;
 	bool powered;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 2a6b91f752cb..44451a9658a3 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -33,7 +33,7 @@ static const u8 ADV7511_REG_CEC_RX_FRAME_LEN[] = {
 
 static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 {
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 	unsigned int val;
 
 	if (regmap_read(adv7511->regmap_cec,
@@ -84,7 +84,7 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 
 static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
 {
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 	struct cec_msg msg = {};
 	unsigned int len;
 	unsigned int val;
@@ -121,7 +121,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
 
 void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 {
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 	const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
 				ADV7511_INT1_CEC_TX_ARBIT_LOST |
 				ADV7511_INT1_CEC_TX_RETRY_TIMEOUT;
@@ -177,7 +177,7 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct adv7511 *adv7511 = cec_get_drvdata(adap);
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 
 	if (adv7511->i2c_cec == NULL)
 		return -EIO;
@@ -223,7 +223,7 @@ static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
 {
 	struct adv7511 *adv7511 = cec_get_drvdata(adap);
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 	unsigned int i, free_idx = ADV7511_MAX_ADDRS;
 
 	if (!adv7511->cec_enabled_adap)
@@ -292,7 +292,7 @@ static int adv7511_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				     u32 signal_free_time, struct cec_msg *msg)
 {
 	struct adv7511 *adv7511 = cec_get_drvdata(adap);
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 	u8 len = msg->len;
 	unsigned int i;
 
@@ -345,7 +345,7 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 
 int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
-	unsigned int offset = adv7511->reg_cec_offset;
+	unsigned int offset = adv7511->info->reg_cec_offset;
 	int ret = adv7511_cec_parse_dt(dev, adv7511);
 
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 2bcd17953221..d806c870bf76 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1035,7 +1035,7 @@ static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	reg -= adv7511->reg_cec_offset;
+	reg -= adv7511->info->reg_cec_offset;
 
 	switch (reg) {
 	case ADV7511_REG_CEC_RX1_FRAME_HDR:
@@ -1086,12 +1086,10 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 		goto err;
 	}
 
-	if (adv->info->type == ADV7533 || adv->info->type == ADV7535) {
+	if (adv->info->reg_cec_offset == ADV7533_REG_CEC_OFFSET) {
 		ret = adv7533_patch_cec_registers(adv);
 		if (ret)
 			goto err;
-
-		adv->reg_cec_offset = ADV7533_REG_CEC_OFFSET;
 	}
 
 	return 0;
@@ -1368,6 +1366,7 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 	.max_lane_freq_khz = 800000,
 	.supply_names = adv7533_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
+	.reg_cec_offset = ADV7533_REG_CEC_OFFSET,
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
@@ -1376,6 +1375,7 @@ static const struct adv7511_chip_info adv7535_chip_info = {
 	.max_lane_freq_khz = 891000,
 	.supply_names = adv7533_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
+	.reg_cec_offset = ADV7533_REG_CEC_OFFSET,
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

