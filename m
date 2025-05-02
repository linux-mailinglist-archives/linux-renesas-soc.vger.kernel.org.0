Return-Path: <linux-renesas-soc+bounces-16610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B4AA6F01
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40189C2CCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 10:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF05623C4E4;
	Fri,  2 May 2025 10:14:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9B23C4EA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 May 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180855; cv=none; b=jDHoPm9eScrfOfs6mL/uomcqKaDm6dXS3m59IMxj/EZSaUnSpGFZNzvsUSRvB4NAhBMxVHm7G5iEuJWLtZaEnMwxi+osixDxT3L8xkApkP0AR4hYTKFPZ1jTTMQG7Xp8kAWsXXbRqWxyXJeGOr4N/hVjIKoWMVFd/JTS02fM4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180855; c=relaxed/simple;
	bh=DGcEHSclD+kJNWPZG5X1Wxde27/hPuNd75cyQ4Wqsag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC2pVVInY8YqRqleqN/lKpRbdi87mZ4Ftx50A0tjxdIano4sEV/kUij7Ams0KZU+4CZsKY5ucYAnLSAGmucOYkgNavV0JR3U/KTJ2B+v8Z2RbjSmIioVyJ0sHwbiWYIhgx6O5TuCBiD8PJ77+YVlEmwrA0H0dK2XQ8BDBBqjnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:df64:35e8:502:4ac0])
	by laurent.telenet-ops.be with cmsmtp
	id kAE02E00N4sst1101AE0qF; Fri, 02 May 2025 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP1-00000000W9d-3Mts;
	Fri, 02 May 2025 12:14:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP6-00000008oWa-11ij;
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
Subject: [PATCH 06/22] spi: sh-msiof: Make words/bits unsigned in sh_msiof_spi_txrx_once()
Date: Fri,  2 May 2025 12:13:38 +0200
Message-ID: <e6ad50d9318f04a3bd5a5d4be55be8eef0c6a5b3.1746180072.git.geert+renesas@glider.be>
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

Make the words and bits parameters of sh_msiof_spi_txrx_once() unsigned,
as that matches what is passed by the caller.

This allows us to replace min_t() by the safer min().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 11ef5c0a498d7c1f..fdb13dbc175249c4 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -677,16 +677,16 @@ static int sh_msiof_spi_txrx_once(struct sh_msiof_spi_priv *p,
 				  void (*rx_fifo)(struct sh_msiof_spi_priv *,
 						  void *, int, int),
 				  const void *tx_buf, void *rx_buf,
-				  int words, int bits)
+				  unsigned int words, unsigned int bits)
 {
 	int fifo_shift;
 	int ret;
 
 	/* limit maximum word transfer to rx/tx fifo size */
 	if (tx_buf)
-		words = min_t(int, words, p->tx_fifo_size);
+		words = min(words, p->tx_fifo_size);
 	if (rx_buf)
-		words = min_t(int, words, p->rx_fifo_size);
+		words = min(words, p->rx_fifo_size);
 
 	/* the fifo contents need shifting */
 	fifo_shift = 32 - bits;
-- 
2.43.0


