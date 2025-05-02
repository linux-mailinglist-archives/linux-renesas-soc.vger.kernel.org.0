Return-Path: <linux-renesas-soc+bounces-16619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C62AA6F20
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 319A11BC6CF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 10:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27F623C4F9;
	Fri,  2 May 2025 10:14:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0F235044
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 May 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180858; cv=none; b=KjfSbjJSzQQLmXN6tfRhhI9IS7Pn9WwK9P/EzR3TvYka4v0uTo6/cQrCC7J2TL+yJAS63UW1fRiqPqHmJwe3Xg5m9BUNYhKJDXbQnWqC23ZFhIdUk4M6Vq94zoyaV75Xlb8O+hm+524zs+UFif+gexto9IWILueLw++TIuUJEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180858; c=relaxed/simple;
	bh=9b2cOjEgTnfNPoJfA5ijW1PyfAnFfzJfyNpHSsdkpMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtcgpMlszlhZEWwEk22fO8VhQCr37Go4VYmRQNMriVyCnzCkXyDIBMgIRRwMDCBf+xbUsAF7hbXSXHwB2+6weRF0smRd8UYAhd6iaPu7FBGP7K0SyJeJFTRGnLzLOyYIWQKnRt/mkON/JHvki0D1TxjX20SvlLEYUTRa9h2ns1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4Zpmwn16pcz4wxpV
	for <linux-renesas-soc@vger.kernel.org>; Fri, 02 May 2025 12:14:01 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:df64:35e8:502:4ac0])
	by baptiste.telenet-ops.be with cmsmtp
	id kAE02E00l4sst1101AE0qM; Fri, 02 May 2025 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP2-00000000WAU-10uk;
	Fri, 02 May 2025 12:14:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP6-00000008oXe-2sdb;
	Fri, 02 May 2025 12:14:00 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc: linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 19/22] spi: sh-msiof: Double maximum DMA transfer size using two groups
Date: Fri,  2 May 2025 12:13:51 +0200
Message-ID: <0158448958b5b40aff29969188684eb77ccf8116.1746180072.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746180072.git.geert+renesas@glider.be>
References: <cover.1746180072.git.geert+renesas@glider.be>
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


