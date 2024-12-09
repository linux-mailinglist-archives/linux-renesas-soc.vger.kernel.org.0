Return-Path: <linux-renesas-soc+bounces-11077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F013B9E8B74
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 07:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E21A6162968
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 06:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B458C2147EC;
	Mon,  9 Dec 2024 06:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="pllIjA8e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650A17C219
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733725461; cv=none; b=PxCuLJro5wB4SiXoKqsw7iyeMduRt1R9ZUjJwchDEYHy9rGlMrqHBRwxHc//WACqEOFkepzpwmmuKOGdJzKlN5p7abq4jYjGmXEcKV2xO673I8jTguR8WflUr3K0HTEoeBPcSu3qhvrF+Tw9BbDlP2TD7mLjBVobOxnxGsSkWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733725461; c=relaxed/simple;
	bh=y8uxG4UVlvQ6MOwHDDjDZWxvSoPwtcTzzcR+2XH5WBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AB/ghuVnBdJS05dzYHS3QxYVFR8EBqu8/3rrTyPPvm5O7UsmL0xs4xjVySpv0XxT5yCTGvM1tPjuEMnMvuKvf1GA6jSyjJZ85M8PGackptFtMjWXVKiKw7d4qV3jQiRoqKIwkfu72qscTZzA+BnM6N8KYbTMGvsaiJfzrbD4HVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=pllIjA8e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df80eeeedso3944501e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 22:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733725457; x=1734330257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXgxOhIN1P2YzqyXkYETOaU5zGDrTGv4TGdsOv2Axy4=;
        b=pllIjA8ezMJpwF+i/acw0VwyviIiQhCiL0Np9pDetxckQSyPgw/2Uu6J/TwtDN3ssu
         9eZAOQ3aGpdknovRyk/zNL8M5Y3TZPweGqBhJQM6iQTmxSh+WA/4/wm4Zp46g52aMj71
         pT37RaLs/4INqYqz2OV8Sg8yR6e15+UzT2n+FYocv0+zoKz0QQIU2K9+CexnK3byOs1H
         vtec9RwnbfjMZqUP/Q8YbdePaHIGFvxDCprHoKS+MJuMZ9yQcFTlXulsjtFsi62f07X8
         UwOWlB4F7Hsc8Psc9Gp2uZz35zHK3dinFpJahsxpGfk670wQJTKAZdqFc6PlZPKkqLFO
         1CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733725457; x=1734330257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXgxOhIN1P2YzqyXkYETOaU5zGDrTGv4TGdsOv2Axy4=;
        b=W+DkIrLYjTLsNn7vg3Onx06457LdBB3Z+Dhp9b6ilwdZsoepaTr+EePz37D/XDprmK
         KHq7hNjErBsK4OCLLay0YMydGX5VznccQ4jpSaSoCAbYV11VmG+qZLsN2C5xeE2hR6pq
         oJ0Q0nVkDujfdlbegJES6t4/go29CILz/awNmP2O5KLglpcN0ftOk26uI17xlMx8MBa0
         w78IKBaxx8do2KvEe25V9yov8UP1s2D7MTQJUVgubdgvMVVizPVm9JJvB/0ftLGWLx5F
         IfUoAg8aT2rMhid2CfhQBThQfwxPzM6MkVYnb6/exbL+dEiwhbh/1wHwtJ2GAb92nfBA
         I2ug==
X-Forwarded-Encrypted: i=1; AJvYcCWwxeHGoVYm+cBEMWyMUawXcWMYRlBkjAOAEnCc6lgIU8p+WVH8yGDnqZLkObUbqJo+UbhuDd8EX7vyrxxYlnNvnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcsPvFmQ8z/vK6SRv+LpXv511vtxrkybzDgOF12mhKvUqvpMN2
	W3t4jfwzKEu/s9xsOD705hj9ZJ1saDFHyZWAfa3DA1NWP7EZsIgiwH3dwHykT18=
X-Gm-Gg: ASbGncuSEiIAK4T0Bpes2zfuMK2yNFBne6Q5YyokT89ctugKnyOQJrN9dWO2xIMRdHW
	31GAmmqrnS8W0VXohVACmxL4oU3mwnm0VpxwRmZML6s60eoTxKcQuRQZitxm0FdONJoDHCT0oUg
	pmAycUmpCzVznkebGU6oSGjj/p3EXLXI2jF5Vw80tpcZ0Eao/iIeKebr8v9BxovGAcynItkLpef
	/UBOQzQLsv/RvjZHgS4cjoOu2UyUs+EWrrPVQ3vs0kbGemZmU6mrR9T/R9Fdl3B
X-Google-Smtp-Source: AGHT+IEALfVc1u7psoDNK67ZwOYQ6wOWqwlhYDnwT3/A55bQFTpZj8ctYGcl3Bs0PHReD0B3xOXm9w==
X-Received: by 2002:a05:6512:b94:b0:540:1f67:689a with SMTP id 2adb3069b0e04-5401f676999mr753706e87.55.1733725456993;
        Sun, 08 Dec 2024 22:24:16 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cacc70fsm340511e87.5.2024.12.08.22.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:24:16 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
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
Subject: [PATCH net-next] net: renesas: rswitch: enable only used MFWD features
Date: Mon,  9 Dec 2024 11:24:11 +0500
Message-Id: <20241209062411.152927-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, rswitch driver does not utilize most of MFWD forwarding
and processing features. It only uses port-based forwarding for ETHA
ports, and direct descriptor forwarding for GWCA port.

Update rswitch_fwd_init() to enable exactly that, and keep everything
else disabled.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 30 +++++++++++++++++---------
 drivers/net/ethernet/renesas/rswitch.h | 14 ++++++------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 16b1888270eb..7f17b9656cc3 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -111,25 +111,35 @@ static void rswitch_top_init(struct rswitch_private *priv)
 /* Forwarding engine block (MFWD) */
 static void rswitch_fwd_init(struct rswitch_private *priv)
 {
+	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
 
-	/* For ETHA */
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
-		iowrite32(FWPC0_DEFAULT, priv->addr + FWPC0(i));
+	/* Start with empty configuration */
+	for (i = 0; i < RSWITCH_NUM_AGENTS; i++) {
+		/* Disable all port features */
+		iowrite32(0, priv->addr + FWPC0(i));
+		/* Disallow L3 forwarding and direct descriptor forwarding */
+		iowrite32(FIELD_PREP(FWCP1_LTHFW, all_ports_mask),
+			  priv->addr + FWPC1(i));
+		/* Disallow L2 forwarding */
+		iowrite32(FIELD_PREP(FWCP2_LTWFW, all_ports_mask),
+			  priv->addr + FWPC2(i));
+		/* Disallow port based forwarding */
 		iowrite32(0, priv->addr + FWPBFC(i));
 	}
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	/* For enabled ETHA ports, setup port based forwarding */
+	rswitch_for_each_enabled_port(priv, i) {
+		/* Port based forwarding from port i to GWCA port */
+		rswitch_modify(priv->addr, FWPBFC(i), FWPBFC_PBDV,
+			       FIELD_PREP(FWPBFC_PBDV, BIT(priv->gwca.index)));
+		/* Within GWCA port, forward to Rx queue for port i */
 		iowrite32(priv->rdev[i]->rx_queue->index,
 			  priv->addr + FWPBFCSDC(GWCA_INDEX, i));
-		iowrite32(BIT(priv->gwca.index), priv->addr + FWPBFC(i));
 	}
 
-	/* For GWCA */
-	iowrite32(FWPC0_DEFAULT, priv->addr + FWPC0(priv->gwca.index));
-	iowrite32(FWPC1_DDE, priv->addr + FWPC1(priv->gwca.index));
-	iowrite32(0, priv->addr + FWPBFC(priv->gwca.index));
-	iowrite32(GENMASK(RSWITCH_NUM_PORTS - 1, 0), priv->addr + FWPBFC(priv->gwca.index));
+	/* For GWCA port, allow direct descriptor forwarding */
+	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), FWPC1_DDE, FWPC1_DDE);
 }
 
 /* Gateway CPU agent block (GWCA) */
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 9ac55b4f5b14..741b089c8523 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -12,6 +12,7 @@
 
 #define RSWITCH_MAX_NUM_QUEUES	128
 
+#define RSWITCH_NUM_AGENTS	5
 #define RSWITCH_NUM_PORTS	3
 #define rswitch_for_each_enabled_port(priv, i)		\
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++)		\
@@ -811,6 +812,7 @@ enum rswitch_gwca_mode {
 #define CABPPFLC_INIT_VALUE	0x00800080
 
 /* MFWD */
+#define FWPC0(i)		(FWPC00 + (i) * 0x10)
 #define FWPC0_LTHTA		BIT(0)
 #define FWPC0_IP4UE		BIT(3)
 #define FWPC0_IP4TE		BIT(4)
@@ -824,15 +826,15 @@ enum rswitch_gwca_mode {
 #define FWPC0_MACHMA		BIT(27)
 #define FWPC0_VLANSA		BIT(28)
 
-#define FWPC0(i)		(FWPC00 + (i) * 0x10)
-#define FWPC0_DEFAULT		(FWPC0_LTHTA | FWPC0_IP4UE | FWPC0_IP4TE | \
-				 FWPC0_IP4OE | FWPC0_L2SE | FWPC0_IP4EA | \
-				 FWPC0_IPDSA | FWPC0_IPHLA | FWPC0_MACSDA | \
-				 FWPC0_MACHLA |	FWPC0_MACHMA | FWPC0_VLANSA)
 #define FWPC1(i)		(FWPC10 + (i) * 0x10)
+#define FWCP1_LTHFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 #define FWPC1_DDE		BIT(0)
 
-#define	FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
+#define FWPC2(i)		(FWPC20 + (i) * 0x10)
+#define FWCP2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+
+#define FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
+#define FWPBFC_PBDV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
 
 #define FWPBFCSDC(j, i)         (FWPBFCSDC00 + (i) * 0x10 + (j) * 0x04)
 
-- 
2.39.5


