Return-Path: <linux-renesas-soc+bounces-23489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B948C00B26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51D0A5033BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12862FD69D;
	Thu, 23 Oct 2025 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW4zf9KK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F359030CDAB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218496; cv=none; b=abaBmlxEFV6s8E+zW6Cfrjof/eE+LLAypH0HPlQoJ7NmlKeHHk/pqHiPMIqgkM8a9s1YJMe6mH0DqN9FXaw0MqYcliX8LVawLoqHgR7+SMz7mf23odKY+/Zo7nDnaPW6mMqtPXr8t25E+55Maqhlwn1OQbBHfdchhm/0r62qO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218496; c=relaxed/simple;
	bh=CmjkxUl2B4gcVD2tZkJFcLi96gcIgTB3FlH827BDatg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rwhjd1Q8yQjAHx1m4um43UEHMQHPLHzDjJLETHu/bySljfsdmDhC5bjKqvWAyWEWVTdaczFyHEcXqu+/3s93gTL1XuM9prey7MnHHiOwTFezRJJjHkL4h8n1+UGPGIbtxyJfBFNTTtsrTHD3ZTY17xqqYucK0djg8C16t6VnfLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW4zf9KK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b550a522a49so518949a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761218494; x=1761823294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdknUZBEvMejmz26Y7kCdJWkxsoHQ3qjiKzOInvA+JE=;
        b=GW4zf9KKV2oPpnt9BzF5YIzmaIpApee7BNzXY2nf0u5zQ/veV+wej2ii4VvDt3C8h1
         o9uvq9tiVdxi6OPj6Zaix+cAhQ6Z/Qvv2J129lyIxKeLVtlA6uVpYNQnIMQNhgWFRQbZ
         pqq1AfGigaMwwXcFcWseIU+e730O/NM0sd9gB+1CuLruoS3E4l3MiQULKhn6z0m5W7T4
         Vudl4qaRsKuscbYi65Ea/w7e1J0cVo+R1KS3pSXoBncJH04GxAxWLML9LhY539eQl60j
         DYtJ5xDsVbWpjYetDLVXWfOf60Z6wn5x3bZ7MFTH1jZurVautlHfjOsoZrK4ln1Alt9m
         sFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218494; x=1761823294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdknUZBEvMejmz26Y7kCdJWkxsoHQ3qjiKzOInvA+JE=;
        b=SoKbVUei0esteTF9LNG428CH1XI+geLETGRZzW5E56cLAC4Ya6pibIxQbWHW8+MuM1
         nCg/ErYW+K2XPCvwiJfrFcyKJEclBR6m8+Zi8c5Tdnd7wBMtDgZC8kZnQEPZU/LohqED
         U4k0ZEWfRkLSiRrUNhTEcVE/J6VbDfxAqlQz9mt8Gu9RRPR4hX+d3kGn2ozy31xQg3QZ
         9Lh55QuMjCKBFVBSBwReIvOub+wyLhtB9myui5drJLrTrDzqMhdMTr2uGJa7o/Qkuscb
         +9bm8VmyqlERVe/udikGHvyTW1jyG2nnq27sUQ/t9aoKYsmyYBxIg4ffhgHH2L8zE8E7
         mn3w==
X-Forwarded-Encrypted: i=1; AJvYcCWoZxOMc9z4GI1Q0djbkr3kffzmBRE6ARj3Eynq6dZ1cGv289dUu9OOhfN9qfgm89wykULS+6ZDGdg6WfwcqZMr5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxszqtHWN6cRRlim2rwdgYr7ldHjOj9Q4dw4rcmK63pGqAcJwwv
	1GL4Xc7QV7ac0Rl96hqvVvEtUviHa99WPsD6Zp0a3Eoi0D3ZdNLVNeh5
X-Gm-Gg: ASbGnctoWrzX5D8uKEsj7vJXbD9+ewb8BCkpWQfi8NU54y24GEVbSTTLzyKCb6JCLCL
	fsRKb3QM+qTjcz/PYDxJucEK+Y0H0twPuVyos9ioOWmI0ZwVjr+UN2PNZqYd5wvgV2ohxvP1a9y
	wl7A42/4jD8296OgRvS13Lxueuc4/WCJFOEfwCTcMs3vNYohfnnoB2qN/QwPQn6Tsf/QIkqOgkL
	cDOXle50OxkZQBWqj6IcBuHptwqY0bEtb/URxDbLquBLZmTW3jFiDtLLcBxjyWbtwe8F9NQ2X+V
	8YZO+ppMquwiLL6zxb281KhHmjuuuGBlnKWofEndEk6VRR95CltTlGZ7ULKc+CtVyFglUVLF0a5
	wrkIa3K6xTA8jsOhy/N77k1kzqYItjTm+5tzqmkE7quPoeqRsvgRzkiQbT4MW/+nXqU+xhNsaLA
	UkkT6ZiflIv213jd2AoixFR9LqV467kQ==
X-Google-Smtp-Source: AGHT+IHhR2GItXtV6WNlADwI9HrIc3aHaXMzVFncN4DWgVReWJcQFzyOQdmWPBHS+USEe+R+b9Z10w==
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-290c9c93abbmr268228055ad.2.1761218494270;
        Thu, 23 Oct 2025 04:21:34 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dded613sm20226885ad.37.2025.10.23.04.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:21:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v3 1/2] net: ravb: Make DBAT entry count configurable per-SoC
Date: Thu, 23 Oct 2025 12:21:10 +0100
Message-ID: <20251023112111.215198-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023112111.215198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023112111.215198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid wasting coherent DMA memory by allocating the descriptor base
address table sized for the actual number of DBAT/CDARq entries supported
by the SoC. Some platforms (for example GBETH) only provide two CDARq
entries; previously the driver always allocated space for 22 entries which
needlessly consumed memory on those systems.

Pass the per-SoC dbat_entry_num via struct ravb_hw_info and use it for
allocation and initialization in probe. This sizes the table correctly and
removes the unnecessary memory overhead on SoCs with fewer DBAT entries.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2->v3:
- Reworded commit message for clarity.

v1->v2:
- Added Reviewed-by tag from Niklas.
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


