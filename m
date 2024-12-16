Return-Path: <linux-renesas-soc+bounces-11357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B08B79F2AD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 08:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8811889B51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 07:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19201D5AA1;
	Mon, 16 Dec 2024 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="YrMIBCaI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B681D54CF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734333621; cv=none; b=cdk2KV9s9jF9rxkn9uYiE3/aejy4tzzsENl+dBABhJ89DVSnw7g+luI85pcXO4+97BF9mWgJ/wsgkrtnIWfzR/9r6+jWIg1IOCo59E5OImSG6e7/hjiEHVRVi3TeYFA18J5iS/cyPfWLAm3M5dCfnjWQrJgZf8fQt7LSyUEkWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734333621; c=relaxed/simple;
	bh=/e66GSylh66fjrDoof3R9JK40ytReFSDT/2ZT0m0crc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D+ZYo/KvwJD8Eq7xET7+EV6SpnhNnZzF0ozbjCY4C3zQyXttHcKtWaxmdaRDX61ZedMsKwyZI6M++s8yrgp5SOgdTmuJOnZv7TWDbxBPKL+edIYx5bM5krvhtgxfRKdQRyYLintQ/zN3rVtvXkTgncCRJJqtxTHL9EG9azWBMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=YrMIBCaI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401e6efffcso4428114e87.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Dec 2024 23:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734333616; x=1734938416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy6PRdyvTJmt4nLi/KLtgN81vqndB8nEbZyDRKOmQYI=;
        b=YrMIBCaINhbLE1bcM91uB41cb03Sp6FHW8uD+BDZtli4MbkULihiELpZVEFTeabbXP
         zv9u8QwteplQwMwAuxwAHM8AAD/Ze4Kru0FZfnBW1O/J2wi6K2cRJ5hxxMQQtBqYH+mH
         6MG9TODuS4xAo3Z477z7q+E/vBDr8Te+puPHmAKCr7IeH7seadVufnjuQBZYVDLubzZw
         fYvQVYiLqC6NI5LcJFd0j4D1sREE3Njz8O96CeOIsA0l1R6nL18xBoMsYX56gLLMHZna
         0BMAOCs3R8OH6EhJO1W+DmeZ21XS/QRkf+VkVZtA/0OzMRBOI6+sZrau5thzt+BHovCx
         +/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734333616; x=1734938416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sy6PRdyvTJmt4nLi/KLtgN81vqndB8nEbZyDRKOmQYI=;
        b=uK6mhO4HCK2Vc7fB9T0fEFjEQfYg0aO0vnt01BLb2go6RuW3UqTLxmh6MEXlmOTw/S
         95OFM80wj0kCvYxGkN14RsoleVK2GU+YfWMU+Tp9r9DTc27HwuzNPUBj6SBP50RBr+Ei
         wWW8LhWFFBlnRRltFTXWmYiGKH9cK2Vi+Smz6dOIyh7jHe1EyxBTJlGzpk//es4dNLXL
         qWO038B7sTbJaBMzOcGKhq3wWG00M0DT63TgpN3r51NHEvDPnUfBHheS8m0DnXRMakZF
         KV4kj99XB4p+L1FYdnnKpp4TtLbzvxUnAFiYqk683xF97UXm0pUb18AkMw7z7+jNMZiG
         pGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs6JfjMHtAIm4hy0EBYjdTury8mWg4yaBGmC3mo008wWAt/iqg5KQ+ONrgZhN0zU3Lec3S7VHGq5pT0Bkq1/2ykQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGIP6HwZ3QZoTvXfT04hX+JtbHkru3IjuHbl8T7PfTI3JXWjls
	TZ3xj+DyK53E9vYkmoLa8krC+jfgeFO6+0S09JE+Djq4+bJjya6Gs2IxkqxumWU=
X-Gm-Gg: ASbGncssMyYbOXzIsfbaRJ5WDfw73SliaSRFEsP6fL+dFaHpcO8iQPB729QKOfi12NG
	hyBiME6dWk7N/Tg8TojWYG79m7XKlMbJaccHx7qScxYvX7+qiWo/Uw/k5MNhfdYILO3qKwTN5gG
	I3BowHBjkyNSSay/y2Y3aIbURPWPaIIx8LzvUcMfUmUEX7LXSq8sgbXPm3+I5nZSgUYqDvHZ2q0
	NFely7j3q+twLNbmNmoU3KGN6SnDanP/WzXiU6vY3QGHTuWHdx+XLRsUytqpXR7SLNjY6Q=
X-Google-Smtp-Source: AGHT+IH9reL5lhWoFaKGj2Yh05YQwmvxJkqzpPUY5yPuPlhytzfhLRIBepAdoB6afrfzAgPi3F0HPA==
X-Received: by 2002:a05:6512:3d27:b0:53e:1c3e:34 with SMTP id 2adb3069b0e04-540905974b1mr3654998e87.38.1734333616046;
        Sun, 15 Dec 2024 23:20:16 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9b2bsm748930e87.94.2024.12.15.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:20:15 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next v2 4/5] net: renesas: rswitch: use generic MPSM operation for mdio C45
Date: Mon, 16 Dec 2024 12:19:56 +0500
Message-Id: <20241216071957.2587354-5-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
References: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce rswitch_etha_mpsm_op() that accepts values for MPSM register
fields and executes the transaction.

This avoids some code duptication, and can be used both for C45 and C22.

Convert C45 read and write operations to use that.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 51 +++++++++++++++-----------
 drivers/net/ethernet/renesas/rswitch.h | 17 ++++++---
 2 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 6e3f162ae3b3..a3ba2a91c0ab 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1195,36 +1195,29 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 	return rswitch_etha_change_mode(etha, EAMC_OPC_OPERATION);
 }
 
-static int rswitch_etha_set_access(struct rswitch_etha *etha, bool read,
-				   int phyad, int devad, int regad, int data)
+static int rswitch_etha_mpsm_op(struct rswitch_etha *etha, bool read,
+				unsigned int mmf, unsigned int pda,
+				unsigned int pra, unsigned int pop,
+				unsigned int prd)
 {
-	int pop = read ? MDIO_READ_C45 : MDIO_WRITE_C45;
 	u32 val;
 	int ret;
 
-	if (devad == 0xffffffff)
-		return -ENODEV;
-
-	val = MPSM_PSME | MPSM_MFF_C45;
-	iowrite32((regad << 16) | (devad << 8) | (phyad << 3) | val, etha->addr + MPSM);
+	val = MPSM_PSME |
+	      FIELD_PREP(MPSM_MFF, mmf) |
+	      FIELD_PREP(MPSM_PDA, pda) |
+	      FIELD_PREP(MPSM_PRA, pra) |
+	      FIELD_PREP(MPSM_POP, pop) |
+	      FIELD_PREP(MPSM_PRD, prd);
+	iowrite32(val, etha->addr + MPSM);
 
 	ret = rswitch_reg_wait(etha->addr, MPSM, MPSM_PSME, 0);
 	if (ret)
 		return ret;
 
 	if (read) {
-		writel((pop << 13) | (devad << 8) | (phyad << 3) | val, etha->addr + MPSM);
-
-		ret = rswitch_reg_wait(etha->addr, MPSM, MPSM_PSME, 0);
-		if (ret)
-			return ret;
-
-		ret = (ioread32(etha->addr + MPSM) & MPSM_PRD_MASK) >> 16;
-	} else {
-		iowrite32((data << 16) | (pop << 13) | (devad << 8) | (phyad << 3) | val,
-			  etha->addr + MPSM);
-
-		ret = rswitch_reg_wait(etha->addr, MPSM, MPSM_PSME, 0);
+		val = ioread32(etha->addr + MPSM);
+		ret = FIELD_GET(MPSM_PRD, val);
 	}
 
 	return ret;
@@ -1234,16 +1227,30 @@ static int rswitch_etha_mii_read_c45(struct mii_bus *bus, int addr, int devad,
 				     int regad)
 {
 	struct rswitch_etha *etha = bus->priv;
+	int ret;
 
-	return rswitch_etha_set_access(etha, true, addr, devad, regad, 0);
+	ret = rswitch_etha_mpsm_op(etha, false, MPSM_MMF_C45, addr, devad,
+				   MPSM_POP_ADDRESS, regad);
+	if (ret)
+		return ret;
+
+	return rswitch_etha_mpsm_op(etha, true, MPSM_MMF_C45, addr, devad,
+				    MPSM_POP_READ_C45, 0);
 }
 
 static int rswitch_etha_mii_write_c45(struct mii_bus *bus, int addr, int devad,
 				      int regad, u16 val)
 {
 	struct rswitch_etha *etha = bus->priv;
+	int ret;
+
+	ret = rswitch_etha_mpsm_op(etha, false, MPSM_MMF_C45, addr, devad,
+				   MPSM_POP_ADDRESS, regad);
+	if (ret)
+		return ret;
 
-	return rswitch_etha_set_access(etha, false, addr, devad, regad, val);
+	return rswitch_etha_mpsm_op(etha, false, MPSM_MMF_C45, addr, devad,
+				    MPSM_POP_WRITE, val);
 }
 
 /* Call of_node_put(port) after done */
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 2cb66f3f4716..35ee73766396 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -735,13 +735,18 @@ enum rswitch_etha_mode {
 #define MPIC_PSMCS		GENMASK(22, 16)
 #define MPIC_PSMHT		GENMASK(26, 24)
 
-#define MDIO_READ_C45		0x03
-#define MDIO_WRITE_C45		0x01
-
 #define MPSM_PSME		BIT(0)
-#define MPSM_MFF_C45		BIT(2)
-#define MPSM_PRD_SHIFT		16
-#define MPSM_PRD_MASK		GENMASK(31, MPSM_PRD_SHIFT)
+#define MPSM_MFF		BIT(2)
+#define MPSM_MMF_C22		0
+#define MPSM_MMF_C45		1
+#define MPSM_PDA		GENMASK(7, 3)
+#define MPSM_PRA		GENMASK(12, 8)
+#define MPSM_POP		GENMASK(14, 13)
+#define MPSM_POP_ADDRESS	0
+#define MPSM_POP_WRITE		1
+#define MPSM_POP_READ_C22	2
+#define MPSM_POP_READ_C45	3
+#define MPSM_PRD		GENMASK(31, 16)
 
 #define MLVC_PLV		BIT(16)
 
-- 
2.39.5


