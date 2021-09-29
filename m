Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9ED41CE43
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 23:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346722AbhI2VhY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Sep 2021 17:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346347AbhI2VhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 17:37:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6D5C06161C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Sep 2021 14:35:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g41so16454052lfv.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Sep 2021 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EyTnMzYq/vCo9+ZlAi5FiLa7VQj9CHwqWbGroqQ1q+g=;
        b=p92tfDwcgAZ97KGfoC1Yt4fwYfXl7WZMfcSALcMasWs3c8GRxC6wenhVIFzdL9Wsq2
         NXFzv6kwgIou6n9BdeQrNdb7Vb5IJ6tsD//eu9ahYDhr8ZoSIgAYx9PfVHDWOaUshbfm
         DPd3pWGX5Emsn8QKCpFGY/fDKYRj+Zne9vEoPAK5pD/d0im1rHsEIn2zQahSyosaTv/h
         xEib4h13Q0fO1GaHVfLW9PFvtPC7yrZtbBgFSdcVihg8bC80WUKAwZsJOWTgUgOWXQnc
         c+hFNmVePqKEht1VIhoJD8WtTSaPAmw3DUVyNnYxdHre3ZIr5RJqcd+fE+e5j3BFShm1
         Y6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EyTnMzYq/vCo9+ZlAi5FiLa7VQj9CHwqWbGroqQ1q+g=;
        b=h7GrbDEYhrc3a9f8mfBKXFkS7RFurcQcFzvoJIjqGbuWvBfLaDMskS3GseiUx1wYmm
         PddQUDGQCDZ4NErk7OYSr9gZJJ8xLcx+UNNbIuIdHjyAdkG9zy8858FFd/AIilrDI7XD
         3iis0UYyVU6ZxQOL5+anqFn91PDaN+rppTyDPZwzBYSyanAoHz2nP+UCW0EJTUXFYZit
         pF4hsK6C1OIsDMWwCvXkEMaMvDoYlQ7OFhtgBmsijCaq2MFYFZ7v1VzEx3yHqM0xDM2A
         ThSY/Cjq3BGZYDFRR4Ty8MuxSDAbTwhRI5/to3zK1HTKxdKr7ohAijih+pbDTBteVHEI
         lg9w==
X-Gm-Message-State: AOAM530eZGZoTsDSydHrDr8btQnrYicM7sL7V7f4nxzOaGFbjs29sM0X
        Nss6PZid/GDBAa84aSzUUUCkSg==
X-Google-Smtp-Source: ABdhPJwkFWv34OpeQwSZYEXZsWF0YpaEoXfonGOz6oBsU4nBLcZpAQkDAYhGFtZSP9NZioVjB+JrpA==
X-Received: by 2002:a05:6512:3d0e:: with SMTP id d14mr1932784lfv.20.1632951340130;
        Wed, 29 Sep 2021 14:35:40 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id x11sm124016lfq.95.2021.09.29.14.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 14:35:39 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a779[56]x: add MLP clock
Date:   Thu, 30 Sep 2021 00:34:32 +0300
Message-Id: <20210929213431.5275-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>

Add clocks for MLP module on Renesas H3 and M3.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index c32d2c678046..d6b1d0148bfd 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -229,6 +229,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("lvds",			 727,	R8A7795_CLK_S0D4),
 	DEF_MOD("hdmi1",		 728,	R8A7795_CLK_HDMI),
 	DEF_MOD("hdmi0",		 729,	R8A7795_CLK_HDMI),
+	DEF_MOD("mlp",			 802,	R8A7795_CLK_S2D1),
 	DEF_MOD("vin7",			 804,	R8A7795_CLK_S0D2),
 	DEF_MOD("vin6",			 805,	R8A7795_CLK_S0D2),
 	DEF_MOD("vin5",			 806,	R8A7795_CLK_S0D2),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 41593c126faf..9c22977e42c2 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -207,6 +207,7 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 	DEF_MOD("du0",			 724,	R8A7796_CLK_S2D1),
 	DEF_MOD("lvds",			 727,	R8A7796_CLK_S2D1),
 	DEF_MOD("hdmi0",		 729,	R8A7796_CLK_HDMI),
+	DEF_MOD("mlp",			 802,	R8A7796_CLK_S2D1),
 	DEF_MOD("vin7",			 804,	R8A7796_CLK_S0D2),
 	DEF_MOD("vin6",			 805,	R8A7796_CLK_S0D2),
 	DEF_MOD("vin5",			 806,	R8A7796_CLK_S0D2),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index bc1be8bcbbe4..52c5da26b756 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -205,6 +205,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("lvds",			727,	R8A77965_CLK_S2D1),
 	DEF_MOD("hdmi0",		729,	R8A77965_CLK_HDMI),
 
+	DEF_MOD("mlp",			802,	R8A77965_CLK_S2D1),
 	DEF_MOD("vin7",			804,	R8A77965_CLK_S0D2),
 	DEF_MOD("vin6",			805,	R8A77965_CLK_S0D2),
 	DEF_MOD("vin5",			806,	R8A77965_CLK_S0D2),
-- 
2.30.2

