Return-Path: <linux-renesas-soc+bounces-11979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE8A074F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71051883372
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 11:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD09A2165FD;
	Thu,  9 Jan 2025 11:42:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99B8215067;
	Thu,  9 Jan 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422958; cv=none; b=LaXQyu9LTDNCevWeG8irshNxThYiedQybC9wzZJjJo829u0qG0g2/3+u9dxQEcNk+oxdsieoa3vaXvbCkuILFGCgD7Su6OVNTGApkYtitO9GmCMqIO6/Z7fh1xc0NUvF0tPmliR6Ev/Dyt/thOCz6sP+x83MLHdNSb7E4Bmsqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422958; c=relaxed/simple;
	bh=USR4PVwTYG3432lntFTYhO0xwpHFWkFq6BDSSjNpIos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bGK7EX7LrBjbbLeaI+otqEG1qkZ6Q5h0cG+yEVi5dWVG/cTy05LW9RgMtRuhSPLTVIZQqWNlPyd7YH2BgIbizpNE8mE0STQhol+MmpLe8d5BVXpeCTAehS4z8GH5FtTFtyVJFa3+QxZH7UMcy8ut6ADKUkSZScg0MHsxFzUt6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VAAPwRX+Sle4kpX4xv/Vww==
X-CSE-MsgGUID: 7v30XDinQH6WwUr/oeUYcA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jan 2025 20:37:25 +0900
Received: from dev0.. (unknown [10.226.93.133])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4551841F46A4;
	Thu,  9 Jan 2025 20:37:14 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Simon Horman <horms@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net PATCH] net: ravb: Fix max TX frame size for RZ/V2M
Date: Thu,  9 Jan 2025 11:37:06 +0000
Message-Id: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When tx_max_frame_size was added to struct ravb_hw_info, no value was
set in ravb_rzv2m_hw_info so the default value of zero was used.

The maximum MTU is set by subtracting from tx_max_frame_size to allow
space for headers and frame checksums. As ndev->max_mtu is unsigned,
this subtraction wraps around leading to a ridiculously large positive
value that is obviously incorrect.

Before tx_max_frame_size was introduced, the maximum MTU was based on
rx_max_frame_size. So, we can restore the correct maximum MTU by copying
the rx_max_frame_size value into tx_max_frame_size for RZ/V2M.

Fixes: 1d63864299ca ("net: ravb: Fix maximum TX frame size for GbEth devices")
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ac0f093f647a..bc395294a32d 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2763,6 +2763,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
+	.tx_max_frame_size = SZ_2K,
 	.rx_max_frame_size = SZ_2K,
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),

base-commit: 2d2d4f60ed266a8f340a721102d035252606980b
-- 
2.39.5


