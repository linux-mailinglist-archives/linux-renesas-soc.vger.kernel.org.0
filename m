Return-Path: <linux-renesas-soc+bounces-17156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1036BAB9D68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E838F1B63590
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BAA4501A;
	Fri, 16 May 2025 13:32:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A72224CC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402357; cv=none; b=JdkQZKopH2O9vxXs2bRlovIlv0hxghigiqMFv4Xe5Pha9COzEnn44tyVskhZPMxqobLClKyYhVm13CYoWUQrYvHUXcu/LX0KA8V+jmrBPtH7hblHivEsbM3qkMTiOyBzfmEdWjfpidg9BeAvOz1Qf8QGIrKZUY/jN02HDJwJkfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402357; c=relaxed/simple;
	bh=rlxaipIiTjn83vgWbiFthC6xe8kAEhAOpOWEF1HAztU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFX01XISG8jMAzlJ0LYbfLHMrj/q9rBDGOi2EWaUd3lOBK0+m4H2xXxIDXpek6ZO6lB1Ab959xGpRY3f8TZlza0u2N6l93grhyhppRKT2G0jRv4cb+nD2F3iiX0rpKaSPVM9bbSmoWbA+wAzU1g2aGKQXq3Loqp8cURKP6TlovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by baptiste.telenet-ops.be with cmsmtp
	id ppYY2E0023S8nz401pYYVS; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020jF-2E31;
	Fri, 16 May 2025 15:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAt-0000000153B-3rvy;
	Fri, 16 May 2025 15:32:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 15/22] spi: sh-msiof: Correct RX FIFO size for R-Car Gen2
Date: Fri, 16 May 2025 15:32:18 +0200
Message-ID: <fd11933f932df81d84f417a21e2179bd4fdcfdc1.1747401908.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747401908.git.geert+renesas@glider.be>
References: <cover.1747401908.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Renesas Technical Updates TN-RCS-S068A/E, the MSIOF receive
FIFOs on R-Car Gen2 SoCs have room for 128 words of 32 bits.

Note that this change has no actual impact on the behavior of the
driver, as SPI_CONTROLLER_MUST_TX is set, and transfer size is currenty
limited to the minimum of the transmit and receive FIFO sizes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index ea9277ab87f66cd5..8d18a26128d600f6 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1099,7 +1099,7 @@ static const struct sh_msiof_chipdata rcar_gen2_data = {
 	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
 			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
 	.tx_fifo_size = 64,
-	.rx_fifo_size = 64,
+	.rx_fifo_size = 128,
 	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
 	.min_div_pow = 0,
 };
-- 
2.43.0


