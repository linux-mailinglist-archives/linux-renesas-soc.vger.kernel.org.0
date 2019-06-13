Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1177943F0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbfFMPyj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:54:39 -0400
Received: from sauhun.de ([88.99.104.3]:41940 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731773AbfFMPy1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 11:54:27 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id 6F2F24A12AA;
        Thu, 13 Jun 2019 17:54:25 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: mn88473: don't check retval after our own assignemt
Date:   Thu, 13 Jun 2019 17:54:19 +0200
Message-Id: <20190613155421.16408-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
References: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No need to check a retval after we assigned a constant to it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/dvb-frontends/mn88473.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88473.c b/drivers/media/dvb-frontends/mn88473.c
index 08118b38533b..d1b11909825c 100644
--- a/drivers/media/dvb-frontends/mn88473.c
+++ b/drivers/media/dvb-frontends/mn88473.c
@@ -661,8 +661,7 @@ static int mn88473_probe(struct i2c_client *client,
 	if (dev->client[1] == NULL) {
 		ret = -ENODEV;
 		dev_err(&client->dev, "I2C registration failed\n");
-		if (ret)
-			goto err_regmap_0_regmap_exit;
+		goto err_regmap_0_regmap_exit;
 	}
 	dev->regmap[1] = regmap_init_i2c(dev->client[1], &regmap_config);
 	if (IS_ERR(dev->regmap[1])) {
@@ -675,8 +674,7 @@ static int mn88473_probe(struct i2c_client *client,
 	if (dev->client[2] == NULL) {
 		ret = -ENODEV;
 		dev_err(&client->dev, "2nd I2C registration failed\n");
-		if (ret)
-			goto err_regmap_1_regmap_exit;
+		goto err_regmap_1_regmap_exit;
 	}
 	dev->regmap[2] = regmap_init_i2c(dev->client[2], &regmap_config);
 	if (IS_ERR(dev->regmap[2])) {
-- 
2.20.1

