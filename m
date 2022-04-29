Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76E2514764
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357976AbiD2Kw3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358292AbiD2KvO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:51:14 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1135CE101;
        Fri, 29 Apr 2022 03:46:17 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 02ECA10000C;
        Fri, 29 Apr 2022 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651229176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n7UTh06UyThE/1bsw2IRPyyoiktklBD9/M4mSgyJGow=;
        b=Yl0m/HvfLqBks9JFsJYgPe80AaJvlolH4Zq0oC/qmV3nrHeHvlSc85+GeeGq3GDGO8C/D6
        3bR2QQwVQsuNmTfjQeEnXJ3utg1LrNWW6OQKzD9BXDh0SCWzWrRHp2tsLDJx09ayOsOskI
        KLgGH5jaaD1ptWiuDxjdX86kQtAufXMSrq1O03xhldtLYihFWkgtiEXmHNsUt9sVN1NdZR
        gzsCpJdcti4CmbaRLHhYzs85s5AnQo7cvMkIZjHXvLvQuPihD9YaZBtdGMUz4xOf9roBiU
        yZHUUTnmV7qSQMopfIOyksdy+yYRUBaogXQPuNFWxwtbzhvdttMdQnFJLZ2KUw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v3 4/6] rtc: rzn1: Add oscillator offset support
Date:   Fri, 29 Apr 2022 12:46:00 +0200
Message-Id: <20220429104602.368055-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429104602.368055-1-miquel.raynal@bootlin.com>
References: <20220429104602.368055-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZN1 RTC can compensate the imprecision of the oscillator up to
approximately 190ppm.

Seconds can last slightly shorter or longer depending on the
configuration.

Below ~65ppm of correction, we can change the time spent in a second
every minute, which is the most accurate compensation that the RTC can
offer. Above, the compensation will be active every 20s.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/rtc/rtc-rzn1.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 5efbc1aa9040..6d05d0454a98 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -248,12 +248,85 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return 0;
 }
 
+static int rzn1_rtc_read_offset(struct device *dev, long *offset)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	unsigned int ppb_per_step;
+	bool subtract;
+	u32 val;
+
+	val = readl(rtc->base + RZN1_RTC_SUBU);
+	ppb_per_step = val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
+	subtract = val & RZN1_RTC_SUBU_DECR;
+	val &= 0x3F;
+
+	if (!val)
+		*offset = 0;
+	else if (subtract)
+		*offset = -(((~val) & 0x3F) + 1) * ppb_per_step;
+	else
+		*offset = (val - 1) * ppb_per_step;
+
+	return 0;
+}
+
+static int rzn1_rtc_set_offset(struct device *dev, long offset)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	unsigned int steps, ppb_per_step;
+	int stepsh, stepsl;
+	u32 val;
+	int ret;
+
+	/*
+	 * Check which resolution mode (every 20 or 60s) can be used.
+	 * Between 2 and 124 clock pulses can be added or substracted.
+	 *
+	 * In 20s mode, the minimum resolution is 2 / (32768 * 20) which is
+	 * close to 3051 ppb. In 60s mode, the resolution is closer to 1017.
+	 */
+	stepsh = DIV_ROUND_CLOSEST(offset, 1017);
+	stepsl = DIV_ROUND_CLOSEST(offset, 3051);
+
+	if (stepsh >= -0x3E && stepsh <= 0x3E) {
+		ppb_per_step = 1017;
+		steps = stepsh;
+		val |= RZN1_RTC_SUBU_DEV;
+	} else if (stepsl >= -0x3E && stepsl <= 0x3E) {
+		ppb_per_step = 3051;
+		steps = stepsl;
+	} else {
+		return -ERANGE;
+	}
+
+	if (!steps)
+		return 0;
+
+	if (steps > 0) {
+		val |= steps + 1;
+	} else {
+		val |= RZN1_RTC_SUBU_DECR;
+		val |= (~(-steps - 1)) & 0x3F;
+	}
+
+	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
+				 !(val & RZN1_RTC_CTL2_WUST), 100, 2000000);
+	if (ret)
+		return ret;
+
+	writel(val, rtc->base + RZN1_RTC_SUBU);
+
+	return 0;
+}
+
 static const struct rtc_class_ops rzn1_rtc_ops = {
 	.read_time = rzn1_rtc_read_time,
 	.set_time = rzn1_rtc_set_time,
 	.read_alarm = rzn1_rtc_read_alarm,
 	.set_alarm = rzn1_rtc_set_alarm,
 	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
+	.read_offset = rzn1_rtc_read_offset,
+	.set_offset = rzn1_rtc_set_offset,
 };
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
-- 
2.27.0

