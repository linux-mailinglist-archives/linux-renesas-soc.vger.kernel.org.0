Return-Path: <linux-renesas-soc+bounces-19364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8310AFC026
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 03:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028063BCAC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 01:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C0A217719;
	Tue,  8 Jul 2025 01:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOBHc9oN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6E201269;
	Tue,  8 Jul 2025 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938912; cv=none; b=E2fltKVfs2yXcGwpP5so4mahRTAkqFI2I1UHP7GKN2jfdGJ4d4oiUnqk7ZbPXdds43uux3p27O119+MVwJburub/rMaewszchhRBGonvYQwJja9HHfNG1nt6mnRm1UrmXeEoc8R92RDWchJCr62hQV0IF1wYMXwlxL7LCqn40+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938912; c=relaxed/simple;
	bh=7Jp+7aoQlwHzBSLcGDasAf4OQ1Ko0V2RppLdpuU/eto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aR/pwI76TBBfzYC8SC8ey+VuIF5wAZGYit8fSMF594zq+JTpTzwZa9MKQR8vFkLT4IZsrVx9DXP2jW95ciSWl46JEV7GRAZLDTgnTKpBCADvz0q9SXn9ApGEgcVg4nwmJ7mbxZZ8b6bwF4Xxwm/FPUd4RU+DOq1mAQqf7wVHcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOBHc9oN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23dc5bcf49eso21923825ad.2;
        Mon, 07 Jul 2025 18:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938910; x=1752543710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxrAKwHku8E+qt+4+5rp0WxwZwqsAY76OjW42aieBp4=;
        b=kOBHc9oNU1MJtSsxX9g6bN3QyCcRwVfa6h30mB5iKS7jHOMUgqLbVNQNL0+EcS1Npo
         D7wUcDYCM3sW53bZairsctnmgc5alHv/ufPsKb5rcxm48M4D1Q+1yk8aNkX1WAaif6/Z
         FNPuIAESuB4b85rA97sdHc/JQdw7m9QWc6+0o5Wxdy4tWWFEn1VGqWxSuBamqvXLTioq
         Gc8vN3JwFfQuYGC0jbIVgCOtvMhRm4OfHWjdExDdeKakQL/JTInqEtv13Ian1ziI/t9G
         k9f+Ctl/oxWEz+MRK+eobFdnjVoedHXGOAzfNnG5Kwx5yetCtuuYV2YLXhn65e5qCeJm
         y2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938910; x=1752543710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxrAKwHku8E+qt+4+5rp0WxwZwqsAY76OjW42aieBp4=;
        b=wgERvyu62gBlcEi0WEcc/vDHQyp1wn/4IQ/HuLBUGeg+G+xKorcvavsZrfMb+OuBau
         jTBGb25A2XnwdxeqSMK+RxPy2/PZPAj8YpJczfgLFf6msIZIJcuR29V4EjnPBIZPeho/
         s/rqwX6ehtoBZV6shBaDhzp9zmZRdgNQ3mCFj024n7rL3JAFmfJ2a+WFf3NrLkWUWKw0
         +FupULAqFu5pgyLPAx6gEXmaMFxK+OG8E0ii5/CMYZjxTe30X5R2GMgxCMB05OwOoGid
         32++IwZUVcWkmB+ivRc+5DIO6o+z2q9sgoqxVlG3IdcuYFWNNH7KBOVnuazk1Fnqt4hu
         xGiw==
X-Forwarded-Encrypted: i=1; AJvYcCVOVn53YtXYuDQTjK6ANozsCKaCbN/bh5nxi0bnt+ztPnXdWASU8G2Y7/3lEtdsdE+1+o7TB6f6zjnSeyHd7+FcgYw=@vger.kernel.org, AJvYcCVok4+7ntc59CGu30xAy6u9vUF8xitZMoFWtc/bCvcWqdtNnIRHdJPxjjjkvfcPkj82lNevIlWBtrcTpGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlSqe3z8Q7hWb6DR8sW8F5nAgBvg6amNXYw33jXsgOWbg0hn4
	c3uGHAiDaPIBj/hmwxRzve/d+H96J6OCmv0w3iVMlZZjum0U5kjOIWwIoTqZtv3RWdM=
X-Gm-Gg: ASbGncvayEkqodzVy9KxHtM4tNlFuyt1QWE/YjTqIyCE3g1+W0bFz02ZeOm01rGzA5r
	EX2tLzOwEUqfU0A9se/Lkxceu2r22wgRQ5jvJQzCo/PMuKmKyY5fK9158aEb0I1K73pStDul/Ra
	IZll83VfPstSaFEpZwA9p2z3zaA4ZgZmw0LNxB1Myt9svUqrkn2fEYgRSFS/aIRtUXdwep/ts+B
	Upu/3F5lEPHEo9fd1lCi9TuxhqJliFXLcrY6ExAeFhlORS63GwB0qaWp12yCPcRLt4k4+6UvSK5
	GUhhsfBJzy8+qHoHBhuh1jEJue/K5Zprvj1pFIpDffc=
X-Google-Smtp-Source: AGHT+IFzCMG4qYuwexIp6acrX8zDo2lSSPmgVfFJ4+vLa+eDUo4Iueq7SOdECyPmZVJEvXCkUQXJOA==
X-Received: by 2002:a17:902:f642:b0:234:a139:1208 with SMTP id d9443c01a7336-23dd1cbdb3emr10929395ad.16.1751938909837;
        Mon, 07 Jul 2025 18:41:49 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm95773395ad.199.2025.07.07.18.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 18:41:49 -0700 (PDT)
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
Subject: [PATCHv2 2/2] net: dsa: rzn1_a5psw: use devm to enable clocks
Date: Mon,  7 Jul 2025 18:41:44 -0700
Message-ID: <20250708014144.2514-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708014144.2514-1-rosenp@gmail.com>
References: <20250708014144.2514-1-rosenp@gmail.com>
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


