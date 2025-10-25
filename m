Return-Path: <linux-renesas-soc+bounces-23601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F7C09872
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 18:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B76CF4FD42D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 16:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAB0306B3D;
	Sat, 25 Oct 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB13BFUK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30659305064;
	Sat, 25 Oct 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409109; cv=none; b=gch3Tn3MIgmfPhEZYdkyoynkUjWXsPBSft95QVDwN2sCn7WF88WM7qzdHj05/2KOaqHZ63lRZi4DIukghnwBcFQeNA5pVxV79hcB2GTTuHXXEFbmZmAwyWeZBf2gMNwkgFRAP7pOL+j2+MKTqf6449VuMorml0yLP0CUa6FobiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409109; c=relaxed/simple;
	bh=UmjLBIMo297mlHy5Lg5DBUD41MemmPaPdND9FNRs8m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlXXaQ1j+d7uakCJbHVIgI36FNo/L0kFxnrgo5+6OWmvX8ZRkCsuPtQKrqU91um9U/6DY2qQvTkyRvDx/Rwfo+ZgGQySsXwXpC+Rw0wuM68+PRBt7xi18O74Q0ipcqr2fUSHoVy02jaGJK0+E9xW0b7ghhqufEftkvc3KJQHhMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB13BFUK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE27FC113D0;
	Sat, 25 Oct 2025 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409109;
	bh=UmjLBIMo297mlHy5Lg5DBUD41MemmPaPdND9FNRs8m4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dB13BFUKvgZbQU8uQ3L2hM6m+eaD3+h0sjJF89jBKezrECuFTqXwhgPn/FpXaJa/e
	 Wb8FROJjgUI3UjSXh8vbfklF4wxGC2GUkRVZeCOpVOOqPhgZokVH9OAfa3HhCtweNQ
	 NBwjCudqzLXn6jFXOmu5M0VTs3FnxwagkVKyb5+S3FLYG+xX4rs9EAz0Ik88nhWybV
	 PhjG1JPVfxh0b63Ti0HiAQS1eW38dJ7OGvRPOLKC7FBQdQH0pLyCBxVarwksu3AAdN
	 O+RpCKcgDARAPtoeLe1JBcBGDdr7mhRtWe2u1l5BxLvO9V0qgUOa/Ft08Ixw4OXgzZ
	 c9qPxnb7C5RXw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] ASoC: renesas: msiof: set SIFCTR register
Date: Sat, 25 Oct 2025 11:57:14 -0400
Message-ID: <20251025160905.3857885-203-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 130947b4681c515a5e5a7961244b502de2de85ca ]

Because it uses DMAC, we would like to transfer data if there is any data.
Set SIFCTR for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Link: https://patch.msgid.link/87bjmzyuub.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES.
- `msiof_hw_start()` now programs the FIFO control register so the DMA
  engine is serviced as soon as a slot is free/filled
  (`sound/soc/renesas/rcar/msiof.c:193`). Before this change the driver
  never touched `SIFCTR`, so the block stayed at its reset defaults. Per
  the register definition (`include/linux/spi/sh_msiof.h:79`), the
  transmit watermark defaults to `SIFCTR_TFWM_64`, i.e. DMA requests
  only happen when 64 stages are empty. With the audio engine using DMA
  (`snd_dmaengine_pcm_trigger()` just above), the FIFO never asserts
  TDREQ until it is completely drained, which produces repeatable
  playback underruns/recording stalls on real hardware.
- The fix mirrors the existing SPI driver, which already forces both
  watermarks down to one stage when DMA is used (`drivers/spi/spi-sh-
  msiof.c:694`), so this corrects an obvious omission in the newly added
  ASoC driver.
- The patch is tiny, contained to one function, and uses
  `msiof_update()` to touch only the relevant bits so it does not
  disturb other ongoing streams. No API/ABI changes and no dependency on
  later clean-ups.
Given the driver first shipped in v6.16, every stable tree that includes
it inherits this DMA-handshake bug; backporting this commit is low-risk
and restores correct audio streaming.

 sound/soc/renesas/rcar/msiof.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 555fdd4fb2513..ede0211daacba 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -185,6 +185,12 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		msiof_write(priv, SIRMDR3, val);
 	}
 
+	/* SIFCTR */
+	if (is_play)
+		msiof_update(priv, SIFCTR, SIFCTR_TFWM, FIELD_PREP(SIFCTR_TFWM, SIFCTR_TFWM_1));
+	else
+		msiof_update(priv, SIFCTR, SIFCTR_RFWM, FIELD_PREP(SIFCTR_RFWM, SIFCTR_RFWM_1));
+
 	/* SIIER */
 	if (is_play)
 		val = SIIER_TDREQE | SIIER_TDMAE | SISTR_ERR_TX;
-- 
2.51.0


