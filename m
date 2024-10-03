Return-Path: <linux-renesas-soc+bounces-9331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D4F98EB1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892161C21ACD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEEE131182;
	Thu,  3 Oct 2024 08:12:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5E80C13;
	Thu,  3 Oct 2024 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943120; cv=none; b=Be/JqVBZij5XmLRCH4qoRIWIns+BRiIyG8q+vViArEdCYqr3AHgh2wmrmC0Z+gqDK95WOCjsEjShiUuqoz+ty4qFWpZFgCZqtnsr48F7rbXZ4Vk+iK94ppLVmmJzIjOEQncweT7JRFbtFiXOl93YEz+CDP5eWzvtpk2B2hXFr20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943120; c=relaxed/simple;
	bh=c0aPNYyT2aNvpmd39WPTLlHVa9UHwudfGT5MHwTBIzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rpOpibbGnLBi7u+NtS39L28w6zKbA6Exj9286x7nIdX4SQ9rlCt5rETgJsbsGugQV/gbOoDobEudssnpByOu+a+BoQ3SFSWX2AMyekW9AGn4h7tGNDU6+a81fA52GxB6+Fwr7Snkr7S4omi9pSkFHGS8mXOQFaherVR5DddCEmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,173,1725289200"; 
   d="scan'208";a="220674251"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2024 17:11:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.119])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 92F2B41A1B7A;
	Thu,  3 Oct 2024 17:11:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH] ASoC: sh: rz-ssi: Use SSIFCR_FIFO_RST macro
Date: Thu,  3 Oct 2024 09:11:38 +0100
Message-ID: <20241003081140.31332-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use SSIFCR_FIFO_RST macro to make the line shorter.

Suggested-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 040ce0431fd2..6efd017aaa7f 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -311,8 +311,7 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	ssicr |= SSICR_CKDV(clk_ckdv);
 	ssicr |= SSICR_DWL(1) | SSICR_SWL(3);
 	rz_ssi_reg_writel(ssi, SSICR, ssicr);
-	rz_ssi_reg_writel(ssi, SSIFCR,
-			  (SSIFCR_AUCKE | SSIFCR_TFRST | SSIFCR_RFRST));
+	rz_ssi_reg_writel(ssi, SSIFCR, SSIFCR_AUCKE | SSIFCR_FIFO_RST);
 
 	return 0;
 }
@@ -343,8 +342,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
-	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0,
-			     SSIFCR_TFRST | SSIFCR_RFRST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
 }
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
-- 
2.43.0


