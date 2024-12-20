Return-Path: <linux-renesas-soc+bounces-11598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2779F8B1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 05:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DFEA18948C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 04:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D55217E00E;
	Fri, 20 Dec 2024 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="C/5/BU97"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524113C914
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668233; cv=none; b=pSOcmXkP31E10Ikf8bhr7BCbJ3YSFfko+dDzHGj0Vob3RoUNRs0O+9eSIEkdrVlMKFdA2Lkag5OgUoFvzSldF1Imwv1djsmJlFHh2s6NzWP3HcQV6ivc216cfGw2/pbGUwtJNGVdKuhZ9h8WNR2Uo9GIDXWGAX/95nxQhiV8+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668233; c=relaxed/simple;
	bh=7UUTsmjRchZRPWt1L9EdlY0v8i26VrF6o4c6qJ5IuEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RGvZnuGKxr0atXtCKEuaXx1/aN17OK4IsoGJLk54Kz41vpaFv0CxtQCaloiMx2L54bhC/RTsiZGfot38Dtd79MvKcnH0+GJauqmW08zBfy/2qV20UtdVYFUSeqZNIcveMnHl7MZ1SKvge2va8/TjI0e1MZhz4JG6TF00H/vPVQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=C/5/BU97; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so2671293e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 20:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734668229; x=1735273029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTwIjsFkDY5wb4hiAoIm9JErxNYkg5bDw1x4lkN+29w=;
        b=C/5/BU97WUAHskdaqwHOyALD2wJogE7lKIPRtIv0mxSpReUWljdAJq9HG5SQCI4aBD
         Moq5j1i67w6Pfq8M+Iy4JpSSsAS/wBYXrtEe3tpF6sT+3oJIDU5tlhKPme3Z80vixWvL
         BjuCHWiu0za2Hrcx0o9PNF3xhLTwjUybjLRy3RiSi2/gOLKK44j2ArfpaxqloBshXsMG
         Da2lmcWbGP3M+7b4K3pHjV5c5PRMH4Lg+QTGk7jQMK+ZWZz5N+PSixYm3RFbfdc5SXGm
         R5jDdqg0LJMAvzqXR/rIsQmw+ppKCQnORD/IEDYvKbH25OrqaDORtQwouw7NYJqY0cfT
         IoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734668229; x=1735273029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTwIjsFkDY5wb4hiAoIm9JErxNYkg5bDw1x4lkN+29w=;
        b=d+DYbkyXhdreBP3uGsMVfRAOytaLkpT/zYp2Z1ijNgaXnGIkhud/j9CY7jgR9mrx1/
         cCGfNV+qKVSmvuB7Nc5VvDxwrmuTGIMalZ3EL4vjcTLsfUDalQJSJtwo1+X9C/OplDBo
         18oq2tNVPv4a4aH5bPEmY7ggMOXqhrPhS0xC5uoEDDaYNSQCU931jpdfv6T2yV6FKQyn
         3YCqQds8R4WDWMt+e59YWKMqx1qWgivbvMsSNIt2L5+xdHH8ymhpd2gXlXz+/BLTltkZ
         s209wYGn96EEOuRnP4cybjCIzMPq015/P/49Un51GlfdJpfPVqjUUZXZRprjzNXTtIgx
         j40Q==
X-Forwarded-Encrypted: i=1; AJvYcCV37RFBndNZnLwGIC6P9smFLEpfqeSh5NvI8MVphXMtlwMECURidOK6ZraLC0dzx/AU0rqQ+w+qXWFWm0orygq1pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEsNG3Xy8T9YCHxGavt9LHg3gzPloGGBtfI15TZuZ+LDi7HNXA
	C2EfGFQogmwg4i4QzDIzqZnUUitYceOzILynQWp83PP0CfA/+uxjpb0yFWvXMSk=
X-Gm-Gg: ASbGnctOWl3ljwY3xtLujip1luwPOJkHhltRrr8u5KuUd/jFjoYlfLyLWWYifobLGqs
	u5oCrKxlAB7VzVAUfwjO/snn+pJusV+BPUbUnPso/CEoMdsetuGDuLcAnAOs2HbclBWKBBiO39q
	zrwBWEgl7kxhb3Qla6gLltgvBLj1XTHiLq11pinHA8lY7hJpXzXpflcR9eWsV7qcH++VYSxD/3v
	knnQLt5GlIIZR0Q/OlGFEZdr/noXw7+bNVOw5XwjXw84lBlIY/y8SoTIZ3bo+bXsklSFQg=
X-Google-Smtp-Source: AGHT+IE5czr4LmTwoALi/RSdvS2Orti1CAw/4SDl5Z6ra7AljW2hSxHfLwtSebbfg5iMM0wrj4ad/w==
X-Received: by 2002:a05:6512:1042:b0:540:2add:c1f1 with SMTP id 2adb3069b0e04-5422133b657mr1889695e87.18.1734668229367;
        Thu, 19 Dec 2024 20:17:09 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm357078e87.280.2024.12.19.20.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 20:17:09 -0800 (PST)
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
Subject: [PATCH net-next 2/2] net: renesas: rswitch: request ts interrupt at port open
Date: Fri, 20 Dec 2024 09:16:59 +0500
Message-Id: <20241220041659.2985492-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Data interrupts are now requested at port open and freed at port close.

For symmetry, do the same for ts interrupt.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 35 +++++++++++++-------------
 drivers/net/ethernet/renesas/rswitch.h |  2 +-
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index eb9dea8b16f3..cc8f2a4e3d70 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -989,18 +989,6 @@ static irqreturn_t rswitch_gwca_ts_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static int rswitch_gwca_ts_request_irqs(struct rswitch_private *priv)
-{
-	int irq;
-
-	irq = platform_get_irq_byname(priv->pdev, GWCA_TS_IRQ_RESOURCE_NAME);
-	if (irq < 0)
-		return irq;
-
-	return devm_request_irq(&priv->pdev->dev, irq, rswitch_gwca_ts_irq,
-				0, GWCA_TS_IRQ_NAME, priv);
-}
-
 /* Ethernet TSN Agent block (ETHA) and Ethernet MAC IP block (RMAC) */
 static int rswitch_etha_change_mode(struct rswitch_etha *etha,
 				    enum rswitch_etha_mode mode)
@@ -1510,8 +1498,14 @@ static int rswitch_open(struct net_device *ndev)
 	unsigned long flags;
 	int ret;
 
-	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
+	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS)) {
+		ret = request_irq(rdev->priv->gwca.ts_irq, rswitch_gwca_ts_irq,
+				  0, "rswitch_ts", rdev->priv);
+		if (ret < 0)
+			return ret;
+
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
+	}
 
 	napi_enable(&rdev->napi);
 
@@ -1535,8 +1529,10 @@ static int rswitch_open(struct net_device *ndev)
 err_request_irq:
 	napi_disable(&rdev->napi);
 
-	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
+	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS)) {
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
+		free_irq(rdev->priv->gwca.ts_irq, rdev->priv);
+	}
 
 	return ret;
 };
@@ -1562,8 +1558,10 @@ static int rswitch_stop(struct net_device *ndev)
 
 	napi_disable(&rdev->napi);
 
-	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
+	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS)) {
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
+		free_irq(rdev->priv->gwca.ts_irq, rdev->priv);
+	}
 
 	for (tag = find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
 	     tag < TS_TAGS_PER_PORT;
@@ -2001,9 +1999,10 @@ static int rswitch_init(struct rswitch_private *priv)
 	if (err < 0)
 		goto err_ptp_register;
 
-	err = rswitch_gwca_ts_request_irqs(priv);
+	err = platform_get_irq_byname(priv->pdev, GWCA_TS_IRQ_RESOURCE_NAME);
 	if (err < 0)
-		goto err_gwca_ts_request_irq;
+		goto err_gwca_ts_irq;
+	priv->gwca.ts_irq = err;
 
 	err = rswitch_gwca_hw_init(priv);
 	if (err < 0)
@@ -2035,7 +2034,7 @@ static int rswitch_init(struct rswitch_private *priv)
 	rswitch_gwca_hw_deinit(priv);
 
 err_gwca_hw_init:
-err_gwca_ts_request_irq:
+err_gwca_ts_irq:
 	rcar_gen4_ptp_unregister(priv->ptp_priv);
 
 err_ptp_register:
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index a1e62a6b3844..54b9f059707a 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -58,7 +58,6 @@
 #define GWRO			RSWITCH_GWCA0_OFFSET
 
 #define GWCA_TS_IRQ_RESOURCE_NAME	"gwca0_rxts0"
-#define GWCA_TS_IRQ_NAME		"rswitch: gwca0_rxts0"
 #define GWCA_TS_IRQ_BIT			BIT(0)
 
 #define FWRO	0
@@ -978,6 +977,7 @@ struct rswitch_gwca {
 	struct rswitch_gwca_queue *queues;
 	int num_queues;
 	struct rswitch_gwca_queue ts_queue;
+	int ts_irq;
 	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
 };
 
-- 
2.39.5


