Return-Path: <linux-renesas-soc+bounces-23604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 89830C09A0D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 18:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E6A7560CA9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 16:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B561A30F92C;
	Sat, 25 Oct 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUy+UCB/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B53303A1E;
	Sat, 25 Oct 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409561; cv=none; b=aviWV09AKn0cDrrwExLfxnrT/TeQWUOq3F/9TQXSxlWzrrPtVfCUEn8WcxIE+RE6pVyhYqwonnxRhT2cY1qDvhBS5iVJ4TpELymAB6RP9u8AJ4hjsDuY6RLvZsT9hnLObm3LVu75WG9ZNnG7KESHyznvhDE9h1jRrw3QRRfJhDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409561; c=relaxed/simple;
	bh=BQ6kJ+r5l4BljJZOQAa0dF0STwEonRomeRvywv/9pQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gTmF5bS4iBVt0tyWkyDfBv89maB80ISXmUDl8ylffURcAH70pvJtugoIM/NSNssDzjdLCayA1cMa65wKt1WetJj+gALmP68FjUD66P3h6AQeaosiHtUX9Gaq64ahRh/jd/LbZqSiiImz8NVcnmi9mO5ECXlUzZiDfEv0foDLjzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUy+UCB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC22C4CEFF;
	Sat, 25 Oct 2025 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409561;
	bh=BQ6kJ+r5l4BljJZOQAa0dF0STwEonRomeRvywv/9pQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUy+UCB/dKoIsv+FowbA0HAt0q9Zh6CRQNL4bvcqZKKQ7d4TbOfSh+6VSxU77naR6
	 M/djCnlHGGhSPMv1+lQ2rKA7p/V6XrYM98gG3O0QRrqvOpEBkPqEMJFtNNHObPxdRP
	 iSrfC3QiwkKEqjMTu0mxv20UuYLgxFrjvp1hBs6WPnbNKCTPv2Q/qJ865edYk0+7cN
	 l0rlOxWOhuKVYHa4Coj4+jPDnMa4/oFgwJAsuN6+gPozGRjIxubGltqu43lgirG/Vi
	 WixRD0gT8A6pGli1wQJ/5cbs4CvQ0z/ddjphiONN39l993xvkKYyvgfQ6r0LFOrPIO
	 TviydLPkil9Ww==
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
Subject: [PATCH AUTOSEL 6.17] ASoC: renesas: msiof: tidyup DMAC stop timing
Date: Sat, 25 Oct 2025 11:59:57 -0400
Message-ID: <20251025160905.3857885-366-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 25aa058b5c83a3c455a2a288bb3295c0b234f093 ]

Current DMAC is stopped before HW stop, but it might be cause of
sync error. Stop HW first.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Link: https://patch.msgid.link/878qi3yuu0.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- The bug here is a real hardware-visible problem: stopping the DMA
  engine before the MSIOF IP has actually quiesced leaves the peripheral
  still asserting frame-sync, which the driver records as
  `priv->err_syc` → FSERR warnings (and potential playback/capture
  glitches). The commit fixes the ordering so that we first wait for the
  HW disable (`msiof_update_and_wait()` to clear `SICTR_TXE/RXE` at
  `sound/soc/renesas/rcar/msiof.c:287-293`) and only then tell the DMA
  framework to shut down (`snd_dmaengine_pcm_trigger()` at
  `sound/soc/renesas/rcar/msiof.c:294`).
- Nothing else changes: interrupts are still masked first, the stop path
  remains serialized under the same spinlock, and the DMA API call is
  simply moved a few lines. That makes the fix low risk and easy to
  review, while removing the source of the frame-sync errors mentioned
  in the commit message.
- Given that the MSIOF audio driver already shipped in stable releases,
  leaving the old ordering means users continue to see spurious FSERR
  warnings and potential desynchronization when stopping streams, so
  pulling this minimal sequencing fix into stable is justified.

 sound/soc/renesas/rcar/msiof.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 3a1a6496637dd..555fdd4fb2513 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -222,9 +222,6 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 		val = SIIER_RDREQE | SIIER_RDMAE | SISTR_ERR_RX;
 	msiof_update(priv, SIIER, val, 0);
 
-	/* Stop DMAC */
-	snd_dmaengine_pcm_trigger(substream, cmd);
-
 	/* SICTR */
 	if (is_play)
 		val = SICTR_TXE;
@@ -232,6 +229,9 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 		val = SICTR_RXE;
 	msiof_update_and_wait(priv, SICTR, val, 0, 0);
 
+	/* Stop DMAC */
+	snd_dmaengine_pcm_trigger(substream, cmd);
+
 	/* indicate error status if exist */
 	if (priv->err_syc[substream->stream] ||
 	    priv->err_ovf[substream->stream] ||
-- 
2.51.0


