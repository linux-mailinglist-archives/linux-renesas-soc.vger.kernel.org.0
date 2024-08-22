Return-Path: <linux-renesas-soc+bounces-8034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3A95B8D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 16:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB415B24301
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 14:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370131CC8AD;
	Thu, 22 Aug 2024 14:46:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D691CC15E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724337961; cv=none; b=nSKIcfjHwkwScqrN7DEt2cbvwsPRVkKUTHmiw8u8wWKVsEWpmRoDgryFMIeDZrRMZEu0eZTX0GAICl/upW2ILFmm6kpGNm9k8vR9hIc5FfhBi5X6t2bXxxBiPiuwaKjkNrs/iu+yrdhMCYLQ1WGkeqU+Khm4LFkys8J/YIwCKf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724337961; c=relaxed/simple;
	bh=AAmtBA70Uxh9cNNgzx/Ccict1eX3aqCNeVcFbATe7uE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fS3A6QVY9qJYHtDAsJfaIXIADEgZb0Zc5vyk1txL7EoA9tZp9aFFlPaXFRm2sOcMe9lgJMaYTxnHelIReTOsl1CTG/kqvhY50vFpXLJ7Ur1y9cuRCxtMFxRaOsAxIBhh8e+MRMznFKtiDJ1ttgx2VCJnAmwXEw0XK8Wow0fKSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b715:df75:a074:20c4])
	by michel.telenet-ops.be with bizsmtp
	id 32lv2D00C47lA2T062lvVR; Thu, 22 Aug 2024 16:45:56 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh94S-000Vyf-S8;
	Thu, 22 Aug 2024 16:45:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh94V-002hxb-2e;
	Thu, 22 Aug 2024 16:45:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Chris Brandt <chris.brandt@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: riic: Simplify unsupported bus speed handling
Date: Thu, 22 Aug 2024 16:45:54 +0200
Message-Id: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify checking for unsupported bus speeds and reporting errors by
factoring out the calculation of the maximum bus speed, and by using the
dev_err_probe() helper.

While at it, use "%u" for u32, and improve the error message.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/i2c-riic.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index a6996f3c17110dd7..c7f3a4c02470238c 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -316,16 +316,13 @@ static int riic_init_hw(struct riic_dev *riic)
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
 	bool fast_mode_plus = riic->info->fast_mode_plus;
+	u32 max_freq = fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ
+				      : I2C_MAX_FAST_MODE_FREQ;
 
-	if ((!fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
-	    (fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
-		dev_err(&riic->adapter.dev,
-			"unsupported bus speed (%dHz). %d max\n",
-			t->bus_freq_hz,
-			fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
-					 I2C_MAX_FAST_MODE_FREQ);
-		return -EINVAL;
-	}
+	if (t->bus_freq_hz > max_freq)
+		return dev_err_probe(&riic->adapter.dev, -EINVAL,
+				     "unsupported bus speed %uHz (%u max)\n",
+				     t->bus_freq_hz, max_freq);
 
 	rate = clk_get_rate(riic->clk);
 
-- 
2.34.1


