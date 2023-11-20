Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5D27F1813
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 17:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbjKTQDg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 11:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjKTQDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 11:03:36 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95556E7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:32 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4083f613272so20473685e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700496211; x=1701101011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBeiRtTR30Aw803NjtzRAQiI+Q09Cy8Ok3O7jfIgDgA=;
        b=MNsrX7oz/Ad9YS7d1955q6K17E6AxoKo7txpHcWSHap9xCb8pkffN/n0AF4MFzZfPH
         T2DYclbCd/DSieRuZWUCfI0sWlMhyFy4JQsgwNufOvaUAtGEq4CMs94rzL310sVUrBo1
         dp/JnrN5Y0QVk/3DqYnkw36YydiuBwgI1PL6imT4B+OcBST26LXflgBq4kHXnNBsDNB8
         tSuaLW/iYRbGJXwofkKyng8b2l1v6c2dKG2oGCy5G8zFrNG20np33ao1oI7hare1PvY3
         TsMKZytasIrwJaW2Vn4oFhESQmfmdwTdIuLSrFLsl+7AU4ixEdyywW+ipZ6FksuG05JQ
         YFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496211; x=1701101011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBeiRtTR30Aw803NjtzRAQiI+Q09Cy8Ok3O7jfIgDgA=;
        b=eTJEbXqAquVbNyvrb4KaDaH+iBrjfjBc/SZA3DLihs49j1u4u+ryRvuyNkROX1y64o
         5PGRZPMPaQG3PF4ZpGPOXqyQxa4QNvzZ+oYG3BYH+UY7+wsIMzObfTcXW0EjbCT6gXg+
         JdIkvuUr/63mPNnHUpS9QHIU67bIDwAOYAMebiIMMgYrwEbieVyXG80fLUeQkg7pIrev
         +tqRdonSmnwQhhMdgNQYFUU/rihrkyUcHruP54JBPSp2EKXcAYjeUPBbr7QR8z7f9vTL
         ITHlzLl4Xbt5e3LFoQpLTz6l2DY3TGHz2f5wFqCKKtbyRe2e1+wbK3hQa9Mo+n4zEgdX
         k14Q==
X-Gm-Message-State: AOJu0Yw7hRZYZU0PE+qji48pLCdCgpoNrR8o2jM9VJt6ClN1a50tOeIu
        BhvTwtenCDOxUGrMUOVh9D6jAQ==
X-Google-Smtp-Source: AGHT+IEhdRXHJH9C1lGvVT5c9+d+yG+EGNpVGHT6+dHmHovhw1nYFnMGUmTSojTe4I/1sUNCgjfrTw==
X-Received: by 2002:a05:600c:1c83:b0:40a:4a5c:3af0 with SMTP id k3-20020a05600c1c8300b0040a4a5c3af0mr6672691wms.24.1700496211100;
        Mon, 20 Nov 2023 08:03:31 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id m21-20020a7bce15000000b004080f0376a0sm13564631wmc.42.2023.11.20.08.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:03:29 -0800 (PST)
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
Subject: [net-next v2 3/5] net: ethernet: renesas: rcar_gen4_ptp: Prepare for shared register layout
Date:   Mon, 20 Nov 2023 17:01:16 +0100
Message-ID: <20231120160118.3524309-4-niklas.soderlund+renesas@ragnatech.se>
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

All known R-Car Gen4 SoC share the same register layout, rename the
R-Car S4 specific identifiers so they can be shared with the upcoming
R-Car V4H support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
* Changes since v1
- Fix spelling in commit message.
- Added review tag from Wolfram.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 6 +++---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 4 ++--
 drivers/net/ethernet/renesas/rswitch.c       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 443ca5a18703..59f6351e9ae9 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -14,7 +14,7 @@
 #include "rcar_gen4_ptp.h"
 #define ptp_to_priv(ptp)	container_of(ptp, struct rcar_gen4_ptp_private, info)
 
-static const struct rcar_gen4_ptp_reg_offset s4_offs = {
+static const struct rcar_gen4_ptp_reg_offset gen4_offs = {
 	.enable = PTPTMEC,
 	.disable = PTPTMDC,
 	.increment = PTPTIVC0,
@@ -133,10 +133,10 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
 				  enum rcar_gen4_ptp_reg_layout layout)
 {
-	if (layout != RCAR_GEN4_PTP_REG_LAYOUT_S4)
+	if (layout != RCAR_GEN4_PTP_REG_LAYOUT)
 		return -EINVAL;
 
-	ptp_priv->offs = &s4_offs;
+	ptp_priv->offs = &gen4_offs;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 9f148110df66..35664d1dc472 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -14,7 +14,7 @@
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
 enum rcar_gen4_ptp_reg_layout {
-	RCAR_GEN4_PTP_REG_LAYOUT_S4
+	RCAR_GEN4_PTP_REG_LAYOUT
 };
 
 /* driver's definitions */
@@ -27,7 +27,7 @@ enum rcar_gen4_ptp_reg_layout {
 
 #define PTPRO				0
 
-enum rcar_gen4_ptp_reg_s4 {
+enum rcar_gen4_ptp_reg {
 	PTPTMEC		= PTPRO + 0x0010,
 	PTPTMDC		= PTPRO + 0x0014,
 	PTPTIVC0	= PTPRO + 0x0020,
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 43a7795d6591..e1e29a2caf22 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1828,7 +1828,7 @@ static int rswitch_init(struct rswitch_private *priv)
 
 	rswitch_fwd_init(priv);
 
-	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT_S4,
+	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
 				     RCAR_GEN4_PTP_CLOCK_S4);
 	if (err < 0)
 		goto err_ptp_register;
-- 
2.42.1

