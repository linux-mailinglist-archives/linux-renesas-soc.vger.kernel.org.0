Return-Path: <linux-renesas-soc+bounces-18914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9040EAED6CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 10:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94EC2189997D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 08:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994D5239573;
	Mon, 30 Jun 2025 08:13:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832FF17C220;
	Mon, 30 Jun 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271210; cv=none; b=bv6SRv+YYAfquMgfydQN309WX+GwS08WD3/CNLIZ+r4lnKyM7zTkN5cWtArJDnCN141QnVLsfSx20SoD/7+aifjf4lQTRSSC+S1dyaAjl1KmCZ3LAinhYMYzL76Y6vUHJ/uGIBK303HC7l61krQ6gWFTTJwdZWbXDMUXvE9iHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271210; c=relaxed/simple;
	bh=DB4YoTG+7ceqhcGq1mcwqGaNyc0eZjbwT2mE65xdIHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC/6zEMHL8H4TIgP0FTdnKTtV7zFzmorD9sGtl0SNl1cG20/aM+wMU3UUIDQTdcm3TEX8i5WJ27XCYKQm6+LljjIFI4AGviIrGhf5kWgpjejwgZokypDAtq7iKpjdSLf/0RTMCnQMChfwmN6Fyd3SwXV+9goTuTDfceC1T4PQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Fukrx9m0SZ6KXSvbYHxfNA==
X-CSE-MsgGUID: tVnhXkn3Qei4FVMjDPXjBw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2025 17:13:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 157D141BF1FF;
	Mon, 30 Jun 2025 17:13:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH RFC/RFT 2/2] mmc: renesas_sdhi: Enable 64-bit polling mode
Date: Mon, 30 Jun 2025 09:13:11 +0100
Message-ID: <20250630081315.33288-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable 64-bit polling mode for R-Car gen3 and RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 4b389e92399e..9e3ed0bcddd6 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -107,7 +107,8 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
-- 
2.43.0


