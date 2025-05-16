Return-Path: <linux-renesas-soc+bounces-17158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1646AB9D6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BBA173F03
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1AC7081F;
	Fri, 16 May 2025 13:32:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE63594B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402358; cv=none; b=J6dkLtkBI0SrZWKy0X0pn0+OS+SpMl6AMHjrXzKYY+iQT6wthL2S3/MxSi4iwEU1wFUkr35DvJmAfFZYU02QPa3QFthEM4x4sY4qRfRJMZ7DtejONrntZoPydPwppILHXIfQkObXbzXq8dI32fb4s1H+gOL9WS9kuB672NQyuYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402358; c=relaxed/simple;
	bh=rCkTAxu6J7MASRwBXw7XS7QLkh1LD+VQPUkTUCO6fPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC7zNSjnx6trn2gw4BWY/oO/f0In6ShASaYkgmcGYSS+gmIA8DNOeLdUEXUJaDD6bN4Mzd7UY32c0jniSmE+hMNh/AKlLyKMQoG+Tc/Uy6tyeJuE6nZtYhkarZ0RTXu+spdvpl8JobFIgcJoursXERYAghs1MztT3hF2KJyWgEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by baptiste.telenet-ops.be with cmsmtp
	id ppYY2E0013S8nz401pYYVR; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020j8-214a;
	Fri, 16 May 2025 15:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAt-00000001531-3YC4;
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
Subject: [PATCH v2 13/22] spi: sh-msiof: Correct SIMDR2_GRPMASK
Date: Fri, 16 May 2025 15:32:16 +0200
Message-ID: <ad268d67807cb7e544eddaf7a056793482a965d4.1747401908.git.geert+renesas@glider.be>
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

The Group Output Mask is not a single bit, but a bit field, containing
one bit for each of the four possible groups.  Correct the definition.

Note that this change has no direct impact, as the driver only uses
the first group.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 812e64ea5f79ce5e..57f27040b0fc78d7 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -102,7 +102,7 @@ struct sh_msiof_spi_priv {
 /* SITMDR2 and SIRMDR2 */
 #define SIMDR2_BITLEN1		GENMASK(28, 24)	/* Data Size (8-32 bits) */
 #define SIMDR2_WDLEN1		GENMASK(23, 16)	/* Word Count (1-64/256 (SH, A1))) */
-#define SIMDR2_GRPMASK1		BIT(0)		/* Group Output Mask 1 (SH, A1) */
+#define SIMDR2_GRPMASK		GENMASK(3, 0)	/* Group Output Mask 1-4 (SH, A1) */
 
 /* SITSCR and SIRSCR */
 #define SISCR_BRPS		GENMASK(12, 8)	/* Prescaler Setting (1-32) */
@@ -400,7 +400,7 @@ static void sh_msiof_spi_set_mode_regs(struct sh_msiof_spi_priv *p,
 	if (tx_buf || (p->ctlr->flags & SPI_CONTROLLER_MUST_TX))
 		sh_msiof_write(p, SITMDR2, dr2);
 	else
-		sh_msiof_write(p, SITMDR2, dr2 | SIMDR2_GRPMASK1);
+		sh_msiof_write(p, SITMDR2, dr2 | SIMDR2_GRPMASK);
 
 	if (rx_buf)
 		sh_msiof_write(p, SIRMDR2, dr2);
-- 
2.43.0


