Return-Path: <linux-renesas-soc+bounces-3223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09277868621
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 02:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CCD1F245F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 01:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EB4CA6B;
	Tue, 27 Feb 2024 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OlF53CLh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E025C8B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998121; cv=none; b=ghO62sIATU7YoPx2lsydB72CWa36SG49tN+6MgKJ1j6qL78H4UdApF/Rw+3DjXPVSulcFzEmqhecUo1z1jmDe35GXn+LbCmf0BCfZrctfOFWOTCng6mS2jTdmBTD9mxmw8OlAFTO+t86VhRd0QKoyqkUoBxs+Xfg1/M3PIfi0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998121; c=relaxed/simple;
	bh=TxWvqhdKyCdWcAgdV1E1upYoL6nk1uGlgpZBn0ku1TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuQxGlcH3dGdUDCVD4C1V50CcJzi3mCf0CFCeo7OjAtFiLtzyA/EUxRXbT6zUX3c7VIDNcmeIU0I7QGKQLTSUjveQsPrYwAUCcOgJQAK70/LSEL9sFRE0JMooCKXKk+wnZIg4EBH3f1eT7obF1xkTJnjgyOzhjCdUBAGKf/FbcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OlF53CLh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412a3371133so12808295e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 17:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708998118; x=1709602918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Njr01eXaTmzMyHGNg6x9jCbyB5dpG3QCfY2Mg3WPEc=;
        b=OlF53CLhQsY7VvtEztbmmTJ3176GjHDyR+j81SqbhN+Ocj8to8oW+C+0IqINgLtq20
         KfrtQff7M7alb2sCrEJoHknUFp2w/Ipx/SDIxl2OW5UXZBJLUyBLRMaCljcKiFfYBTZ9
         mxbcy0izHyV07bycBlrMLOimFLTcekUFiLQpGr3IXr+NazysfFLJ9d8ndJF1kQ2Na9kc
         9PEcWVyhSoGByJbKsW/G4zl1lQIwWk9QN3y1Oe2LhK0RTjPmm0ikSw2cPgjgg7sCMvXA
         7bqeCpo9K2R1NZYHmiMSvXKva1PwtukZxKZP1wIvN3d9UVP8q9fd9hzCgo9F4UMYV3l8
         tVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998118; x=1709602918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Njr01eXaTmzMyHGNg6x9jCbyB5dpG3QCfY2Mg3WPEc=;
        b=WvJfVamjMsoefPeTjzbzveTkvw+XjF5mvzbT1oEdgm47laKl/7stF26zvvUJR6JMlu
         n+Tq9lpmzyhO30eR3jaR6VCnYNgHre+f/uAvaSo+NAQ4EMuUwsxwyu81JgHfqMKQbT+R
         KLwicaDeFXFV5Ao4+j9gKf1BmbeWocA93xklcJhtjonx7V50g4bxJ0pXWZQGYHZ8Gb8M
         GgiYKifUFTfPu2hqtdZQ6swjtR8L9zaHDatosjw9TIW6LMcu1zKncrrJRsEZ9ieThw4b
         RMKK1tVtY6GvsvjL8rRyHpshfNKE2luqttzUR6G3IRF0YeYpp08WF2ZlIDhuTjQ48+b2
         QOEg==
X-Gm-Message-State: AOJu0Yzv2s2vFqPLZ1Wqejfttqooc3e8Wm/DYFk66AOFKbAOtIENXVX+
	+RZgM6gPZv5r5RExCcVK0RV3c3qV2Nt3AfLmMf3rAirxRRFs9+QkcN9XjY3F17g=
X-Google-Smtp-Source: AGHT+IH+AZTMUsb862Ep8x+r5lTFIK5YwBiR2B+KnTFT5lDKD8GJoaR17NJtWoNoqWyevW6z22BOkg==
X-Received: by 2002:a05:600c:1553:b0:412:a206:ad16 with SMTP id f19-20020a05600c155300b00412a206ad16mr4801157wmg.12.1708998118323;
        Mon, 26 Feb 2024 17:41:58 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id w15-20020a05600c474f00b004129860d532sm9827918wmo.2.2024.02.26.17.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:41:57 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 2/6] ravb: Make it clear the information relates to maximum frame size
Date: Tue, 27 Feb 2024 02:40:10 +0100
Message-ID: <20240227014014.44855-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The struct member rx_max_buf_size was added before split descriptor
support where added. It is unclear if the value describes the full skb
frame buffer or the data descriptor buffer which can be combined into a
single skb.

Rename it to make it clear it referees to the maximum frame size and can
cover multiple descriptors.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index aecc98282c7e..7f9e8b2c012a 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1059,7 +1059,7 @@ struct ravb_hw_info {
 	int stats_len;
 	size_t max_rx_len;
 	u32 tccr_mask;
-	u32 rx_max_buf_size;
+	u32 rx_max_frame_size;
 	unsigned aligned_tx: 1;
 
 	/* hardware features */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c25a80f4d3b9..3c59e2c317c7 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2684,7 +2684,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.max_rx_len = RX_BUF_SZ + RAVB_ALIGN - 1,
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
-	.rx_max_buf_size = SZ_2K,
+	.rx_max_frame_size = SZ_2K,
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2710,7 +2710,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.max_rx_len = RX_BUF_SZ + RAVB_ALIGN - 1,
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
-	.rx_max_buf_size = SZ_2K,
+	.rx_max_frame_size = SZ_2K,
 	.aligned_tx = 1,
 	.gptp = 1,
 	.nc_queues = 1,
@@ -2733,7 +2733,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.max_rx_len = RX_BUF_SZ + RAVB_ALIGN - 1,
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
-	.rx_max_buf_size = SZ_2K,
+	.rx_max_frame_size = SZ_2K,
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
 	.gptp = 1,
@@ -2758,7 +2758,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.max_rx_len = ALIGN(GBETH_RX_BUFF_MAX, RAVB_ALIGN),
 	.tccr_mask = TCCR_TSRQ0,
-	.rx_max_buf_size = SZ_8K,
+	.rx_max_frame_size = SZ_8K,
 	.aligned_tx = 1,
 	.tx_counters = 1,
 	.carrier_counters = 1,
@@ -2967,7 +2967,7 @@ static int ravb_probe(struct platform_device *pdev)
 	priv->avb_link_active_low =
 		of_property_read_bool(np, "renesas,ether-link-active-low");
 
-	ndev->max_mtu = info->rx_max_buf_size - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
+	ndev->max_mtu = info->rx_max_frame_size - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
 	ndev->min_mtu = ETH_MIN_MTU;
 
 	/* FIXME: R-Car Gen2 has 4byte alignment restriction for tx buffer
-- 
2.43.2


