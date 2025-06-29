Return-Path: <linux-renesas-soc+bounces-18899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E20AED101
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 22:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58234189407D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319591DFE22;
	Sun, 29 Jun 2025 20:39:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CDE23B60B;
	Sun, 29 Jun 2025 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751229549; cv=none; b=hxrUaFm/C5ygPaSAB24h4cgWtbS0Kyr3aeXaMDKgW0JBeOO7Vjc8sucgfE0slVO1pUOdL6rbLl83CZ88JTyOf+wdhRLaj1WfMORLA4PfUNoxScDrPV0dL2jREXKW/3tzzA9rNaAJFJPMxHYFOudMfbox0ML2zsp/zhEH3YBAMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751229549; c=relaxed/simple;
	bh=TBNhBUVlt+zuPjL0N3S1MXAlkXNvY22Sl3BPcG8RYNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzfYDn9HETUHgI81YQ9aCCEXk6dyxxueNDsqphJ9n0T7NAWdnWovqcnGII49dQu28NJHRSJJG/6iKt2XgiR2x0p95nTX4CEzC6drTN0JGRpARgyJIoPX1W3BzQbUb536OPTvzWGA2F2xkufaQOHLA5Z+Vn0B/sRRM04mtBNQHts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 81koUNO5RsSpCNLZhbno8Q==
X-CSE-MsgGUID: BbG3XodNQDSXp+neqoGXww==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2025 05:39:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E1B23401BF00;
	Mon, 30 Jun 2025 05:39:01 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
Date: Sun, 29 Jun 2025 21:38:56 +0100
Message-ID: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrong actual clock reported, if the SD clock division ratio is other
than 1:1(bits DIV[7:0] in SD_CLK_CTRL are set to 11111111).

On high speed mode, cat /sys/kernel/debug/mmc1/ios
Without the patch:
clock:          50000000 Hz
actual clock:   200000000 Hz

After the fix:
clock:          50000000 Hz
actual clock:   50000000 Hz

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
For HS400, the division ratio is 0. I don't have a board with HS400 mode
to verify the fix.

I believe for HS400 Mode,
SDnH = 800MHz
Divider 2 = 400MHz
Division ratio 0 = 400 / 2 = 200MHz

and for HS200/SDR-104
SDnH = 800 MHz
Divider 4 = 200 MHz
Division ratio 1:1 = 200MHz

Please correct me, if it is wrong.
---
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index fb8ca03f661d..a41291a28e9b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -222,7 +222,11 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~0xff;
 	}
 
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
+	clock = clk & CLK_CTL_DIV_MASK;
+	if (clock != 0xff)
+		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
 		usleep_range(10000, 11000);
 
-- 
2.43.0


