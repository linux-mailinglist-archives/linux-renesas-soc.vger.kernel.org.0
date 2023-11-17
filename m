Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220017EF672
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 17:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbjKQQpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 11:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234707AbjKQQo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 11:44:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9A8194
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:56 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32d895584f1so1543903f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700239495; x=1700844295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ctuwvPDSa9uZCOLTfAErk4+6RVQpToW66kimL2TEOU=;
        b=f37EjEfkE2wE5wUT9b42TZ3b4S5lw9tQqiI9n/Qdsq4nkhdUGrZ8+GZLO75m/prkvb
         2GOOFipeStAbRuqyTH3opTZZw4UXkuLhCYdDApddyeOofgYiA9k/p7S6b8caHxv2SH1N
         yXBff1U+AOcNsLF0K0bCHtUHBDe+3FJfxh9DjoB1LzZeQqRkuh8o3pu6lJEAcRGbBPgM
         pg48sJISzmAHtNO2orwmrb4MyHUREvv3fdtEQ/rjr5YzeH9c41rtzrUrocOB/VHif53H
         akOB79NDJaS2Wwg/xNLwte6xYBYcwsMayReT0G4ZxlU+wqA6rAw49t/9sJc42KafWlF6
         WDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239495; x=1700844295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ctuwvPDSa9uZCOLTfAErk4+6RVQpToW66kimL2TEOU=;
        b=qVQ3UwZZQa0FiKJTBT4csQGZuXgrTYK2DTD07EXT4tCIbBwRbIpj3T3lvkp/5xgIOt
         yLieAGzDRCiY/SAAXCoXKbawP7J2kzGd3PUGOCP5PWZpSiLip8EwOlLnumNw1b0kPWS0
         XSmPiJp2Mt2m6zClf3jEvJBQjZaMNa6aD0YxQnGEyegkc1C5hYCQ9vNsUHIJbjzdCbae
         NtTuYL/Fs/xJ1zsF+gQ2qQAddStMFF+k8WNhmlJzNbyHI//f3OEbATozEXq+wu031wlz
         L10+ljL2qFqyXKR2Tv3zDRdb2qomdmwagyzfAzLwvpXhAkybfDU6G+KtKb9VrVW+nRMk
         oSwg==
X-Gm-Message-State: AOJu0Yz1NuopHqBtoqTmA/e53Xc0dyDtwJa63moml3ImjRGmqkhEhacE
        I4EiDHrtL6T5aRZm18irbWQqEg==
X-Google-Smtp-Source: AGHT+IEki3Odc/z/NMe7thygFDWVaCnOECdby64FFzQDj/s/3i2E+SLxm5CPlx0cuO47pXuLEZtQgw==
X-Received: by 2002:a5d:548f:0:b0:32f:88e8:b8d1 with SMTP id h15-20020a5d548f000000b0032f88e8b8d1mr12969140wrv.13.1700239494955;
        Fri, 17 Nov 2023 08:44:54 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id y10-20020adfee0a000000b0032dcb08bf94sm2791947wrn.60.2023.11.17.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:44:54 -0800 (PST)
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
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 2/5] net: ethernet: renesas: rcar_gen4_ptp: Fail on unknown register layout
Date:   Fri, 17 Nov 2023 17:43:29 +0100
Message-ID: <20231117164332.354443-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
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

Instead of printing a warning and proceeding with an unknown register
layout return an error. The only call site is already prepared to
propagate the error.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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

