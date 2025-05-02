Return-Path: <linux-renesas-soc+bounces-16618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE1AA6F1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494324C1752
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 10:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E601023C4E3;
	Fri,  2 May 2025 10:14:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD223C502
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 May 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180857; cv=none; b=uT6JxO3Id0BiR/6Tb4xxSdElgQglZtYwpw5G0yVX7ownyYLs5aUsDzH7HGT4y6hMLrKMLILaPigx9YPsfmHWMaGwbSW5AJab0WRED5acQ+0ye441Ueq0ti/3wAwR2LwHnLByEcQvk2meR5tXgzbYwjvX6C3BR0VXQgo1L/kC3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180857; c=relaxed/simple;
	bh=pPkxHyxzgVnNz94jXNfCI3oslM6saAE0IgHaAuXWO8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LT1ENKt1N4+n+lY0HnGIdjsl3GUrudXfnIGZk8+RPYtU0QjQEEuV7uSF4WgOd0BRsqAvSccU/2B8nK5csvqu/5yJWl0Hh5GqVEHQit+hFGe4ewL0d0ZqHnPMBJM/8w3PVmYFxwapbuuarQRBxmjnkoPVU6cn2yElzjYe4/fpq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:df64:35e8:502:4ac0])
	by laurent.telenet-ops.be with cmsmtp
	id kAE02E00v4sst1101AE0qN; Fri, 02 May 2025 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP2-00000000WA2-02Qm;
	Fri, 02 May 2025 12:14:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP6-00000008oX4-1syx;
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
Subject: [PATCH 12/22] spi: sh-msiof: SIFCTR bitfield conversion
Date: Fri,  2 May 2025 12:13:44 +0200
Message-ID: <441f6f02818513a3bc99b1bb00afebe92c4ea316.1746180072.git.geert+renesas@glider.be>
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

Convert MSIOF FIFO Control Register field accesses to use the
FIELD_PREP() bitfield access macro.

This gets rid of explicit shifts and custom field preparation macros.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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


