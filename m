Return-Path: <linux-renesas-soc+bounces-11597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376BB9F8B17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 05:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2313D1620A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 04:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD4A1422A8;
	Fri, 20 Dec 2024 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="W3DUukMz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B966A009
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 04:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668231; cv=none; b=uvgfuHD24bBp7wWgqJwn4eaGFQ+S0V14jZTKrYxdvrGM2o4xN0kc5r5O+Lcae587GO9fLRv9HPGfFH7qNftd9GkpvqIxR90GCxq1bnU5xYUT3GFQ5YBmvN6tnko48/xCBU+67XLXRjFGVPZ7mNliPzPmFLgqXhM1poE8CadwkX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668231; c=relaxed/simple;
	bh=Zzz2EPje6+3TuGXV1Q1rqzKmSt6Pb5THyarRvmhP+Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ngyAHTd9RmwEJYSaSITdGMjqepQlMcczAwXCipKyrWVhWBgT9lG6+Rj3n+NkdmdIYmVAFeeJNtlX6wpdiHSNenxsN3+TVDNYYVo0I8U1NYe1u+R+mDmRCvd/rYscIa909ELoeg9xuEB46m3N6fI6G8WvWr8BVvQMXmolPBF5Hk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=W3DUukMz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so1497092e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 20:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734668227; x=1735273027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdyfGmuzzdq2sa9nFxISnqHi8az8zfldhWocEWhpN90=;
        b=W3DUukMzVg/QS5ixYElsNbukPKsCouvKBQQfVQ6VfjQf5ttQz67OW2pvVCNKALHikT
         1YXPNZXc0srtf2oivGocWZcvZSg7wMLzJYKuGmb0W2k0UIcA60+SOJpubHiMut7VBBGE
         qIz9E+Eq2Q53piWnzAbxC74SA8fmtY+9RLbj0ckeIWJgRsf4JYDf9wKDhsoczyV2qpVm
         cYLhTEYZcH3J2SR21kMZlgeaROSqh+vw6l8D205nonYMTMykdW+vlnCcUQoAzKgcLuOg
         l2Yy9UG6eI8h0x8rueMLiScH8MymQEU131Xs+v7dygAgqh0r2NwcRBupvndVfBgCrWiS
         ApOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734668227; x=1735273027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdyfGmuzzdq2sa9nFxISnqHi8az8zfldhWocEWhpN90=;
        b=ToOr8OdiBFCXmhbQvOO7I0bnRLmpiUJKzTAjvrXTnJh7nzyk3UhQpHtwifMJmLTaS3
         x0HN5OQLNmiVs+Nv7VCXQ1xtXB1EeRiEEZYAymoHHnz6RN0DCDA63xOFzRWT2x7Vzk4a
         5VGWzY87ElkcB6x//mCSakVnyk96ZEDTOaR4MbpkRcv7+E4ONx7DPG38q+5JDU6AroJK
         Crs+ctj69GBUxUJw2FPiIVUELTdD1BZg2Flrl6tAO79HMFHO4JehIoR+nc6rFk73Py7g
         UY0pZ0X3PoTIB1mBtDANNAeWdnDec2EbtXiIf11M7JRtSZ67sZ6y91ojT+hG7nkgVSJf
         Rllg==
X-Forwarded-Encrypted: i=1; AJvYcCXNy2APrk2AoNKrfgv6xrFizmQKPP9AtKESuE2XsTzYI5G6RdC/NoGKSmghhpQjHnwVwxPBSNMXdhcW1Ks0W6i0qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPSo0q6aJ1qjV7F6T4Na6xJp/6/o+J2bOh72PvfMEX4nP7Q1bS
	4lrj4XOAveyhtQgOmyvqRprO1l14m7Pd4GABmTJGGLO/FFLzmxtWK2BQJYVHIZk=
X-Gm-Gg: ASbGncuSwjmizc/UrMui68BCut0HZksSFoEa+BEifJRdD7ZK+Hqy6VSdKdfQqdiJfEf
	4S/qQf4PTeXFWwSE1sB5+jCEUZekTOWVH62TrThrA+k+UJ5NE22ElQP0s4atsmp6RleRZfTE2aR
	M3kyMJLtzPxrSkPEEc7Z8pWojIXd9i+iEeiW+WPOrCrmk5lf7tCGbgTIo3jZ9wZCKQVC9X9vZRX
	X+UtO1/bGrGnoSSbvfW+bFZaaZ2Jid0pCPZf0iZTi+Sl3W+3cN6mJT7iPd2SWzmsjGTV7Y=
X-Google-Smtp-Source: AGHT+IEm/48JRG9rYImWJCL4b/vA9ZZZm32z9vp+IsOg3BhPCH2QFQWygKbCz9GD+scIV0XfwvxHMw==
X-Received: by 2002:a05:6512:32c8:b0:541:3175:19b4 with SMTP id 2adb3069b0e04-542212eee43mr2221258e87.11.1734668227314;
        Thu, 19 Dec 2024 20:17:07 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm357078e87.280.2024.12.19.20.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 20:17:07 -0800 (PST)
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
Subject: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq handlers
Date: Fri, 20 Dec 2024 09:16:58 +0500
Message-Id: <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
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

Instead of handling all possible data interrupts in the same handler,
switch to per-port handlers.

This significantly simplifies handling: when the same interrupt is used
for several ports, system calls all handlers, and each handler only has
to check interrupts for one port's tx and rx queues.

But it is not required to use the same interrupt for all ports - GWCA
provides 8 data interrupts and allows arbitrary per-queue assignment
of those. Support that by reading interrupt index for each port from
optional 'irq-index' device tree property.

With per-port interrupts it becomes possible to configure affinity such
that traffic coming from different ports is serviced simultaneously on
different CPUs.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 190 ++++++++++---------------
 drivers/net/ethernet/renesas/rswitch.h |  10 +-
 2 files changed, 82 insertions(+), 118 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 84d09a8973b7..eb9dea8b16f3 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -99,15 +99,6 @@ static void rswitch_coma_init(struct rswitch_private *priv)
 	iowrite32(CABPPFLC_INIT_VALUE, priv->addr + CABPPFLC0);
 }
 
-/* R-Switch-2 block (TOP) */
-static void rswitch_top_init(struct rswitch_private *priv)
-{
-	unsigned int i;
-
-	for (i = 0; i < RSWITCH_MAX_NUM_QUEUES; i++)
-		iowrite32((i / 16) << (GWCA_INDEX * 8), priv->addr + TPEMIMC7(i));
-}
-
 /* Forwarding engine block (MFWD) */
 static void rswitch_fwd_init(struct rswitch_private *priv)
 {
@@ -175,29 +166,6 @@ static int rswitch_gwca_axi_ram_reset(struct rswitch_private *priv)
 	return rswitch_reg_wait(priv->addr, GWARIRM, GWARIRM_ARR, GWARIRM_ARR);
 }
 
-static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool tx)
-{
-	u32 *mask = tx ? priv->gwca.tx_irq_bits : priv->gwca.rx_irq_bits;
-	unsigned int i;
-
-	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
-		if (dis[i] & mask[i])
-			return true;
-	}
-
-	return false;
-}
-
-static void rswitch_get_data_irq_status(struct rswitch_private *priv, u32 *dis)
-{
-	unsigned int i;
-
-	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
-		dis[i] = ioread32(priv->addr + GWDIS(i));
-		dis[i] &= ioread32(priv->addr + GWDIE(i));
-	}
-}
-
 static void rswitch_enadis_data_irq(struct rswitch_private *priv,
 				    unsigned int index, bool enable)
 {
@@ -206,12 +174,18 @@ static void rswitch_enadis_data_irq(struct rswitch_private *priv,
 	iowrite32(BIT(index % 32), priv->addr + offs);
 }
 
-static void rswitch_ack_data_irq(struct rswitch_private *priv,
-				 unsigned int index)
+static bool rswitch_check_ack_data_irq(struct rswitch_private *priv,
+				       unsigned int index)
 {
-	u32 offs = GWDIS(index / 32);
+	u32 reg = GWDIS(index / 32);
+	u32 bit = BIT(index % 32);
 
-	iowrite32(BIT(index % 32), priv->addr + offs);
+	if (ioread32(priv->addr + reg) & bit) {
+		iowrite32(bit, priv->addr + reg);
+		return true;
+	}
+
+	return false;
 }
 
 static unsigned int rswitch_next_queue_index(struct rswitch_gwca_queue *gq,
@@ -314,8 +288,6 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 				    struct rswitch_gwca_queue *gq,
 				    bool dir_tx, unsigned int ring_size)
 {
-	unsigned int i, bit;
-
 	gq->dir_tx = dir_tx;
 	gq->ring_size = ring_size;
 	gq->ndev = ndev;
@@ -345,13 +317,6 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 	if (!gq->rx_ring && !gq->tx_ring)
 		goto out;
 
-	i = gq->index / 32;
-	bit = BIT(gq->index % 32);
-	if (dir_tx)
-		priv->gwca.tx_irq_bits[i] |= bit;
-	else
-		priv->gwca.rx_irq_bits[i] |= bit;
-
 	return 0;
 
 out:
@@ -583,6 +548,15 @@ static void rswitch_gwca_put(struct rswitch_private *priv,
 	clear_bit(gq->index, priv->gwca.used);
 }
 
+static void rswitch_gwca_queue_assign_irq(struct rswitch_private *priv,
+					  struct rswitch_gwca_queue *gq,
+					  unsigned int irq_index)
+{
+	rswitch_modify(priv->addr, TPEMIMC7(gq->index),
+		       TPEMIMC7_GDICM(GWCA_INDEX),
+		       TPEMIMC7_GDICM_PREP(GWCA_INDEX, irq_index));
+}
+
 static int rswitch_txdmac_alloc(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
@@ -614,6 +588,7 @@ static int rswitch_txdmac_init(struct rswitch_private *priv, unsigned int index)
 {
 	struct rswitch_device *rdev = priv->rdev[index];
 
+	rswitch_gwca_queue_assign_irq(priv, rdev->tx_queue, rdev->irq_index);
 	return rswitch_gwca_queue_format(rdev->ndev, priv, rdev->tx_queue);
 }
 
@@ -649,6 +624,7 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
 
+	rswitch_gwca_queue_assign_irq(priv, rdev->rx_queue, rdev->irq_index);
 	return rswitch_gwca_queue_ext_ts_format(ndev, priv, rdev->rx_queue);
 }
 
@@ -933,9 +909,13 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	return 0;
 }
 
-static void rswitch_queue_interrupt(struct net_device *ndev)
+static irqreturn_t rswitch_gwca_data_irq(int irq, void *data)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_device *rdev = data;
+
+	if (!rswitch_check_ack_data_irq(rdev->priv, rdev->tx_queue->index) &&
+	    !rswitch_check_ack_data_irq(rdev->priv, rdev->rx_queue->index))
+		return IRQ_NONE;
 
 	if (napi_schedule_prep(&rdev->napi)) {
 		spin_lock(&rdev->priv->lock);
@@ -944,71 +924,10 @@ static void rswitch_queue_interrupt(struct net_device *ndev)
 		spin_unlock(&rdev->priv->lock);
 		__napi_schedule(&rdev->napi);
 	}
-}
-
-static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
-{
-	struct rswitch_gwca_queue *gq;
-	unsigned int i, index, bit;
-
-	for (i = 0; i < priv->gwca.num_queues; i++) {
-		gq = &priv->gwca.queues[i];
-		index = gq->index / 32;
-		bit = BIT(gq->index % 32);
-		if (!(dis[index] & bit))
-			continue;
-
-		rswitch_ack_data_irq(priv, gq->index);
-		rswitch_queue_interrupt(gq->ndev);
-	}
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t rswitch_gwca_irq(int irq, void *dev_id)
-{
-	struct rswitch_private *priv = dev_id;
-	u32 dis[RSWITCH_NUM_IRQ_REGS];
-	irqreturn_t ret = IRQ_NONE;
-
-	rswitch_get_data_irq_status(priv, dis);
-
-	if (rswitch_is_any_data_irq(priv, dis, true) ||
-	    rswitch_is_any_data_irq(priv, dis, false))
-		ret = rswitch_data_irq(priv, dis);
-
-	return ret;
-}
-
-static int rswitch_gwca_request_irqs(struct rswitch_private *priv)
-{
-	char *resource_name, *irq_name;
-	int i, ret, irq;
-
-	for (i = 0; i < GWCA_NUM_IRQS; i++) {
-		resource_name = kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, i);
-		if (!resource_name)
-			return -ENOMEM;
-
-		irq = platform_get_irq_byname(priv->pdev, resource_name);
-		kfree(resource_name);
-		if (irq < 0)
-			return irq;
-
-		irq_name = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL,
-					  GWCA_IRQ_NAME, i);
-		if (!irq_name)
-			return -ENOMEM;
-
-		ret = devm_request_irq(&priv->pdev->dev, irq, rswitch_gwca_irq,
-				       0, irq_name, priv);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static void rswitch_ts(struct rswitch_private *priv)
 {
 	struct rswitch_gwca_queue *gq = &priv->gwca.ts_queue;
@@ -1589,12 +1508,18 @@ static int rswitch_open(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	unsigned long flags;
+	int ret;
 
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
 
 	napi_enable(&rdev->napi);
 
+	ret = request_irq(rdev->irq, rswitch_gwca_data_irq, IRQF_SHARED,
+			  netdev_name(ndev), rdev);
+	if (ret < 0)
+		goto err_request_irq;
+
 	spin_lock_irqsave(&rdev->priv->lock, flags);
 	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
@@ -1606,6 +1531,14 @@ static int rswitch_open(struct net_device *ndev)
 	netif_start_queue(ndev);
 
 	return 0;
+
+err_request_irq:
+	napi_disable(&rdev->napi);
+
+	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
+		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
+
+	return ret;
 };
 
 static int rswitch_stop(struct net_device *ndev)
@@ -1625,6 +1558,8 @@ static int rswitch_stop(struct net_device *ndev)
 	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
+	free_irq(rdev->irq, rdev);
+
 	napi_disable(&rdev->napi);
 
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
@@ -1906,6 +1841,34 @@ static void rswitch_etha_init(struct rswitch_private *priv, unsigned int index)
 	etha->psmcs = clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
 }
 
+static int rswitch_port_get_irq(struct rswitch_device *rdev)
+{
+	unsigned int irq_index;
+	char *name;
+	int err;
+
+	err = of_property_read_u32(rdev->np_port, "irq-index", &irq_index);
+	if (err == 0) {
+		if (irq_index < GWCA_NUM_IRQS)
+			rdev->irq_index = irq_index;
+		else
+			dev_warn(&rdev->priv->pdev->dev,
+				 "%pOF: irq-index out of range\n",
+				 rdev->np_port);
+	}
+
+	name = kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, rdev->irq_index);
+	if (!name)
+		return -ENOMEM;
+	err = platform_get_irq_byname(rdev->priv->pdev, name);
+	kfree(name);
+	if (err < 0)
+		return err;
+	rdev->irq = err;
+
+	return 0;
+}
+
 static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index)
 {
 	struct platform_device *pdev = priv->pdev;
@@ -1954,6 +1917,10 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	if (err < 0)
 		goto out_get_params;
 
+	err = rswitch_port_get_irq(rdev);
+	if (err < 0)
+		goto out_get_irq;
+
 	err = rswitch_rxdmac_alloc(ndev);
 	if (err < 0)
 		goto out_rxdmac;
@@ -1968,6 +1935,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	rswitch_rxdmac_free(ndev);
 
 out_rxdmac:
+out_get_irq:
 out_get_params:
 	of_node_put(rdev->np_port);
 	netif_napi_del(&rdev->napi);
@@ -2003,7 +1971,6 @@ static int rswitch_init(struct rswitch_private *priv)
 	rswitch_reset(priv);
 
 	rswitch_clock_enable(priv);
-	rswitch_top_init(priv);
 	err = rswitch_bpool_config(priv);
 	if (err < 0)
 		return err;
@@ -2034,10 +2001,6 @@ static int rswitch_init(struct rswitch_private *priv)
 	if (err < 0)
 		goto err_ptp_register;
 
-	err = rswitch_gwca_request_irqs(priv);
-	if (err < 0)
-		goto err_gwca_request_irq;
-
 	err = rswitch_gwca_ts_request_irqs(priv);
 	if (err < 0)
 		goto err_gwca_ts_request_irq;
@@ -2073,7 +2036,6 @@ static int rswitch_init(struct rswitch_private *priv)
 
 err_gwca_hw_init:
 err_gwca_ts_request_irq:
-err_gwca_request_irq:
 	rcar_gen4_ptp_unregister(priv->ptp_priv);
 
 err_ptp_register:
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 532192cbca4b..a1e62a6b3844 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -51,7 +51,6 @@
 
 /* TODO: hardcoded ETHA/GWCA settings for now */
 #define GWCA_IRQ_RESOURCE_NAME	"gwca0_rxtx%d"
-#define GWCA_IRQ_NAME		"rswitch: gwca0_rxtx%d"
 #define GWCA_NUM_IRQS		8
 #define GWCA_INDEX		0
 #define AGENT_INDEX_GWCA	3
@@ -828,6 +827,10 @@ enum rswitch_gwca_mode {
 
 /* TOP */
 #define TPEMIMC7(queue)		(TPEMIMC70 + (queue) * 4)
+#define TPEMIMC7_GDICM0			GENMASK(2, 0)
+#define TPEMIMC7_GDICM_SHIFT(i)		((i) * 8)
+#define TPEMIMC7_GDICM(i)		(TPEMIMC7_GDICM0 << TPEMIMC7_GDICM_SHIFT(i))
+#define TPEMIMC7_GDICM_PREP(i, val)	(((val) & TPEMIMC7_GDICM0) << TPEMIMC7_GDICM_SHIFT(i))
 
 /* Descriptors */
 enum RX_DS_CC_BIT {
@@ -967,7 +970,6 @@ struct rswitch_gwca_queue {
 	};
 };
 
-#define RSWITCH_NUM_IRQ_REGS	(RSWITCH_MAX_NUM_QUEUES / BITS_PER_TYPE(u32))
 struct rswitch_gwca {
 	unsigned int index;
 	struct rswitch_desc *linkfix_table;
@@ -977,8 +979,6 @@ struct rswitch_gwca {
 	int num_queues;
 	struct rswitch_gwca_queue ts_queue;
 	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
-	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
-	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
 };
 
 #define NUM_QUEUES_PER_NDEV	2
@@ -990,6 +990,8 @@ struct rswitch_device {
 	void __iomem *addr;
 	struct rswitch_gwca_queue *tx_queue;
 	struct rswitch_gwca_queue *rx_queue;
+	unsigned int irq_index;
+	int irq;
 	struct sk_buff *ts_skb[TS_TAGS_PER_PORT];
 	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
 	bool disabled;
-- 
2.39.5


