Return-Path: <linux-renesas-soc+bounces-3434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0B86FFE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 12:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13221F21AD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C313838B;
	Mon,  4 Mar 2024 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HAWt1yux"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B539AD0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550576; cv=none; b=FVcApdkt5dwAv2O1afe1F1v0TiFjlc9FyUQhgJfVqzaEY4IYfEsQt4cZZcXr09bwSle0PNjg+c19/QXxdhMZ1H9pfBvlQXIurxEvtWhASCDNJZDi+9rZoZrko54W5cXzPrcpXIvjf98t+v6p7yH6Z1nQIig2K2T5j0dBsIU6RfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550576; c=relaxed/simple;
	bh=7rvM7KHmkZqdCtn/ZmKFDkHM4BUELNr4VNeFdPCyFuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGbrIgTBxIrA8qf2F12oYcfoJE+M5WezTJ3NaW4UBUGp60Lf0wOoNlqIrrzld3W9qVo/iv2QcNHY2wBg8mQfUpeYuK8DPXprgmaU1wOiNszY87Wqa5PinrZJZJFURlzWjSUkOOVu9WFADmVh7wdwRYJNsAfoF228q/dq1QVm7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HAWt1yux; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso560833766b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2024 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709550573; x=1710155373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVPD/NxXDf57V6SzvfkkCbcoaNN8Ir/J+IyX7tMPcEg=;
        b=HAWt1yuxbct6YFxLZ30rzl92HzfQCRYbF99SswMVVgYY7XAH/m9MHfORh+Rv2wYp5X
         YjrMgqnVvLsjWh0NtKh8Qy39KYMXvtFTW0/UtOqmjtyDcLKvI9JI43T5yY60DqCKyvzv
         HluhcH4zvniYv5FQg0bTBNTrclJMiU9EabAjenC2otbnNaYWph0VkJ+a6UZCggtcHOAp
         X0iqY/91i0byWnUIF3ejiwZbzJdhkfazUKD2eTxqaAVUktSNASrgttrp5S8F4luhLu5F
         YeANklFpyuNULkdF1+Vg39rMDHKZYkpiXcaLa+LfL5ITiOY4e0Ae8w7D2bj2qL9EjMa9
         uYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550573; x=1710155373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVPD/NxXDf57V6SzvfkkCbcoaNN8Ir/J+IyX7tMPcEg=;
        b=ac0sItEhN8zk9T06gkkL/UaNfhJltEFeG1GyEvdf9vLJtWBDIGKvmvPjrj61712VhS
         DR1ae1DhabZzNbZYokFGNCSeL3E158uA+zAlLiaNWIc2haPYqbY5lewwkl9EeSfewxZ1
         dtBO2/BTEBd0Cf1Wl8x4SeMq1GYjADH3Zy+CT2zCjwEusmhCEOvGUX3gYrKBJfyeRJus
         VFbG0UcLiufYLmSiCqtQhLL3iAtA4R5KHAcDDFUmMcow4Vl99fCUCWxkLbi+A4mzYzXp
         eLZq7WjIK1sq0OQbj/YWUUhniJ0l29Y0dmXVWUuel9mbfrXR8Q5s5O5D72pd/4S69PSV
         jyJw==
X-Gm-Message-State: AOJu0YzwejMA3OpjntT6kFi8NeQh2RV/0sivI/U6BGw+li+8TihBSSq4
	y67ETXuLccSMIv9U6zPITg7WFlfFk5afB0vmvmlF4oYQHvkp3F7XCtTLM4SSLyA=
X-Google-Smtp-Source: AGHT+IGdiGiTnre7/RjRmCO+1eWWgLByHvN68vK7VO9X2uxrMkEFSS/fZJ9/qL0oGmHDLATmy0KfyA==
X-Received: by 2002:a17:906:2789:b0:a3f:bcff:18b8 with SMTP id j9-20020a170906278900b00a3fbcff18b8mr6145562ejc.27.1709550573120;
        Mon, 04 Mar 2024 03:09:33 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id v23-20020a170906565700b00a455ff77e7bsm688420ejr.88.2024.03.04.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:09:32 -0800 (PST)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [net-next,v3 2/6] ravb: Make it clear the information relates to maximum frame size
Date: Mon,  4 Mar 2024 12:08:54 +0100
Message-ID: <20240304110858.117100-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The struct member rx_max_buf_size was added before split descriptor
support was added. It is unclear if the value describes the full skb
frame buffer or the data descriptor buffer which can be combined into a
single skb.

Rename it to make it clear it referees to the maximum frame size and can
cover multiple descriptors.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
* Changes since v2
- Fix spelling in commit message.
---
 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

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
index c25a80f4d3b9..5c72b780d623 100644
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
@@ -2967,7 +2967,8 @@ static int ravb_probe(struct platform_device *pdev)
 	priv->avb_link_active_low =
 		of_property_read_bool(np, "renesas,ether-link-active-low");
 
-	ndev->max_mtu = info->rx_max_buf_size - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
+	ndev->max_mtu = info->rx_max_frame_size -
+		(ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
 	ndev->min_mtu = ETH_MIN_MTU;
 
 	/* FIXME: R-Car Gen2 has 4byte alignment restriction for tx buffer
-- 
2.44.0


