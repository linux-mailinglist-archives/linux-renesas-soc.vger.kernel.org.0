Return-Path: <linux-renesas-soc+bounces-23080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A958BDF42B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29219505D77
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD62D6E72;
	Wed, 15 Oct 2025 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFolCHif"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFBE200110
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540448; cv=none; b=q+irjkR1++bIO/TR6BzPooZ2yl5rFE3lCVC5fdZshmX5wL/sf9bj1PjWtMYkaTOQNedjeVKHQ3BqnTN+PGkf6ymjS8LvZXQgLAnd5lnNQ8zx3NhMSWGHzVAsYbywR5A2SfG5sKvMRgwp6aTqHqWrpuHHWlmILn5NpuZ0yiv5h6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540448; c=relaxed/simple;
	bh=1ShMRdTbyDSVf7pqsdAORgM79J4ZDuzFz1jBYSkMUvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRj97iIpCPU5HI0ccME85HMWv+FR2iC76vh3CynAnl3WYewW5S+esRbf6mNCE3lXN3t80gdb4tvcEDkvkHsXS6f0Mae/R5zICdXHbJ19wvVKMQ8BB8vZKQPkmbgW9sgp34TgdfNXeJwua6VvHR5eJo/Wp7embqRpPHx3PHMA2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFolCHif; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26d0fbe238bso48385665ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540446; x=1761145246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcN7xHLFQ6AxuefucwRNxxqod6+m4WOOWIEO0t3msa8=;
        b=CFolCHif5jS0keBzaeKZcU89/jwqWYtMUxgc+rz9RhS2zEmC62u6248Dw3sEIYJsNo
         W61wBRanUZBUrhAKK92jC/mu0L1OGdAU2XWbSzK/3uWJ2Tywm/VJWrRhr9fxU/q28kOb
         6GwOiEn5JxJGdAGK2Y41dXYtlE9b400512HTmZz9t6kctKDKwwWf9sGTXIq2mHc3//0Y
         /Q/8FNc0pLFfamMOrxS8EPt/hEUXvJd2mabUQb/wWwnlNpKrAPj9xVI5QFA/VyH+QfEP
         gv2yQSmEEb6OsKtKdyAe9vOSthk86v6pYk22RV3mAIVjKOrQFcWVefUj5EjywVj/+USK
         zYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540446; x=1761145246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcN7xHLFQ6AxuefucwRNxxqod6+m4WOOWIEO0t3msa8=;
        b=IBoxoDsa+q3oXnFISajOH2luPPhKdeUxq23YfS5E8kjgzIyIlZDM8B4arBxSlCgAGp
         TuHOvrZFFSdiDrBNcrSuWgCetFbIcT107R0v3GUOkPJ/d3eFR3OeOroodB3zysbZXFzc
         yTpQ87t2L60m+iMEe2lVOjDhWpKEyNyXN2Q6DbGkvfSIUa3IppLlAzEgO4SYzw/Er1kw
         ddW5yncLwZHGZcaYpxr8RtPAJ41UjqSJn+9/hyS5wF48aB5g/k1jg8gsmJg9fZEHOQBD
         hjccwHbk4CBqRHz6KLtA+cXPXMHgK5H2lMK+0FRPiUYpQCrD0QWGVkJUTqMLvjn2FOcw
         tPlg==
X-Forwarded-Encrypted: i=1; AJvYcCU0qeCewO58vnXxQAxP2D65EF1r+KgBk3CZVIAlJ9MlED32PErjmDc4rbER52+8MuRRLTiTtvhOTMQOGpMXxV2Myg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9aJiZGg/8MMq7brfzKi3oGgi5lnAAC221gyyte3Jp45KCLKhK
	TK1oQmB5Kzq5CewqdilmJdSFOe79GpP4HpyVa+32EC8WdmUi0GgTy6BGaaXmJg==
X-Gm-Gg: ASbGncs2U1ZV7zxBwP6DtSjb01N//ezIzS6xKm3J/8cI8F2p070o3HONRC+N+LUg/cP
	/7QbjKOFbunP1lecJGHP8eJouyc1zx3aSwiSyi/stQ+AewatqPmnCBy+3Vj5CYn/ORTUv3R2iW6
	/aqtlq44mBX4M/5tn+zpvxt0QCcXHw4Au0rh2pTMND1+1JFpLQcwrbETuBUiQPHv2CB8KNvbtOq
	8xLy0Dbhd1Td3Iw1d5TOIcgxljcVeVCh8yd1D1Z6cySVeJMCWptLeTwDRJwGDLuc8cCcuTSKdd5
	HJB3J3miI88dq6qUqzZeZFyBtEdDtsSj5oufs/Pa97WRQmQ1+8iNo/2S7ET9+Qz48iaf13yBvN4
	iDJ+Vjh8lasYKLsvIWWGAbYY7HXkLrsJr8937Ra5x+bfBM6hi3mk4cVoANWfUr2c=
X-Google-Smtp-Source: AGHT+IEbg7lRhXatS+GuMWToc+DoO2Ve2zohsoo3Z0vRNjtlax1PilyTGNvxx+/BzXyTA+SajDOrNw==
X-Received: by 2002:a17:903:1b64:b0:28a:5b8b:1f6b with SMTP id d9443c01a7336-2902737c7ebmr376277035ad.21.1760540444609;
        Wed, 15 Oct 2025 08:00:44 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm199642265ad.91.2025.10.15.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:00:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] net: ravb: Make DBAT entry count configurable per-SoC
Date: Wed, 15 Oct 2025 16:00:24 +0100
Message-ID: <20251015150026.117587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The number of CDARq (Current Descriptor Address Register) registers is not
fixed to 22 across all SoC variants. For example, the GBETH implementation
uses only two entries. Hardcoding the value leads to incorrect resource
allocation on such platforms.

Pass the DBAT entry count through the per-SoC hardware info struct and use
it during probe instead of relying on a fixed constant. This ensures
correct descriptor table sizing and initialization across different SoCs.

Fixes: feab85c7ccea ("ravb: Add support for RZ/G2L SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      | 2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 7b48060c250b..d65cd83ddd16 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1017,7 +1017,6 @@ enum CSR2_BIT {
 #define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4 | \
 			  CSR2_RTCP6 | CSR2_RUDP6 | CSR2_RICMP6)
 
-#define DBAT_ENTRY_NUM	22
 #define RX_QUEUE_OFFSET	4
 #define NUM_RX_QUEUE	2
 #define NUM_TX_QUEUE	2
@@ -1062,6 +1061,7 @@ struct ravb_hw_info {
 	u32 rx_max_frame_size;
 	u32 rx_buffer_size;
 	u32 rx_desc_size;
+	u32 dbat_entry_num;
 	unsigned aligned_tx: 1;
 	unsigned coalesce_irqs:1;	/* Needs software IRQ coalescing */
 
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 9d3bd65b85ff..69d382e8757d 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2694,6 +2694,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
+	.dbat_entry_num = 22,
 	.aligned_tx = 1,
 	.gptp = 1,
 	.nc_queues = 1,
@@ -2717,6 +2718,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
+	.dbat_entry_num = 22,
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2743,6 +2745,7 @@ static const struct ravb_hw_info ravb_gen4_hw_info = {
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
+	.dbat_entry_num = 22,
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2769,6 +2772,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
+	.dbat_entry_num = 22,
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
 	.gptp = 1,
@@ -2794,6 +2798,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.rx_max_frame_size = SZ_8K,
 	.rx_buffer_size = SZ_2K,
 	.rx_desc_size = sizeof(struct ravb_rx_desc),
+	.dbat_entry_num = 2,
 	.aligned_tx = 1,
 	.coalesce_irqs = 1,
 	.tx_counters = 1,
@@ -3025,7 +3030,7 @@ static int ravb_probe(struct platform_device *pdev)
 	ravb_parse_delay_mode(np, ndev);
 
 	/* Allocate descriptor base address table */
-	priv->desc_bat_size = sizeof(struct ravb_desc) * DBAT_ENTRY_NUM;
+	priv->desc_bat_size = sizeof(struct ravb_desc) * info->dbat_entry_num;
 	priv->desc_bat = dma_alloc_coherent(ndev->dev.parent, priv->desc_bat_size,
 					    &priv->desc_bat_dma, GFP_KERNEL);
 	if (!priv->desc_bat) {
@@ -3035,7 +3040,7 @@ static int ravb_probe(struct platform_device *pdev)
 		error = -ENOMEM;
 		goto out_rpm_put;
 	}
-	for (q = RAVB_BE; q < DBAT_ENTRY_NUM; q++)
+	for (q = RAVB_BE; q < info->dbat_entry_num; q++)
 		priv->desc_bat[q].die_dt = DT_EOS;
 
 	/* Initialise HW timestamp list */
-- 
2.43.0


