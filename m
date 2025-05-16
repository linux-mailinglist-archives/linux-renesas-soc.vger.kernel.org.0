Return-Path: <linux-renesas-soc+bounces-17176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E934AAB9DA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 15:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9483B3DF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 13:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D1172625;
	Fri, 16 May 2025 13:38:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4912B73
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402694; cv=none; b=EvyMUl/0bZwTpHse2lv0WUD16+e7ST5d6H7L0ZLgv2qN6S59Hjon/PJ4WpwL7gEXCasBCQeJ588DmZCOmsKAsVfG0pYrpwb73O92doapL2vYiZsw71CcQSgPphsa++pJYK6DZSMSjuJyEMlJCXgz/GFUu8PugSLZq/SX6MWKwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402694; c=relaxed/simple;
	bh=6u9qP4p/k120mz1GOGuRUINaz60Y8hyt8cE4KpTLTuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ks/ouuVeyMI8gOOquMaC/D/JD/Sqs2qhYPIquSND4Dc/ZpHi6RCbJ1RH8/27stL0PMX+WScvvL8gv57GPiR8RplFB+4CPLpPUHuGzDcXUHl5X0D6Ywo56cmlkJl+h6Hpm9GKosSWi0BOJaMjPlQcgaITcaUql6HeqtR2mbPkBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4ZzSgP34y4z4x72P
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 15:32:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by andre.telenet-ops.be with cmsmtp
	id ppYY2E0063S8nz401pYYf5; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020jY-2jCs;
	Fri, 16 May 2025 15:32:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAu-0000000153a-0BbA;
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
Subject: [PATCH v2 20/22] spi: sh-msiof: Document frame start sync pulse mode
Date: Fri, 16 May 2025 15:32:23 +0200
Message-ID: <3d3acaab4a4125106a0655d28c09c050341c5eeb.1747401908.git.geert+renesas@glider.be>
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

Unused, but nice to have it documented.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 4d9a44118e1c9d6c..5d9d551dbd220389 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -86,6 +86,7 @@ struct sh_msiof_spi_priv {
 /* SITMDR1 and SIRMDR1 */
 #define SIMDR1_TRMD		BIT(31)		/* Transfer Mode (1 = Master mode) */
 #define SIMDR1_SYNCMD		GENMASK(29, 28)	/* SYNC Mode */
+#define SIMDR1_SYNCMD_PULSE	0U		/*   Frame start sync pulse */
 #define SIMDR1_SYNCMD_SPI	2U		/*   Level mode/SPI */
 #define SIMDR1_SYNCMD_LR	3U		/*   L/R mode */
 #define SIMDR1_SYNCAC		BIT(25)		/* Sync Polarity (1 = Active-low) */
-- 
2.43.0


