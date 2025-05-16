Return-Path: <linux-renesas-soc+bounces-17165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6FAB9D82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BCC61BC5778
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA17614B08A;
	Fri, 16 May 2025 13:32:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E24757EA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402366; cv=none; b=RMrYA5lFcNqNwbo/lSXyMGCkuRjAjHbffhLFHdAoKDtFiD4sJN/cau6ZagCGYrPes5wqI8hxTj7CP0bAuGUO1nWBq4cxVjYWspYR03P2MwdjNSeSx8LC68ErEq+tW8qc6oUDCAaDiSbhtiTlLiBR/fK+1q42ZTtJT8SA1qk6YwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402366; c=relaxed/simple;
	bh=WoN2M38Gq0Si4MJuTnhp6KJst1ym3ogf8jEo+hK8HI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tl83En0B3g5by/Y9IWjakN/+IYAt331AP+4giX8ejoLY7E+PsEvgxX5A0Iexb1LKXsalry8qYbDn4G2SFSQAFNQj7G2OjDMSD7JSOjtg3JqpfwrNCBr+/8eSoIYevY/j9ZpoGcHy1GYhJCku3WOnNEJz7OHDoAmg466Q50VXq1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by michel.telenet-ops.be with cmsmtp
	id ppYY2E0043S8nz406pYY0a; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020jS-2cy4;
	Fri, 16 May 2025 15:32:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAu-0000000153V-05gR;
	Fri, 16 May 2025 15:32:32 +0200
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
Subject: [PATCH v2 19/22] spi: sh-msiof: Double maximum DMA transfer size using two groups
Date: Fri, 16 May 2025 15:32:22 +0200
Message-ID: <bad522c76b8d225c195433977b22f95015cf2612.1747401908.git.geert+renesas@glider.be>
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

The maximum DMA transfer size is limited by the maximum values that can
be written to the word count fields (WDLENx) in the Transmit and Control
Data Registers (SITDR2/SIRDR2).  As all MSIOF variants support
transferring data of multiple (two or four) groups, the maximum size can
be doubled by using two groups instead of one, thus reducing setup
overhead for very large SPI transfers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on R-Car M2-W, E3, V4H, and V4M with spi-loopback-test and a
logic analyzer.

v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 2b8c143b21219521..4d9a44118e1c9d6c 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -767,10 +767,12 @@ static void sh_msiof_dma_complete(void *arg)
 }
 
 static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
-			     void *rx, unsigned int len)
+			     void *rx, unsigned int len,
+			     unsigned int max_wdlen)
 {
 	u32 ier_bits = 0;
 	struct dma_async_tx_descriptor *desc_tx = NULL, *desc_rx = NULL;
+	unsigned int words1, words2;
 	dma_cookie_t cookie;
 	int ret;
 
@@ -817,7 +819,9 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 		       FIELD_PREP(SIFCTR_RFWM, SIFCTR_RFWM_1));
 
 	/* setup msiof transfer mode registers (32-bit words) */
-	sh_msiof_spi_set_mode_regs(p, tx, rx, 32, len / 4, 0);
+	words1 = min(len / 4, max_wdlen);
+	words2 = len / 4 - words1;
+	sh_msiof_spi_set_mode_regs(p, tx, rx, 32, words1, words2);
 
 	sh_msiof_write(p, SIIER, ier_bits);
 
@@ -969,7 +973,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 		 *  DMA supports 32-bit words only, hence pack 8-bit and 16-bit
 		 *  words, with byte resp. word swapping.
 		 */
-		unsigned int l = min(round_down(len, 4), max_wdlen * 4);
+		unsigned int l = min(round_down(len, 4), 2 * max_wdlen * 4);
 
 		if (bits <= 8) {
 			copy32 = copy_bswap32;
@@ -982,7 +986,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 		if (tx_buf)
 			copy32(p->tx_dma_page, tx_buf, l / 4);
 
-		ret = sh_msiof_dma_once(p, tx_buf, rx_buf, l);
+		ret = sh_msiof_dma_once(p, tx_buf, rx_buf, l, max_wdlen);
 		if (ret == -EAGAIN) {
 			dev_warn_once(&p->pdev->dev,
 				"DMA not available, falling back to PIO\n");
-- 
2.43.0


