Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E577F1812
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 17:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbjKTQDf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 11:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbjKTQDe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 11:03:34 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA20E7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:30 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c875207626so26308951fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700496209; x=1701101009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAl6nd1nCzN04zqiBnYIqrG9SwaJGuvdGPy3QreQOpU=;
        b=fl30HzBajmU6iBX/sNZgfLeGSGBViaEUu7KUbSEmOLODZoM292E8eatYCZL4Ub09f0
         +Rbtw3vzg09boNsmENP2mkMdjli6fBFsbu/z11YFdCmX4IhKH8gQ22RC7bYk4RHDXdil
         iMWLjKZAkbnkPcB6fkg+VJycPPckYppNLUCegngV/e4oU0BW/xGV2h3HFhsXpsOvb4I1
         wJZ1/h90NdpWp0f3jYMJkYOXEfkP53WOd/DWzRNlC/L9naLcz1WB8VeU30TE16XH8mQm
         grjbM+IQTTI++AB8WvazShgNYHFnF2KXihqA6COnzIF3LWgtUvkFU/R563TyfWMVJS2Z
         q/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496209; x=1701101009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAl6nd1nCzN04zqiBnYIqrG9SwaJGuvdGPy3QreQOpU=;
        b=mn6FnZd54fofeHHYhDQP7UkUAGLnTk9/clLQuHmk4YD3YwXYmKH2/MkkU4V/r4TdpG
         v3wAl4Hy1yYLz+IZI2SdwkVartKk1+fLGKY478wuomrhEAitRJRYJTmZpspfUgiO8Eqk
         6Yi4/5PIzomh7/7tAQtib+vDk3MuThurrgcVwShuGfxJwAXO+i3dRt2jSHWS063xoZAF
         80Yvv+s5euP3bqcZoeCl0T+S3Wqd7VIfxuLy40TpXG+2qctfK5UR7jr0aBDsJboenkwJ
         rr+Zd5MtcdryJlamDZ7GoTDduCih9/LBuXj3rr1snuk59gz0zrCdVNn8TtKYldbfmnja
         WriQ==
X-Gm-Message-State: AOJu0YypbdCEwDxPxUU9DwhfH8yRUc9vqJo/GxH5c6SvWVqsMuwiQYUY
        nChfsmhAXU1FYNGZW+ByYomIlA==
X-Google-Smtp-Source: AGHT+IH9y3TjxSbJc9gvoYuUHR2atdzxyQzCyOsaNpkl35ZWJdmfWceSEAGzPZVSde7QgIkoFiUFzg==
X-Received: by 2002:a2e:709:0:b0:2c5:6c7:9e73 with SMTP id 9-20020a2e0709000000b002c506c79e73mr5317559ljh.48.1700496208747;
        Mon, 20 Nov 2023 08:03:28 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id m21-20020a7bce15000000b004080f0376a0sm13564631wmc.42.2023.11.20.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:03:27 -0800 (PST)
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
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [net-next v2 2/5] net: ethernet: renesas: rcar_gen4_ptp: Fail on unknown register layout
Date:   Mon, 20 Nov 2023 17:01:15 +0100
Message-ID: <20231120160118.3524309-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of printing a warning and proceeding with an unknown register
layout return an error. The only call site is already prepared to
propagate the error.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
* Changes since v1
- Added review tag from Wolfram.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index c007e33c47e1..443ca5a18703 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -130,23 +130,30 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 	.enable = rcar_gen4_ptp_enable,
 };
 
-static void rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
-				   enum rcar_gen4_ptp_reg_layout layout)
+static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
+				  enum rcar_gen4_ptp_reg_layout layout)
 {
-	WARN_ON(layout != RCAR_GEN4_PTP_REG_LAYOUT_S4);
+	if (layout != RCAR_GEN4_PTP_REG_LAYOUT_S4)
+		return -EINVAL;
 
 	ptp_priv->offs = &s4_offs;
+
+	return 0;
 }
 
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
 			   enum rcar_gen4_ptp_reg_layout layout, u32 clock)
 {
+	int ret;
+
 	if (ptp_priv->initialized)
 		return 0;
 
 	spin_lock_init(&ptp_priv->lock);
 
-	rcar_gen4_ptp_set_offs(ptp_priv, layout);
+	ret = rcar_gen4_ptp_set_offs(ptp_priv, layout);
+	if (ret)
+		return ret;
 
 	ptp_priv->default_addend = clock;
 	iowrite32(ptp_priv->default_addend, ptp_priv->addr + ptp_priv->offs->increment);
-- 
2.42.1

