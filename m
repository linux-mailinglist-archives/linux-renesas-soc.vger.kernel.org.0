Return-Path: <linux-renesas-soc+bounces-1540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E328182C953
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 05:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 154DA1C21EDA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 04:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707C2DF5E;
	Sat, 13 Jan 2024 04:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="eWoZ5X5a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B87DF4F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2024 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso8018577e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2024 20:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1705119750; x=1705724550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vS+L0Cm6LHGXUIGYvUEf/XfnPHJWEGKxQ2S4NgJfQXE=;
        b=eWoZ5X5aJ9X9vYT2Bg04rXk2+jUECS8GnWxfEfn8oGQKYZ8CzyLgJ1n29q2FwO/VMZ
         TFSZ0dnENXjee4VBF4G8VtWsRj9FiYYrCwosteh7eDRpqzwNkeZZRzqjUinABmq6+NI1
         G0d+KEjE67qN/F4fut8HbLa01U1CdvxjiTIv4X3zbuczrzsrhxrAqiJIOwU0hRiDTSAe
         71KmP+upUz2/TLymD4yS69iTYtjjMDcQ8D3ukrdWe1iV92ZKlGpe++2TOgysSzJ/xp5N
         S56t8mPJBMj6iWVBJ+wO1cs1SWl73GP10YYokoKm64OYXbYwMHjHj7DtGuM+paN3MjTd
         0TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705119750; x=1705724550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vS+L0Cm6LHGXUIGYvUEf/XfnPHJWEGKxQ2S4NgJfQXE=;
        b=Iy77j0SKyC6WXA52vPpnKUQGPoZ5iF7BWD4s8TiUWGwO9YmvC3CeMivyrxtJJgeLhB
         CpW7zD0Au6UrQPXGiqJ8naRGPwK1u9bwEz+9+O3fPrVKt39+n2c9cOSfue7TIn1oIDjK
         vcrIUWbSpQfeJTlrznKdiTVNa+si9Xmq5qlGe7zP8uz5a8RLyon30T3nOrnor61KJJvg
         cLcuVSaQzV0thdERSN3ck6Ze8S8DzzATETJ9OXbt/khb+YsKbxfa1h1f3r9KKWIu2oG6
         YqobP/xUqkLlmYRhq0oFlnPj7YUjMsUnh81WJ9pxcp9UxovUl4L/7OmR+u2JhASsQp3d
         0XCA==
X-Gm-Message-State: AOJu0YwgNlVyXQPzAv7eIhGbSDKHtnRTOumr8BFps2I+kquG+5Aygn9L
	c8XS+LfbIP5BGthGbEjmSTcv4prHj4RuAQ==
X-Google-Smtp-Source: AGHT+IGyZAS8k6b7yIU8QdArXsZAO6Moe7/hurvssB3FoaDxzskCyCpPG4rUxeqWBB16o+5YxVFLPA==
X-Received: by 2002:a19:e04d:0:b0:50e:aa46:757b with SMTP id g13-20020a19e04d000000b0050eaa46757bmr1036342lfj.4.1705119749617;
        Fri, 12 Jan 2024 20:22:29 -0800 (PST)
Received: from cobook.home ([91.231.66.25])
        by smtp.gmail.com with ESMTPSA id c15-20020a05651221af00b0050e73a2ae87sm710788lft.43.2024.01.12.20.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 20:22:29 -0800 (PST)
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
Subject: [PATCH] net: ravb: Fix dma_addr_t truncation in error case
Date: Sat, 13 Jan 2024 10:22:21 +0600
Message-Id: <20240113042221.480650-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ravb_start_xmit(), ravb driver uses u32 variable to store result of
dma_map_single() call. Since ravb hardware has 32-bit address fields in
descriptors, this works properly when mapping is successful - it is
platform's job to provide mapping addresses that fit into hardware
limitations.

However, in failure case dma_map_single() returns DMA_MAPPING_ERROR
constant that is 64-bit when dma_addr_t is 64-bit. Storing this constant
in u32 leads to truncation, and further call to dma_mapping_error()
fails to notice the error.

Fix that by storing result of dma_map_single() in a dma_addr_t
variable.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 8649b3e90edb..0e3731f50fc2 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1949,7 +1949,7 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	struct ravb_tstamp_skb *ts_skb;
 	struct ravb_tx_desc *desc;
 	unsigned long flags;
-	u32 dma_addr;
+	dma_addr_t dma_addr;
 	void *buffer;
 	u32 entry;
 	u32 len;
-- 
2.39.2


