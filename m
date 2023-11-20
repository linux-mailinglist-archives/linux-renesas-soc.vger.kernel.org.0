Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF057F1815
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 17:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbjKTQDj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 11:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbjKTQDi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 11:03:38 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656EA116
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:34 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso57627761fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700496212; x=1701101012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWR8mH0snzJeJ0OqKxEnUfckbbEo5Y+jU7UsXhSvYEg=;
        b=syTMbxR/1W+Ye7l3Fhe/hdFfCcGkNhzawL+Y92c5BM7k9fIjox0pxbrOSbhqB1T5pf
         w7Igyp0DbCnmjAF2UVDYrVeDqpZ0gxZnYavNHZLpbejQcZxp0+3RruD4SQxuI7uqRq/Q
         IRqVLefLrw763tc5yt0f0zgvkuYfuBnQzTatbxuqxZPnuZoMn5Sqmg6GYOitDBui9TTb
         gtOuKKAndK+W0v2JO1aphzqQuquu92JC44ZnyGTwTp6BVv/p3siAZpXbEdK0muFqx0UH
         fqNQSBDal8tIa618rmnRDwS/+JGFhgZ57tqfQthBdfAX03SNQwgS6rbCiJdwlXYU6LJU
         vXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496212; x=1701101012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWR8mH0snzJeJ0OqKxEnUfckbbEo5Y+jU7UsXhSvYEg=;
        b=mGJz9Zp9gvzZcXNA5xt1mgg1FV0Sc0vXtQ2TgwsVQtkajFuHVTOWh97DoBdMlGSYTg
         h3eGWnPl18IWv9coyT0xAiLMQe4LQgYm1pn12m8BcvdDBcaweiPgbJJyPc2FP5LgmKkW
         cL1/2BNIWDkDnbTahhQiQxTUiBId49vIU15+HodMpmyLiaMy289n5xPRqeZFsOlW/opL
         iwLARvTWN231KEODnqBrrA4n9l/giiSoOuT71Ki3i/7huJu51MGhXjJyhU5JL+jAREU2
         qz1F/YZuee4B1fhoVc8XKijV03INHuUijMAKmfkXwV1kAyeryNS3s2Ackz4+oduh9Pix
         kcIA==
X-Gm-Message-State: AOJu0Yzp4am/gOeMXQ7neXHoEMcRiLZz2xdWljea30xlQtKl8oeNCD4U
        MRm2mYOYD+rBryHutdwIpxe9zg==
X-Google-Smtp-Source: AGHT+IFWxADQkF/OwNhFoaa3Lm6bCrCfgTEaR5/3SxqpH39mcIVeYXeRfrfdcrPUNFNYoyVJlqfDrQ==
X-Received: by 2002:a05:651c:382:b0:2c8:87d6:1fbb with SMTP id e2-20020a05651c038200b002c887d61fbbmr756247ljp.31.1700496212571;
        Mon, 20 Nov 2023 08:03:32 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id m21-20020a7bce15000000b004080f0376a0sm13564631wmc.42.2023.11.20.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:03:31 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [net-next v2 4/5] net: ethernet: renesas: rcar_gen4_ptp: Get clock increment from clock rate
Date:   Mon, 20 Nov 2023 17:01:17 +0100
Message-ID: <20231120160118.3524309-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of using hard coded clock increment values for each SoC derive
the clock increment from the module clock. This is done in preparation
to support a second platform, R-Car V4H that uses a 200Mhz clock
compared with the 320Mhz clock used on R-Car S4.

Tested on both SoCs,

S4 reports a clock of 320000000Hz which gives a value of 0x19000000.
Documentation says a 320Mhz clock is used and the correct increment for
that clock is 0x19000000.

V4H reports a clock of 199999992Hz which gives a value of 0x2800001a.
Documentation says a 200Mhz clock is used and the correct increment for
that clock is 0x28000000.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- New in v2. In v1 a patch adding a new hard coded value for V4H was
  present, that patch have been dropped in favor of this approach.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 14 ++++++++++++--
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  4 +---
 drivers/net/ethernet/renesas/rswitch.c       |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 59f6351e9ae9..9583894634ae 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -141,8 +141,18 @@ static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
 	return 0;
 }
 
+static s64 rcar_gen4_ptp_rate_to_increment(u32 rate)
+{
+	/* Timer increment in ns.
+	 * bit[31:27] - integer
+	 * bit[26:0]  - decimal
+	 * increment[ns] = perid[ns] * 2^27 => (1ns * 2^27) / rate[hz]
+	 */
+	return div_s64(1000000000LL << 27, rate);
+}
+
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
-			   enum rcar_gen4_ptp_reg_layout layout, u32 clock)
+			   enum rcar_gen4_ptp_reg_layout layout, u32 rate)
 {
 	int ret;
 
@@ -155,7 +165,7 @@ int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
 	if (ret)
 		return ret;
 
-	ptp_priv->default_addend = clock;
+	ptp_priv->default_addend = rcar_gen4_ptp_rate_to_increment(rate);
 	iowrite32(ptp_priv->default_addend, ptp_priv->addr + ptp_priv->offs->increment);
 	ptp_priv->clock = ptp_clock_register(&ptp_priv->info, NULL);
 	if (IS_ERR(ptp_priv->clock))
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 35664d1dc472..e22da5acd53d 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -9,8 +9,6 @@
 
 #include <linux/ptp_clock_kernel.h>
 
-#define PTPTIVC_INIT			0x19000000	/* 320MHz */
-#define RCAR_GEN4_PTP_CLOCK_S4		PTPTIVC_INIT
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
 enum rcar_gen4_ptp_reg_layout {
@@ -64,7 +62,7 @@ struct rcar_gen4_ptp_private {
 };
 
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
-			   enum rcar_gen4_ptp_reg_layout layout, u32 clock);
+			   enum rcar_gen4_ptp_reg_layout layout, u32 rate);
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv);
 struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev);
 
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index e1e29a2caf22..d6089429f654 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1829,7 +1829,7 @@ static int rswitch_init(struct rswitch_private *priv)
 	rswitch_fwd_init(priv);
 
 	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
-				     RCAR_GEN4_PTP_CLOCK_S4);
+				     clk_get_rate(priv->clk));
 	if (err < 0)
 		goto err_ptp_register;
 
-- 
2.42.1

