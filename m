Return-Path: <linux-renesas-soc+bounces-11358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703109F2ADB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 08:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1AA163820
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 07:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD451D5AB8;
	Mon, 16 Dec 2024 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="lp2QMC9C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B91D54EF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734333622; cv=none; b=d6ucmeMoGht+QEoT7QPEKDAeHKHs7r6R+jXkuxJe97urI4YvnbTlzxU5D8WGajhXV1yzHfn5oHr6fNwzrld9Nu1B69oNDdd7IUCNJ/mGrOMCJ1OlM1s7jOdhVc6lGQDd+xNzDoodkT92PjWF5SJhouGvSScXgEgAPGhBan9sSIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734333622; c=relaxed/simple;
	bh=PPu77jqSXBAgupPgYnoSOAHUAmL6TvEmfGQvFsLGMGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzG4JafMBHl1B6IHQIpyBvPqGdkZsiDrWD10ckK87g9XepAs8qtjAMlDDguPTC0gpR8xcRJqsZQlQooNDDOzSYhVDBAdM+Uw4W6r3zm2oJ6nDDxecVbGOLkvNWkciYJIcarthpL8qZT+U8rgWBI7ZQkTYPvfZHumCqAI3Q/lCfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=lp2QMC9C; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540254357c8so3427512e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Dec 2024 23:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734333619; x=1734938419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bRm8i06V7UAQJx4SsgcbkPUCzwQb13lEnvW91v/XN8=;
        b=lp2QMC9CI3ikyuAy2Tt9MtnsgHTh/Weq/TNHrCzoGhFjpSqj4i8hVoFa/H4ntMR3zd
         AG/vIuyn2m4gJyTClbQnI480tmeJt4eOsthR0NBvtXbBYSALivYD/k3wk1iH28mRcmv1
         58AZAMhi1F1qBENhYGKpkveJZYs/1KOwDyCAp1CuTff/TH/+Jt3HY4nCYJcebVH2V4AK
         99anuJvKzysRb7SK6WXSxlIaGRfnH2fl85X1lFdSi/M+MzMoqovJmfSWhaeBlStPuXMj
         V+JUzYSqRbwbHLMe65qZb4zYO9vpvynX7r3AYZKm0mNNr/vh7A7nxMcC0mM36mh4BKav
         DpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734333619; x=1734938419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bRm8i06V7UAQJx4SsgcbkPUCzwQb13lEnvW91v/XN8=;
        b=GUSbUVIdawVBw9IZTsffFSd+Ckdct27EqSXcH+7W4Uy2MkxbGTRfi0ASkt4wDM20ts
         lR88x3+Yk7WaiQlRekic7oMJo9JqOL9JMfJb/mESzIkgWoamXGYz3wWJGV2+B8wUsbCc
         TwueRD7xEQPbxf7iR3oUOZWRMLRmuf7lwZJ9dkcpB5/hQQ2eo2KdhhBmucTnOY0+zlcK
         SrwzydLkLSYt3uP/dkfFP2LHB2l3EjNnLGuQHmjhCqIcfz8U/VauuzgiwCOb34tDWjbr
         ak0XLM3f2kTSGyardAaYwXhzSwrrqrEQ3EMUgv0E4x1RIz7nYURA6JiiRK1otqNMZNsT
         sWsA==
X-Forwarded-Encrypted: i=1; AJvYcCWZrKdItzZzMSkIwkp3k6tD1tucNpEjA79M6zr8OYd0t+XrYXZt1+I4eKG9enkBfrCpMNq1iHkMKYC76Kmm+HOXBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN52DZTmTTojz/yyhmeLPmLYOp3a5MLOxTOPGxfPHID+9VHTGQ
	+GyF0qw+qIr7YCVExkqA9yemSYtn8yV37cRfv50a/StLHCi6a7epHnuOwh76/ZM=
X-Gm-Gg: ASbGncu6MHgsF6Nu3ZFxQxTPH2eEi7uO9vIvysIaMEjH4w6INGCzPTWcy9+1+3NHXC8
	XHNMPVD9UWkQ5B0YaTm0jgOj6FPkMVlANiVcYy36yuq38D8rsLnsipSA/NUIKoSpAfkNaO0hsQo
	JW8BIZWq4YPjEafAhNhEqSmOpD1xXdyAPHeOeWdvOSrfknBC/cJjcMYZiQqcMl5kfaFaqCgsoeU
	kroLpXmlzcg9oYruLcx9VpkN35t2xk2Y5xuLKTnMss43UvJYpP6vFktT8cP8GsDG3vRe9w=
X-Google-Smtp-Source: AGHT+IFowAXgGjOedfuT8nJJtjG23yp3KyVX22HWiWvy1vf9kaEvbhBVhV1xHsfmSOlU8xeDwiDt1Q==
X-Received: by 2002:a05:6512:401b:b0:540:c349:a81b with SMTP id 2adb3069b0e04-540c349a962mr3449085e87.48.1734333619267;
        Sun, 15 Dec 2024 23:20:19 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9b2bsm748930e87.94.2024.12.15.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:20:19 -0800 (PST)
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
Subject: [PATCH net-next v2 5/5] net: renesas: rswitch: add mdio C22 support
Date: Mon, 16 Dec 2024 12:19:57 +0500
Message-Id: <20241216071957.2587354-6-nikita.yoush@cogentembedded.com>
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

The generic MPSM operation added by the previous patch can be used both
for C45 and C22.

Add handlers for C22 operations.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index a3ba2a91c0ab..aae26098bc0c 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1253,6 +1253,23 @@ static int rswitch_etha_mii_write_c45(struct mii_bus *bus, int addr, int devad,
 				    MPSM_POP_WRITE, val);
 }
 
+static int rswitch_etha_mii_read_c22(struct mii_bus *bus, int phyad, int regad)
+{
+	struct rswitch_etha *etha = bus->priv;
+
+	return rswitch_etha_mpsm_op(etha, true, MPSM_MMF_C22, phyad, regad,
+				    MPSM_POP_READ_C22, 0);
+}
+
+static int rswitch_etha_mii_write_c22(struct mii_bus *bus, int phyad,
+				      int regad, u16 val)
+{
+	struct rswitch_etha *etha = bus->priv;
+
+	return rswitch_etha_mpsm_op(etha, false, MPSM_MMF_C22, phyad, regad,
+				    MPSM_POP_WRITE, val);
+}
+
 /* Call of_node_put(port) after done */
 static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 {
@@ -1335,6 +1352,8 @@ static int rswitch_mii_register(struct rswitch_device *rdev)
 	mii_bus->priv = rdev->etha;
 	mii_bus->read_c45 = rswitch_etha_mii_read_c45;
 	mii_bus->write_c45 = rswitch_etha_mii_write_c45;
+	mii_bus->read = rswitch_etha_mii_read_c22;
+	mii_bus->write = rswitch_etha_mii_write_c22;
 	mii_bus->parent = &rdev->priv->pdev->dev;
 
 	mdio_np = of_get_child_by_name(rdev->np_port, "mdio");
-- 
2.39.5


