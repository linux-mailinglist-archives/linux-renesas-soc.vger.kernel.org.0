Return-Path: <linux-renesas-soc+bounces-17172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2DAB9D8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF5024E5376
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED4C200A3;
	Fri, 16 May 2025 13:32:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FA7260A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402369; cv=none; b=S+8jPSmHBDw1pIlH7PZZGGcerOZSHyxokn8L61tiSRfTORfobf6gAAAPCTHxpbQc2Ardag7gK+qUBAs2tVJHeTA/rxbaufpBdWfJ+Vppx0RLUqfGlOkBaKVBj2hrgJsYqCVBmZr6thicQy8WqEhjqH7bRLkCr6gN3eFuZtCj1+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402369; c=relaxed/simple;
	bh=mvpjcX/5a0oFb846ghe+MQ7JRUNpQqkMZ0y8uI1l3Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uixmDsM9BUQorwOgVSDGI+Eo3iHD+vuc0AyrPT6UCa+IMyrHq9RMsBy1WFfZu5AXPo2SeJN9ohyIbwEQBZACdVXk2KqclA8G60ogJSo0HxWvCSgbxCtN57uqMOXCsgrjS4HBC+LBMszn4/BdDaFG1kbGfg/fmYCNkcJI69I74Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4ZzSgP4Ll4z4xBbV
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 15:32:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by albert.telenet-ops.be with cmsmtp
	id ppYX2E00B3S8nz406pYXww; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020iV-11f3;
	Fri, 16 May 2025 15:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAt-0000000152L-2erg;
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
Subject: [PATCH v2 05/22] spi: sh-msiof: Use bool for boolean flags
Date: Fri, 16 May 2025 15:32:08 +0200
Message-ID: <35cd51bdfb3c810911a5be757e0ce5bb29dcc755.1747401908.git.geert+renesas@glider.be>
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

Use bools instead of integers for boolean flags, which allows us to
remove the "!!" idiom from several expressions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 367622985fea2a04..11ef5c0a498d7c1f 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -348,11 +348,11 @@ static u32 sh_msiof_spi_get_dtdl_and_syncdl(struct sh_msiof_spi_priv *p)
 }
 
 static void sh_msiof_spi_set_pin_regs(struct sh_msiof_spi_priv *p, u32 ss,
-				      u32 cpol, u32 cpha,
-				      u32 tx_hi_z, u32 lsb_first, u32 cs_high)
+				      bool cpol, bool cpha, bool tx_hi_z,
+				      bool lsb_first, bool cs_high)
 {
+	bool edge;
 	u32 tmp;
-	int edge;
 
 	/*
 	 * CPOL CPHA     TSCKIZ RSCKIZ TEDG REDG
@@ -587,7 +587,8 @@ static int sh_msiof_prepare_message(struct spi_controller *ctlr,
 {
 	struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
 	const struct spi_device *spi = msg->spi;
-	u32 ss, cs_high;
+	bool cs_high;
+	u32 ss;
 
 	/* Configure pins before asserting CS */
 	if (spi_get_csgpiod(spi, 0)) {
@@ -595,12 +596,11 @@ static int sh_msiof_prepare_message(struct spi_controller *ctlr,
 		cs_high = p->native_cs_high;
 	} else {
 		ss = spi_get_chipselect(spi, 0);
-		cs_high = !!(spi->mode & SPI_CS_HIGH);
+		cs_high = spi->mode & SPI_CS_HIGH;
 	}
-	sh_msiof_spi_set_pin_regs(p, ss, !!(spi->mode & SPI_CPOL),
-				  !!(spi->mode & SPI_CPHA),
-				  !!(spi->mode & SPI_3WIRE),
-				  !!(spi->mode & SPI_LSB_FIRST), cs_high);
+	sh_msiof_spi_set_pin_regs(p, ss, spi->mode & SPI_CPOL,
+				  spi->mode & SPI_CPHA, spi->mode & SPI_3WIRE,
+				  spi->mode & SPI_LSB_FIRST, cs_high);
 	return 0;
 }
 
-- 
2.43.0


