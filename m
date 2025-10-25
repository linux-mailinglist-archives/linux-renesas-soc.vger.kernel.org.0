Return-Path: <linux-renesas-soc+bounces-23602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476BC0968C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 18:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5997234E53B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 16:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCCD30F80B;
	Sat, 25 Oct 2025 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5qjZ11I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E180307AD4;
	Sat, 25 Oct 2025 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409199; cv=none; b=kRXRCwSx+fn7vVQm2rfmtp2MvSgeORL6gpUNvRywaCCkQJtX0HOIKvc29PMMgtTI0+7wubKbAta48ajykzKmtPdA/gUElY0qlyFW3oXWT3zqW3b8VnzlWBcNi+WIxwN7UMQsYZ+YrN1AJwEzR1l1BmKfjkIf906d+heabZxbqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409199; c=relaxed/simple;
	bh=tlFGWlbofj8Y5mA4QVtuR6zl8CZuuqNUOHeT46Qm3A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7C1mmtxRCzFv9heK15k2l1uC4tq3rQPC2RMlG9e55Xuc2DUpD519ql6N3Oa2Ia8lGngdIRZfI5CRdrY+cCu7GwhROzDPV+J6bya5PTAT0RMIdQVBTtXKTpBcikgBwwtg18AKvcC/h5jNnnJw/6Y5CNVRsnrcoxbub4NV1PNsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5qjZ11I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C08C4CEFF;
	Sat, 25 Oct 2025 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409199;
	bh=tlFGWlbofj8Y5mA4QVtuR6zl8CZuuqNUOHeT46Qm3A8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D5qjZ11I86aZpnCyndmpukP71D+77ZDs74ww0nZsK99jYUKMLD0rY4int363EBePP
	 Ke+zE4xPtoxpImz7xz4X5IWsB/eP3j1Hf2cN7s15rbZkW42dzJZDbS977jrwYsjSeK
	 5dPk8PWPZJ/Y0UfHAjAAPPqf7SY2EJ+/CMwR+eIG9o/vtjhNgoYF23i3M0HpGi1Csv
	 NWAOUohg6/Y859wtKTMjgShf3I0oNfQwKlgIvN21Qg+H5bCx1AE2xCWsI7IOSHcrp3
	 Axtg/ltg0JWy0lCKnx+qaYcb8BWjCrOKcJO1mYzjXa+zctA2lnmTrGSAG1dKJtEf1e
	 ebyEJG3hSWGew==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] ASoC: renesas: msiof: use reset controller
Date: Sat, 25 Oct 2025 11:57:52 -0400
Message-ID: <20251025160905.3857885-241-sashal@kernel.org>
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

[ Upstream commit 25226abc1affd4bf4f6dd415d475b76e7a273fa8 ]

MSIOF has TXRST/RXRST to reset FIFO, but it shouldn't be used during SYNC
signal was asserted, because it will be cause of HW issue.

When MSIOF is used as Sound driver, this driver is assuming it is used as
clock consumer mode (= Codec is clock provider). This means, it can't
control SYNC signal by itself.

We need to use SW reset (= reset_control_xxx()) instead of TXRST/RXRST.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Link: https://patch.msgid.link/87cy7fyuug.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES — The change should go to stable. The MSIOF audio block needs its
FIFOs cleared between runs, but the on-IP `TXRST/RXRST` bits cannot be
touched while SYNC is asserted, which is exactly the situation for
clock-consumer audio links; the original driver therefore has no safe
way to recover from prior transfers and will hit the documented HW
issue. The patch switches the driver to the module reset line, gated by
a local user-count, so the FIFOs are flushed without touching the
fragile in-block resets.

Key pieces:
- `sound/soc/renesas/rcar/msiof.c:112-121` adds a reset-controller
  handle plus a stream user counter so the module reset can be shared by
  playback and capture safely.
- `msiof_hw_start()` now drops the module reset on the first active
  stream (`sound/soc/renesas/rcar/msiof.c:189-207`), guaranteeing the
  hardware starts from a clean state without poking the unsafe FIFO
  reset bits.
- `msiof_hw_stop()` balances that by re-asserting the reset once the
  last stream stops (`sound/soc/renesas/rcar/msiof.c:316-319`), ensuring
  the block is quiesced even if the codec keeps SYNC running.
- `msiof_probe()` acquires the reset line and asserts it at probe
  (`sound/soc/renesas/rcar/msiof.c:587-599`), aligning the power-on
  state with the new sequencing.

The change is confined to the new MSIOF sound driver, depends only on
the already-required DT `resets` property (verified in the binding), and
doesn’t alter wider ASoC infrastructure. Given it fixes a real hardware
malfunction and carries low regression risk, it is a solid stable
backport candidate.

 sound/soc/renesas/rcar/msiof.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 7a9ecc73231a8..3a1a6496637dd 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -24,12 +24,25 @@
  * Clock/Frame Consumer Mode.
  */
 
+/*
+ * [NOTE-RESET]
+ *
+ * MSIOF has TXRST/RXRST to reset FIFO, but it shouldn't be used during SYNC signal was asserted,
+ * because it will be cause of HW issue.
+ *
+ * When MSIOF is used as Sound driver, this driver is assuming it is used as clock consumer mode
+ * (= Codec is clock provider). This means, it can't control SYNC signal by itself.
+ *
+ * We need to use SW reset (= reset_control_xxx()) instead of TXRST/RXRST.
+ */
+
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/spi/sh_msiof.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/soc.h>
@@ -61,10 +74,13 @@
 struct msiof_priv {
 	struct device *dev;
 	struct snd_pcm_substream *substream[SNDRV_PCM_STREAM_LAST + 1];
+	struct reset_control *reset;
 	spinlock_t lock;
 	void __iomem *base;
 	resource_size_t phy_addr;
 
+	int count;
+
 	/* for error */
 	int err_syc[SNDRV_PCM_STREAM_LAST + 1];
 	int err_ovf[SNDRV_PCM_STREAM_LAST + 1];
@@ -126,6 +142,16 @@ static int msiof_hw_start(struct snd_soc_component *component,
 	 *	RX: Fig 109.15
 	 */
 
+	/*
+	 * Use reset_control_xx() instead of TXRST/RXRST.
+	 * see
+	 *	[NOTE-RESET]
+	 */
+	if (!priv->count)
+		reset_control_deassert(priv->reset);
+
+	priv->count++;
+
 	/* reset errors */
 	priv->err_syc[substream->stream] =
 	priv->err_ovf[substream->stream] =
@@ -144,7 +170,6 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
 		msiof_write(priv, SITMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
 		msiof_write(priv, SITMDR3, val);
-
 	}
 	/* SIRMDRx */
 	else {
@@ -217,6 +242,11 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 			 priv->err_ovf[substream->stream],
 			 priv->err_udf[substream->stream]);
 
+	priv->count--;
+
+	if (!priv->count)
+		reset_control_assert(priv->reset);
+
 	return 0;
 }
 
@@ -493,12 +523,19 @@ static int msiof_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	reset_control_assert(priv->reset);
+
 	ret = devm_request_irq(dev, irq, msiof_interrupt, 0, dev_name(dev), priv);
 	if (ret)
 		return ret;
 
 	priv->dev	= dev;
 	priv->phy_addr	= res->start;
+	priv->count	= 0;
 
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
-- 
2.51.0


