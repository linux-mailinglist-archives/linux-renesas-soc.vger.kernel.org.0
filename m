Return-Path: <linux-renesas-soc+bounces-17174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6489EAB9D8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0EDB4E1F6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B456414AD2B;
	Fri, 16 May 2025 13:32:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F013AD3F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402369; cv=none; b=HUGYEnrto2x+5++McMy/qGrndtgMnl7lBrfFp/c1qRA/WjJZ/Fq7dL04t/C8Q/THDKtHl2skC4IEevQkTiEEXx2q70/S+lxS26imE8AGOTS+2VHW5zn5lVvztUbGrJmiSoMKftOmYfx3j/To92Ff1lPoH8M2wDyzBJaElAn67FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402369; c=relaxed/simple;
	bh=jD6XtA8XgM/D8YRuIgXAFuZqXVe438Y/vyjn/j/fC3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dd0MRxv53Wo25xA/A4JyIHOZuxi92g/pitI5H8CZZent+Zadr7dtUFlsYcIFO8/jHFu6qrLsgoh6zRqQm7dDnRSn6SWMZclLdp4DspDt5xjwOvv9+g9TjWrFYSuPKUUaaCX49YvfETYe+15/cHdxoYg1H1fX3d6YYjR8Rv4eKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZzSgX5Mwbz4x3wd
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 15:32:40 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by andre.telenet-ops.be with cmsmtp
	id ppYX2E00H3S8nz401pYYf3; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020j3-1pOs;
	Fri, 16 May 2025 15:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAt-0000000152w-3REM;
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
Subject: [PATCH v2 12/22] spi: sh-msiof: SIFCTR bitfield conversion
Date: Fri, 16 May 2025 15:32:15 +0200
Message-ID: <0bf4c366381a8999c9755285272897300852bc18.1747401908.git.geert+renesas@glider.be>
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

Convert MSIOF FIFO Control Register field accesses to use the
FIELD_PREP() bitfield access macro.

This gets rid of explicit shifts and custom field preparation macros.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 48 ++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 4f582ecc524fe5fa..812e64ea5f79ce5e 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -135,30 +135,26 @@ struct sh_msiof_spi_priv {
 #define SICTR_RXRST		BIT(0)		/* Receive Reset */
 
 /* SIFCTR */
-#define SIFCTR_TFWM_MASK	GENMASK(31, 29)	/* Transmit FIFO Watermark */
-#define SIFCTR_TFWM_64		(0UL << 29)	/*  Transfer Request when 64 empty stages */
-#define SIFCTR_TFWM_32		(1UL << 29)	/*  Transfer Request when 32 empty stages */
-#define SIFCTR_TFWM_24		(2UL << 29)	/*  Transfer Request when 24 empty stages */
-#define SIFCTR_TFWM_16		(3UL << 29)	/*  Transfer Request when 16 empty stages */
-#define SIFCTR_TFWM_12		(4UL << 29)	/*  Transfer Request when 12 empty stages */
-#define SIFCTR_TFWM_8		(5UL << 29)	/*  Transfer Request when 8 empty stages */
-#define SIFCTR_TFWM_4		(6UL << 29)	/*  Transfer Request when 4 empty stages */
-#define SIFCTR_TFWM_1		(7UL << 29)	/*  Transfer Request when 1 empty stage */
-#define SIFCTR_TFUA_MASK	GENMASK(26, 20) /* Transmit FIFO Usable Area */
-#define SIFCTR_TFUA_SHIFT	20
-#define SIFCTR_TFUA(i)		((i) << SIFCTR_TFUA_SHIFT)
-#define SIFCTR_RFWM_MASK	GENMASK(15, 13)	/* Receive FIFO Watermark */
-#define SIFCTR_RFWM_1		(0 << 13)	/*  Transfer Request when 1 valid stages */
-#define SIFCTR_RFWM_4		(1 << 13)	/*  Transfer Request when 4 valid stages */
-#define SIFCTR_RFWM_8		(2 << 13)	/*  Transfer Request when 8 valid stages */
-#define SIFCTR_RFWM_16		(3 << 13)	/*  Transfer Request when 16 valid stages */
-#define SIFCTR_RFWM_32		(4 << 13)	/*  Transfer Request when 32 valid stages */
-#define SIFCTR_RFWM_64		(5 << 13)	/*  Transfer Request when 64 valid stages */
-#define SIFCTR_RFWM_128		(6 << 13)	/*  Transfer Request when 128 valid stages */
-#define SIFCTR_RFWM_256		(7 << 13)	/*  Transfer Request when 256 valid stages */
-#define SIFCTR_RFUA_MASK	GENMASK(12, 4)	/* Receive FIFO Usable Area (0x40 = full) */
-#define SIFCTR_RFUA_SHIFT	4
-#define SIFCTR_RFUA(i)		((i) << SIFCTR_RFUA_SHIFT)
+#define SIFCTR_TFWM		GENMASK(31, 29)	/* Transmit FIFO Watermark */
+#define SIFCTR_TFWM_64		0U		/*  Transfer Request when 64 empty stages */
+#define SIFCTR_TFWM_32		1U		/*  Transfer Request when 32 empty stages */
+#define SIFCTR_TFWM_24		2U		/*  Transfer Request when 24 empty stages */
+#define SIFCTR_TFWM_16		3U		/*  Transfer Request when 16 empty stages */
+#define SIFCTR_TFWM_12		4U		/*  Transfer Request when 12 empty stages */
+#define SIFCTR_TFWM_8		5U		/*  Transfer Request when 8 empty stages */
+#define SIFCTR_TFWM_4		6U		/*  Transfer Request when 4 empty stages */
+#define SIFCTR_TFWM_1		7U		/*  Transfer Request when 1 empty stage */
+#define SIFCTR_TFUA		GENMASK(26, 20) /* Transmit FIFO Usable Area */
+#define SIFCTR_RFWM		GENMASK(15, 13)	/* Receive FIFO Watermark */
+#define SIFCTR_RFWM_1		0U		/*  Transfer Request when 1 valid stages */
+#define SIFCTR_RFWM_4		1U		/*  Transfer Request when 4 valid stages */
+#define SIFCTR_RFWM_8		2U		/*  Transfer Request when 8 valid stages */
+#define SIFCTR_RFWM_16		3U		/*  Transfer Request when 16 valid stages */
+#define SIFCTR_RFWM_32		4U		/*  Transfer Request when 32 valid stages */
+#define SIFCTR_RFWM_64		5U		/*  Transfer Request when 64 valid stages */
+#define SIFCTR_RFWM_128		6U		/*  Transfer Request when 128 valid stages */
+#define SIFCTR_RFWM_256		7U		/*  Transfer Request when 256 valid stages */
+#define SIFCTR_RFUA		GENMASK(12, 4)	/* Receive FIFO Usable Area (0x40 = full) */
 
 /* SISTR */
 #define SISTR_TFEMP		BIT(29) /* Transmit FIFO Empty */
@@ -811,7 +807,9 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 	}
 
 	/* 1 stage FIFO watermarks for DMA */
-	sh_msiof_write(p, SIFCTR, SIFCTR_TFWM_1 | SIFCTR_RFWM_1);
+	sh_msiof_write(p, SIFCTR,
+		       FIELD_PREP(SIFCTR_TFWM, SIFCTR_TFWM_1) |
+		       FIELD_PREP(SIFCTR_RFWM, SIFCTR_RFWM_1));
 
 	/* setup msiof transfer mode registers (32-bit words) */
 	sh_msiof_spi_set_mode_regs(p, tx, rx, 32, len / 4);
-- 
2.43.0


