Return-Path: <linux-renesas-soc+bounces-19290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 364DEAFA8A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 02:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805F7166321
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 00:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D608B1A0BFA;
	Mon,  7 Jul 2025 00:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By0lvB/I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54813192B7D;
	Mon,  7 Jul 2025 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848767; cv=none; b=cgdBliC07pKaCWoQ3Ai6lTPbHdGeDNDKkI2bLP1b4qxP6tmxXuQUU90wRuPMEQy9aPwdA9CjOIp4UKGCz5rlC9lFGHrZorH9IYNcDDV72bmLJ6vfa1XMUDLJO/xGdpkkWIMp5qJ/QcdGznUKfrndz7jaeRBKl4T9LmxBao0cQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848767; c=relaxed/simple;
	bh=7Jp+7aoQlwHzBSLcGDasAf4OQ1Ko0V2RppLdpuU/eto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrowSbXtrPwZYfDsalQefBRa6tBytbMPzu1i9/33h4RExFuHpealsBu4uHJGafWtUZRcW3BHk8teixglRuydfzmcgwG8+xBIER3jSVZHL1U3GDbgfboLuS3GRtafBoOv/gp2ZpVmHxk9GbBxfmE1fefbkDdYViXu7VOo0oGOJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By0lvB/I; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2350fc2591dso22691335ad.1;
        Sun, 06 Jul 2025 17:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848765; x=1752453565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxrAKwHku8E+qt+4+5rp0WxwZwqsAY76OjW42aieBp4=;
        b=By0lvB/IcWm1qqOfm12cnX4WC938AA6D4iehPGZJCVFXteRqFtPkSJlmvk2CzEf1o1
         FVOl1BoSCAshhxOBhSkSM0yyw5tnTet10THYTw0Te2YfsDqbWlYqy6913TCOQpBU2zsO
         RjNmp12Au7orMyWc0SIZpFe8Y9u/y2VHZIdobCXlRq7TNBtj6saia1eOYDvEDQt0C4iF
         7MMuOannN5Ht/nuWNXchaJM5R80E0NHW/9+jXYTnraHe3BtG7jFWgDMig03o5Ph3/e55
         /f3P/BYFJqm1Zq10eLATUp3UqEkbZHhYZBoaEJzi1LG/QKYwlxqFgbLGLhuPuSWhfuQ+
         E5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848765; x=1752453565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxrAKwHku8E+qt+4+5rp0WxwZwqsAY76OjW42aieBp4=;
        b=sY7ZNNleLVKtEskYOT1S2Yt3Ou5qIDuFvue2e3JSiGgkDhyMC4Pe5ec++5tCdWndij
         yH1pyeuVOBNeIlgh9CRD5AvDTZOjNAt5oN1F5sctXhhti9jPePDW6FTviAMFHFo14GuA
         LBK9EeiWFhj+DFO1zoafBfmDrQeIkoHxHguSwW7Ux4DSuubQXJg3NcmIKSC3+FvVJo5t
         uOGHO281DyUVoEDWgIpi+cI7cOLAYrOQXxhYq9sFcJVh/XO3hBLKgFwqBPmzJ/x4Rd6f
         vh4IEH9rz//MbmOAtTm5yPQnv0xGAJWc7I3SCdoRAxjgGXrhX9rL/SxQpDDdyAvp2ILO
         NoRw==
X-Forwarded-Encrypted: i=1; AJvYcCUWrW3AEu2DsQPzvSelnUcC5kyy9zjnIRGM8RfRjNrVOy4qc9tP5t/38One3a5VWcI1zcBl+zgEMkIBwO8=@vger.kernel.org, AJvYcCVh2uskXGv8PPiySwILF1pO/cvT4o/oy3rCBO0vmMGZf5gCdrdoMiBLgZGNwfj22Upd8cVz7ioRy16+LsO4kCFL4O4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRgR+MkqBjcDnhUnKFL8Kcie0Gbqof1I35gyYIpF1/bJKuqmws
	i5bjIm8PKz0Xdlug8e2+sLSp4cQgyytdgTB4HLR1hL5NHTL/ftLcJ9tsHJSh0hkRtQA=
X-Gm-Gg: ASbGncvivZnRNteOBccXBg26MwF8sQLII1fFlAOoS9toXeie4cLH7TF/YRfoOgw3N7k
	LvDmW3r3rc3dsVTB2lWrIkDOaBHziEJf62qE/GamW9/6RLVsAZ4ZV/VkA+BpXpcnE2CJyKeoZDi
	n5BCv7tmwxUePYLS9l7gQjGno4IXRONO8e2MnU5MOhdJAKN7vx93d8swK4HQI4+lRffzQDUEypv
	EY447WxWBUohqK/CqzIqdnzVxIxdLiTDPkFzwClTk6u4245IqEgza7BZhWVLNhmla5wRzbF+Dvu
	nUdsFLBkVIZAHlGJ57cAZE4I1MtBRTH1A2gDplyHMK8=
X-Google-Smtp-Source: AGHT+IGty8Ntkt/MFR9OqCcqTDhoe8U+WLujB92TeHcy0aCVB9CmM2uhsEPhx5niuUJv9fVmm3G+eQ==
X-Received: by 2002:a17:903:2a85:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-23c85886944mr177284005ad.1.1751848765357;
        Sun, 06 Jul 2025 17:39:25 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e2a4sm70308085ad.19.2025.07.06.17.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:39:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCH 2/2] net: dsa: rzn1_a5psw: use devm to enable clocks
Date: Sun,  6 Jul 2025 17:39:18 -0700
Message-ID: <20250707003918.21607-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250707003918.21607-1-rosenp@gmail.com>
References: <20250707003918.21607-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function has these in the wrong order. The switch should be
unregistered last. Simpler to use devm so that the right thing is done.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index df7466d4fe8f..1635255f58e4 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1227,35 +1227,27 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	a5psw->hclk = devm_clk_get(dev, "hclk");
+	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
 		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
 		goto free_pcs;
 	}
 
-	a5psw->clk = devm_clk_get(dev, "clk");
+	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
 		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
 		goto free_pcs;
 	}
 
-	ret = clk_prepare_enable(a5psw->clk);
-	if (ret)
-		goto free_pcs;
-
-	ret = clk_prepare_enable(a5psw->hclk);
-	if (ret)
-		goto clk_disable;
-
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
 		of_node_put(mdio);
 		if (ret) {
 			dev_err(dev, "Failed to register MDIO: %d\n", ret);
-			goto hclk_disable;
+			goto free_pcs;
 		}
 	}
 
@@ -1269,15 +1261,11 @@ static int a5psw_probe(struct platform_device *pdev)
 	ret = dsa_register_switch(ds);
 	if (ret) {
 		dev_err(dev, "Failed to register DSA switch: %d\n", ret);
-		goto hclk_disable;
+		goto free_pcs;
 	}
 
 	return 0;
 
-hclk_disable:
-	clk_disable_unprepare(a5psw->hclk);
-clk_disable:
-	clk_disable_unprepare(a5psw->clk);
 free_pcs:
 	a5psw_pcs_free(a5psw);
 
@@ -1293,8 +1281,6 @@ static void a5psw_remove(struct platform_device *pdev)
 
 	dsa_unregister_switch(&a5psw->ds);
 	a5psw_pcs_free(a5psw);
-	clk_disable_unprepare(a5psw->hclk);
-	clk_disable_unprepare(a5psw->clk);
 }
 
 static void a5psw_shutdown(struct platform_device *pdev)
-- 
2.50.0


