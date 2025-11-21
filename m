Return-Path: <linux-renesas-soc+bounces-24935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1CC78D8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B16F365788
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C554F34CFB2;
	Fri, 21 Nov 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS1Avchq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B034CFC1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724974; cv=none; b=iZ2CqX3L+8UvZGvovIhscpWasDQMd0lM/bBX4RYWmITrDWwkLuWMexErIpte4qie9Uyzk6UV4rO+dihmIbRyIKf0SrbbqtB0W9UYW4PdJ4lDajV9CqIVZGffPcGKq7hKqs/aZ+pfcpD35K7sclgJzjDg36te5N8lk+XIJNsLY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724974; c=relaxed/simple;
	bh=xi4sh3FWtiB0LYCCMtopckE7TQGE1bfmOXtNGBBIM70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoJz1ljfmcKWVi92F8N65vlxKGniH/VwvSSLXgDL6afQwbuSGdpVjkljtN9CQE4usZwY6rpyaz18On5NssWRZuc21QqBfNY5m9PA1bs3LY8kwR+dTchZds8KMcT4QntPrFvCNEKc0uJBO3GW+u8HKHv7Yl044jRBrcy8D360qNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VS1Avchq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso16289085e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724970; x=1764329770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9sEYxfIc+hTJanUfmeG/Zn1IoRVtGcDqfv+PR900MI=;
        b=VS1AvchqQM6J69U0zX5vkoTP13ntQUlAasyJxogHtph7oIuVka4FkL8UyHa9RljRVZ
         fG8Ex0BOHTRBamWv9NJSaHqaYETEArxH1Gpu5IofTZbe8pSJF3/P1zhsFMRAkreAM5ut
         RB3Yu02HQR0qwqkS7faVf+yneoJDXV9dnPzOBQ9HbAmTrGYmmR47HCsU2f8Bo6o17b3m
         bJl0L4MwlOgo+PCRh5K4SMJ5BDCTOprlz6JBQuBRkj4tuntCPmHXReaC6MZ4h4hhss8x
         ls7fS3Pp9UQpCjG/BBt3ivIL1XqtvNMw3OdWMg31f1xfnWrMuB4QpwjvzWcNf9aYNTpY
         Ny6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724970; x=1764329770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N9sEYxfIc+hTJanUfmeG/Zn1IoRVtGcDqfv+PR900MI=;
        b=L0GOYtxC2NbTzl/BSFvCHSQax2khd9jPETK7ETjscS9DGMi13pTcj/iVHUm/MOmL38
         tudOgJ/s06Otve7FPiC22uaOg1HH8qoJz/CYKublU2tOig83iMaV+/QKFvUGEakMVb8E
         O4KvJ9x9fsRk9VYItEy94RgVcyUOdpFgfxSN02qAdSe71kT9ZR9TgyQ6+ntFCh/2Tt+/
         TqOau0d4qFrvaz+VtxtfY0NuARsAZPAMueZbvompNv4CQBK0+PQpCp9gdFeSB+u6uD3o
         VAFRyu0SIL83Dtxd+csp6mWdcLJciVeYekRCRhb2hC71m1VneuutbkOS+h5s95nCODfT
         5ilg==
X-Gm-Message-State: AOJu0YwwBbWQPnW3OipVkyt+6HdweILEiJXg717R4Dz3NDATZo4rPjm8
	Eyx+prMG2dbmp3oqeFVdpv+s5XLGX5ciTr0lXCLLZ885IBjKG+8kMvlL
X-Gm-Gg: ASbGnct4wTBO8eAp0R8mggZ3cxtVGWtRuzMn+xkmNsSF8iIuC0OWOGPlT+dyBicv04l
	atntURuqdpd5m1cQnNfh7TzaykAEe6sFX3egbv9+99AyMbDeBGRvorUupzJ8i/lgsfDA+pmVIZy
	Nq30PUqvy0vs0cWLx+PpS0snKCk5Y96LjySCJTRzzMbFsmVCMUrTdtZ/FMqAlHKW/5Mqne31pfu
	z1dRkDWCb73bZTJoOutHmIYzmx40Fa6lFhfmBTpkhzLa0lmP5fSsQGL4StQIZGuWHi/U/xjXxpK
	W4CFCECD60BPRECzFL3mJMUC8c9t9/4/QTnHj3/SQ7dxWZ3VBX63V5UdLuJbV8/+Ac742NkisGH
	/YNKFaxVDSEFGLNlfX5JuxIvjN/cf7CYrvNGU8hHNNQ5c6e4hBtBlOpv/g8sf4b+8V4AOdfQIy1
	uzBGbhlog0WqSEHOMe46szGCqtncgCPRtJ+TU=
X-Google-Smtp-Source: AGHT+IG8sodXE9jGGGGmRK8fUP5qopeWa6ybgnzrniJ/tIyx/pp8y+wH2VWEpAL/y76pv8RXGMAlww==
X-Received: by 2002:a05:600c:1e89:b0:477:a1bb:c58e with SMTP id 5b1f17b1804b1-477c04cfddcmr23130495e9.7.1763724970251;
        Fri, 21 Nov 2025 03:36:10 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:09 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 06/11] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Fri, 21 Nov 2025 11:35:32 +0000
Message-ID: <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 7 +++++++
 drivers/net/dsa/rzn1_a5psw.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7b84585a5415..99098bc06efe 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1243,6 +1243,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	a5psw->ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(a5psw->ts)) {
+		dev_err(dev, "failed get ts clock\n");
+		ret = PTR_ERR(a5psw->ts);
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..81be30d6c55f 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -236,6 +236,7 @@ union lk_data {
  * @base: Base address of the switch
  * @hclk: hclk_switch clock
  * @clk: clk_switch clock
+ * @ts: Timestamp clock
  * @dev: Device associated to the switch
  * @mii_bus: MDIO bus struct
  * @mdio_freq: MDIO bus frequency requested
@@ -251,6 +252,7 @@ struct a5psw {
 	void __iomem *base;
 	struct clk *hclk;
 	struct clk *clk;
+	struct clk *ts;
 	struct device *dev;
 	struct mii_bus	*mii_bus;
 	struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
-- 
2.52.0


