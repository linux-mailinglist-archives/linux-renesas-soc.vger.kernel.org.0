Return-Path: <linux-renesas-soc+bounces-1541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C6B82C95C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 05:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0891FB24055
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 04:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB65EAD6;
	Sat, 13 Jan 2024 04:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="IuIcKNTX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F76E56E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2024 04:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd81b09e83so34211811fa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2024 20:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1705121246; x=1705726046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGYVtaOwn2aSZdpDm8ExTcOizp30qs5QNeu6pAO5dGc=;
        b=IuIcKNTXczNI9k8KeaRHXYfqUWqH5d1wxijR7BEnN2tMLSJUW/T5dsc7hUrHaDsOYP
         l0YcUhmdAj04ETe8mmxLoGyn1V8f+ekKhzJHH4aFQoMCjxEFPKn3IK/4zwJy6r8I8Q5x
         tAf4QdMLANHgh4W9x+byup81xrlYP6uxF6GQhoV6WzLMQ8kA8hAaWUvtNcp0stv4lOKC
         /+S4wgg0E66n/bgEhXJOk5O92PyTkFgT7owPg4Uh3py4IjOU39ywjOsQVF7qynUkEbLK
         qkGScRO7K6bJtJzRtGdU6tCxYBIF66YJ5zpGLf2fOZmTaF4taD0ew4jaDpF2g7jj0WIn
         /zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705121246; x=1705726046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGYVtaOwn2aSZdpDm8ExTcOizp30qs5QNeu6pAO5dGc=;
        b=rFj21VIE0pBhoLHRY1M4jKwWim84wci3wDVEL8qEBUe7nAseddhwCDmKW7K7D09R4H
         tggwCBTukIbR4JYM0KiACBY1TxY2Dt56ptTV+1Hv4cZCxhYOt168qtdlbKC1UT9OW7C9
         K/Tk6EJHsNECZGcPj7KMXv96Q3WCaruBMwiknjIHDvFMmNJAfVOcAyKNv9RDyF8D+E2H
         VlPlVAn29sZAYWqcNaK9Fki26Bvs1Dnq7GQc72SQa25JnNIW5ZXiNc/JeTJHzJfaV3LN
         ZRg2ilsqFHpLYbt6OPRK5xQmjTI3xsNcxc3blGygM1zRzNPlizmAwhFAyPHdF8wgPgKV
         7EIQ==
X-Gm-Message-State: AOJu0YxZVxIgqGbqXTDSIjqYydJcysBOYByJomynsY1no73OC13kXyZ0
	YiH4Eb9cTLDpzcs5YrI4UuQk5Ud4JZ2Yfw==
X-Google-Smtp-Source: AGHT+IGcVGUMkbXDcfPGAey7BgeLwbvzqJqgd9ktQyfYfRz3bXNihChX1fFzblaMbL9tfUR7MW9VCw==
X-Received: by 2002:a2e:9ccc:0:b0:2cd:4eb2:f19b with SMTP id g12-20020a2e9ccc000000b002cd4eb2f19bmr677700ljj.182.1705121246105;
        Fri, 12 Jan 2024 20:47:26 -0800 (PST)
Received: from cobook.home ([91.231.66.25])
        by smtp.gmail.com with ESMTPSA id 5-20020a05651c00c500b002cca6703b16sm672190ljr.44.2024.01.12.20.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 20:47:25 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] net: ravb: Fix wrong dma_unmap_single() calls in ring unmapping
Date: Sat, 13 Jan 2024 10:47:21 +0600
Message-Id: <20240113044721.481131-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unmapping ring entries on Rx ring release, ravb driver needs to
unmap only those entries that have been mapped successfully.

To check if an entry needs to be unmapped, currently the address stored
inside descriptor is passed to dma_mapping_error() call. But, address
field inside descriptor is 32-bit, while dma_mapping_error() is
implemented by comparing it's argument with DMA_MAPPING_ERROR constant
that is 64-bit when dma_addr_t is 64-bit. So the comparison gets wrong,
resulting into ravb driver calling dma_unnmap_single() for 0xffffffff
address.

When the ring entries are mapped, in case of mapping failure the driver
sets descriptor's size field to zero (which is a signal to hardware to
not use this descriptor). Fix ring unmapping to detect if an entry needs
to be unmapped by checking for zero size field.

Fixes: a47b70ea86bd ("ravb: unmap descriptors when freeing rings")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0e3731f50fc2..4d4b5d44c4e7 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -256,8 +256,7 @@ static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		struct ravb_rx_desc *desc = &priv->gbeth_rx_ring[i];
 
-		if (!dma_mapping_error(ndev->dev.parent,
-				       le32_to_cpu(desc->dptr)))
+		if (le16_to_cpu(desc->ds_cc) != 0)
 			dma_unmap_single(ndev->dev.parent,
 					 le32_to_cpu(desc->dptr),
 					 GBETH_RX_BUFF_MAX,
@@ -281,8 +280,7 @@ static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		struct ravb_ex_rx_desc *desc = &priv->rx_ring[q][i];
 
-		if (!dma_mapping_error(ndev->dev.parent,
-				       le32_to_cpu(desc->dptr)))
+		if (le16_to_cpu(desc->ds_cc) != 0)
 			dma_unmap_single(ndev->dev.parent,
 					 le32_to_cpu(desc->dptr),
 					 RX_BUF_SZ,
-- 
2.39.2


