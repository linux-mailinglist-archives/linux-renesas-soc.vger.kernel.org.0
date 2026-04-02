Return-Path: <linux-renesas-soc+bounces-30780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ3rEeCazmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:35:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1338BF59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BDC3308642B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67173F1676;
	Thu,  2 Apr 2026 16:26:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC043EFD2A;
	Thu,  2 Apr 2026 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147190; cv=none; b=r7FLcglxykj2R/OxtHo7FKeoZjJqKtp4FRy1dmXHW7adg5plHcVk3i/nmpst2r8PM4Lp0P4FF0i9v/n7s/ozc0kpIi6Q/2CaONPvRlUYwQYtkKwQvDc8a4aqIeW9T7ZIE1aNwkIqna1e+p7nZ6MdaAd7zCPjW0AFyu0IC7ky3DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147190; c=relaxed/simple;
	bh=PzZb3xSNwVChB+/GMQGGnDFP2GVYuK9QLShBEZzlf5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkCKg3ovtb2iIRjervtj+gVmyJ5pRix0WROaYN9kp//A8yf6N/uUNaCAXZxYsOvOBGdVDY6tY3u9gTbRxnjBrDrYNO/QuhR5rz9O0h1NqSLe4rX98VDtKsn/TbHBwEuGxsXr57deCEdNi6MHXrcGgK4tj6RyzKUketGDigUpJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: avwuBm4eRHWCf3dHVj+aKA==
X-CSE-MsgGUID: /xWjDa2PQgqhcV/GoQH7cA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:26:28 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DF40E401911D;
	Fri,  3 Apr 2026 01:26:22 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 14/14] ASoC: rsnd: Add system suspend/resume support
Date: Thu,  2 Apr 2026 18:24:36 +0200
Message-ID: <20260402162436.12059-15-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30780-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C6F1338BF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add per-module suspend/resume functions following the existing driver
architecture where each module manages its own resources in its own
file. core.c provides common clock/reset helpers and orchestrates the
calls in the correct order (reverse probe for suspend, probe order
for resume).

Infrastructure clocks (ADG, audmacpp, SCU) are managed globally
using optional APIs to remain transparent to platforms that don't
specify these clocks/resets.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2:
 - Distribute suspend/resume into per-module files (ssi.c, ssiu.c, src.c,
   ctu.c, mix.c, dvc.c, adg.c, dma.c) instead of monolithic loops in core.c,
   following Morimoto-san's architecture suggestion

 sound/soc/renesas/rcar/adg.c  | 16 +++++++++++++
 sound/soc/renesas/rcar/core.c | 43 +++++++++++++++++++++++++++++++++--
 sound/soc/renesas/rcar/ctu.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/dma.c  | 12 ++++++++++
 sound/soc/renesas/rcar/dvc.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/mix.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h | 22 ++++++++++++++++++
 sound/soc/renesas/rcar/src.c  | 26 +++++++++++++++++++++
 sound/soc/renesas/rcar/ssi.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/ssiu.c | 20 ++++++++++++++++
 10 files changed, 217 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index d73f29bc9de7..b84627c0f32d 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -930,3 +930,19 @@ void rsnd_adg_remove(struct rsnd_priv *priv)
 	/* It should be called after rsnd_adg_clk_disable() */
 	rsnd_adg_null_clk_clean(priv);
 }
+
+void rsnd_adg_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_mod *mod = rsnd_adg_mod_get(priv);
+
+	if (mod)
+		rsnd_suspend_clk_reset(mod->clk, mod->rstc);
+}
+
+void rsnd_adg_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_mod *mod = rsnd_adg_mod_get(priv);
+
+	if (mod)
+		rsnd_resume_clk_reset(mod->clk, mod->rstc);
+}
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index d85c614af598..ff19c49b57e8 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -961,7 +961,8 @@ static int rsnd_soc_hw_rule_channels(struct snd_pcm_hw_params *params,
 static const struct snd_pcm_hardware rsnd_pcm_hardware = {
 	.info =		SNDRV_PCM_INFO_INTERLEAVED	|
 			SNDRV_PCM_INFO_MMAP		|
-			SNDRV_PCM_INFO_MMAP_VALID,
+			SNDRV_PCM_INFO_MMAP_VALID	|
+			SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= 64 * 1024,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -2058,11 +2059,35 @@ static void rsnd_remove(struct platform_device *pdev)
 		remove_func[i](priv);
 }
 
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc)
+{
+	clk_unprepare(clk);
+	reset_control_assert(rstc);
+}
+
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc)
+{
+	reset_control_deassert(rstc);
+	clk_prepare(clk);
+}
+
 static int rsnd_suspend(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
+	/*
+	 * Reverse order of probe:
+	 * ADG -> DVC -> MIX -> CTU -> SRC -> SSIU -> SSI -> DMA
+	 */
 	rsnd_adg_clk_disable(priv);
+	rsnd_adg_suspend(priv);
+	rsnd_dvc_suspend(priv);
+	rsnd_mix_suspend(priv);
+	rsnd_ctu_suspend(priv);
+	rsnd_src_suspend(priv);
+	rsnd_ssiu_suspend(priv);
+	rsnd_ssi_suspend(priv);
+	rsnd_dma_suspend(priv);
 
 	return 0;
 }
@@ -2071,7 +2096,21 @@ static int rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
-	return rsnd_adg_clk_enable(priv);
+	/*
+	 * Same order as probe:
+	 * DMA -> SSI -> SSIU -> SRC -> CTU -> MIX -> DVC -> ADG
+	 */
+	rsnd_dma_resume(priv);
+	rsnd_ssi_resume(priv);
+	rsnd_ssiu_resume(priv);
+	rsnd_src_resume(priv);
+	rsnd_ctu_resume(priv);
+	rsnd_mix_resume(priv);
+	rsnd_dvc_resume(priv);
+	rsnd_adg_resume(priv);
+	rsnd_adg_clk_enable(priv);
+
+	return 0;
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index 81bba6a1af6e..73795d5b2817 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -383,3 +383,23 @@ void rsnd_ctu_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ctu));
 	}
 }
+
+void rsnd_ctu_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ctu *ctu;
+	int i;
+
+	for_each_rsnd_ctu(ctu, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ctu)->clk,
+				       rsnd_mod_get(ctu)->rstc);
+}
+
+void rsnd_ctu_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ctu *ctu;
+	int i;
+
+	for_each_rsnd_ctu(ctu, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ctu)->clk,
+				      rsnd_mod_get(ctu)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 5b63206361ef..b1b07072cf8e 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -984,3 +984,15 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	/* dummy mem mod for debug */
 	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
+
+void rsnd_dma_suspend(struct rsnd_priv *priv)
+{
+	clk_disable_unprepare(priv->audmapp_clk);
+	rsnd_suspend_clk_reset(NULL, priv->audmapp_rstc);
+}
+
+void rsnd_dma_resume(struct rsnd_priv *priv)
+{
+	rsnd_resume_clk_reset(NULL, priv->audmapp_rstc);
+	clk_prepare_enable(priv->audmapp_clk);
+}
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index bf7146ceb5f6..0e81fdf0e97b 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -386,3 +386,23 @@ void rsnd_dvc_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(dvc));
 	}
 }
+
+void rsnd_dvc_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_dvc *dvc;
+	int i;
+
+	for_each_rsnd_dvc(dvc, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(dvc)->clk,
+				       rsnd_mod_get(dvc)->rstc);
+}
+
+void rsnd_dvc_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_dvc *dvc;
+	int i;
+
+	for_each_rsnd_dvc(dvc, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(dvc)->clk,
+				      rsnd_mod_get(dvc)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index 566e9b2a488c..42bb07ade3c8 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -350,3 +350,23 @@ void rsnd_mix_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(mix));
 	}
 }
+
+void rsnd_mix_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_mix *mix;
+	int i;
+
+	for_each_rsnd_mix(mix, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(mix)->clk,
+				       rsnd_mod_get(mix)->rstc);
+}
+
+void rsnd_mix_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_mix *mix;
+	int i;
+
+	for_each_rsnd_mix(mix, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(mix)->clk,
+				      rsnd_mod_get(mix)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index ddaac350a049..4b62e051e3e1 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -921,4 +921,26 @@ void rsnd_debugfs_mod_reg_show(struct seq_file *m, struct rsnd_mod *mod,
 #define rsnd_debugfs_probe  NULL
 #endif
 
+/* PM helpers */
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc);
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc);
+
+/* Per-module suspend/resume */
+void rsnd_ssi_suspend(struct rsnd_priv *priv);
+void rsnd_ssi_resume(struct rsnd_priv *priv);
+void rsnd_ssiu_suspend(struct rsnd_priv *priv);
+void rsnd_ssiu_resume(struct rsnd_priv *priv);
+void rsnd_src_suspend(struct rsnd_priv *priv);
+void rsnd_src_resume(struct rsnd_priv *priv);
+void rsnd_ctu_suspend(struct rsnd_priv *priv);
+void rsnd_ctu_resume(struct rsnd_priv *priv);
+void rsnd_mix_suspend(struct rsnd_priv *priv);
+void rsnd_mix_resume(struct rsnd_priv *priv);
+void rsnd_dvc_suspend(struct rsnd_priv *priv);
+void rsnd_dvc_resume(struct rsnd_priv *priv);
+void rsnd_adg_suspend(struct rsnd_priv *priv);
+void rsnd_adg_resume(struct rsnd_priv *priv);
+void rsnd_dma_suspend(struct rsnd_priv *priv);
+void rsnd_dma_resume(struct rsnd_priv *priv);
+
 #endif /* RSND_H */
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index e1f609589406..51190deaeee0 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -832,3 +832,29 @@ void rsnd_src_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(src));
 	}
 }
+
+void rsnd_src_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_src *src;
+	int i;
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
+				       rsnd_mod_get(src)->rstc);
+
+	clk_disable_unprepare(priv->clk_scu_x2);
+	clk_disable_unprepare(priv->clk_scu);
+}
+
+void rsnd_src_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_src *src;
+	int i;
+
+	clk_prepare_enable(priv->clk_scu);
+	clk_prepare_enable(priv->clk_scu_x2);
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(src)->clk,
+				      rsnd_mod_get(src)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c61750922aff..f5333c9e7c33 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1279,3 +1279,23 @@ void rsnd_ssi_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ssi));
 	}
 }
+
+void rsnd_ssi_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ssi *ssi;
+	int i;
+
+	for_each_rsnd_ssi(ssi, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ssi)->clk,
+				       rsnd_mod_get(ssi)->rstc);
+}
+
+void rsnd_ssi_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ssi *ssi;
+	int i;
+
+	for_each_rsnd_ssi(ssi, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ssi)->clk,
+				      rsnd_mod_get(ssi)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 1462f02c2a7f..9cb9d12cee1f 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -614,3 +614,23 @@ void rsnd_ssiu_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ssiu));
 	}
 }
+
+void rsnd_ssiu_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ssiu *ssiu;
+	int i;
+
+	for_each_rsnd_ssiu(ssiu, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ssiu)->clk,
+				       rsnd_mod_get(ssiu)->rstc);
+}
+
+void rsnd_ssiu_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ssiu *ssiu;
+	int i;
+
+	for_each_rsnd_ssiu(ssiu, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ssiu)->clk,
+				      rsnd_mod_get(ssiu)->rstc);
+}
-- 
2.25.1


