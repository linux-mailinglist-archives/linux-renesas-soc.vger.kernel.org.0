Return-Path: <linux-renesas-soc+bounces-42-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30027F32D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161B4282E92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F29E59179;
	Tue, 21 Nov 2023 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="aQbno+Ou"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C0D192
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:45 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-548ce28fd23so2859722a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700582024; x=1701186824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17V51IIEuxQd+MF/T/vSwMOo1lXut//MySN2a8SEJuw=;
        b=aQbno+Ou3RpQ3/GITQEleP4BsvQ7A4DBxwpoJFndd9Ewt0yFQ4KyI+4lTe1UwD6h5G
         fgF5/2DiAfYz9F1U/n9BBzL+60CdKuE8t8cb/NQKw0OzeeVKh/eBOVaphQbisCbdCIrE
         8rs2F4HpkkS0R8hQUaCEU8Z0GELf4QBYCYC0jLGAXN2HmvSKEKIZOaQ0L4bHA5u9tq4g
         ZKcNLFWN1kPOjeUGGa+CiySOGq70SxJah6BT8zp5BcBehinbiqqOA0E6lWhkfjj6X6gZ
         JPzZIpbu98VA0ksBGEKC6+8zApLfatwROjykqTYIHH8fxUo5x0D525xJd9WyhjNIXFHp
         DdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582024; x=1701186824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17V51IIEuxQd+MF/T/vSwMOo1lXut//MySN2a8SEJuw=;
        b=Eh1L5AVnWouDdRgtbsD0DVYqA7l0rt0oMIhP9PW09TkLhsom31XpObkhCH/sjNuYRm
         kRXjoNRq6kyVccDl3m5lQHU78Jt3lQ3BBpK6KgDMDGPUDN/GKDiJ+G+3xZXhV812Vav4
         Hg1NfhOfEFLwV+qMK/6W49aqfWGSDOyWDJbnSx1OdTpVt+EyZ/hgy6gkCxeAQ0Cz70/n
         umKFkmGWbSr4FB0X5YFNEphLI9QjEUs1DB5vCBRqkUG7Zxww8pQYf4IAaQy3sUkVe9Zg
         wAubpevJc4yzJvnGUSoWaa8JKfk7Bq/CKexRAw/wYk624x9PWGV0c73LXQfiD3cQjL+M
         Ua4w==
X-Gm-Message-State: AOJu0Yz1WY8OyowhEG1CcCofgIWmBQS1D8maYfy+o8lol9Q4bpcTyySO
	5NH0XO9MjrcXkXsd4uIS1AqemQ==
X-Google-Smtp-Source: AGHT+IF4HGIOwlVl6A9RQNOfSZeru7tUlvSwoamjXR53yd5MKn9emQp5rP5UWW0bVKQXLWNIQ4iySg==
X-Received: by 2002:a17:906:4ed0:b0:9fe:57b3:bc08 with SMTP id i16-20020a1709064ed000b009fe57b3bc08mr4521811ejv.41.1700582023871;
        Tue, 21 Nov 2023 07:53:43 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id dv8-20020a170906b80800b009fdc15b5304sm2896853ejb.102.2023.11.21.07.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:53:43 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [net-next v3 4/5] net: ethernet: renesas: rcar_gen4_ptp: Get clock increment from clock rate
Date: Tue, 21 Nov 2023 16:53:05 +0100
Message-ID: <20231121155306.515446-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
* Changes since v2
- No change.

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


