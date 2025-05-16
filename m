Return-Path: <linux-renesas-soc+bounces-17162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8FAB9D74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3243A92E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931A572637;
	Fri, 16 May 2025 13:32:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B38528E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402365; cv=none; b=NTxVuHg7Ou6RI/Go3zdpFOmMWTfBG1zgG/cBeEJzAEHy2q/jeylOYNsicLNkUP/m9VyFjBjIVuOB7BSU0+7WvOgaHJxwspbhx4WrXquucOgiwtcSYF+VQiZ8GvAlZ1Bf6WKf80ZwAAB9h4XXcd2FzSWG8osomrk5oR8NziurPZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402365; c=relaxed/simple;
	bh=sl8eYgz9s0IQIIJJMg+RvgU0Wqv5wzmfjFIixU3FWao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7YYgDmPaMXPoLvxkSylIe0LLy+EkBhDjLSDNs7+CsC91htT+qIch7Yf8UA/LyIavJasMOTZvW0qNrbBj2uh+LGoUn13dR+WwuLVNZbGaY/y5tH/XiXEfGpX4qz+fn2OcinQ9HDuWQlY/8Caqzm4mbn0w6FF+UX+mkXJBs6DvUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by xavier.telenet-ops.be with cmsmtp
	id ppYX2E00G3S8nz401pYXap; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020ia-18Mp;
	Fri, 16 May 2025 15:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAt-0000000152R-2mIN;
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
Subject: [PATCH v2 06/22] spi: sh-msiof: Make words/bits unsigned in sh_msiof_spi_txrx_once()
Date: Fri, 16 May 2025 15:32:09 +0200
Message-ID: <30eff1052642a4bcb0f1bc4bed7aae25d355a7dc.1747401908.git.geert+renesas@glider.be>
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

Make the words and bits parameters of sh_msiof_spi_txrx_once() unsigned,
as that matches what is passed by the caller.

This allows us to replace min_t() by the safer min().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
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


