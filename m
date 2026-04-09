Return-Path: <linux-renesas-soc+bounces-31068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULugK89t12myNggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:13:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5353C84B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5455D30D0536
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DA63B19C0;
	Thu,  9 Apr 2026 09:05:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA29A3A8FF6;
	Thu,  9 Apr 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725507; cv=none; b=Zbbah8N8lDhducEXwjRfJFlsuDxMMq21nqNHVgGYQvctcOJZ5n5hs+5R3SL9ZoTk9IaIG2L1EuuPoUqaUGKMXa2RBiX6FT/u9duuyIOubuPJSwtv7ZNCN22nJBydQHXMJJ1bEuJv/62csSDZg7zhzNBn5Q9GC/Oba0e77duKk5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725507; c=relaxed/simple;
	bh=jFEeeJw53ejQ1F9bOIGt9cktS/3dF0GiHEJoYEMvEOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbqzgawt6MxspNUvfZ0TC+8o9V5Q970WAhxqMMOCcevkx/jIGG2yp1rHuvHUxJas1mC4HKlrHN8cdQuF+wFOtj31PISm9RTxF7iOjMcdBrTzhMKDpU4+VBkrYkDCELc9LHn55CaZdmQe40y5cUMzFTt6UoKvFOWRRT/vfds8fDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: odRpacj5Q0un0Dndzis7Lg==
X-CSE-MsgGUID: PUW8TekuSTC0B8d3AQlRdA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2026 18:05:05 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.218])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 012A34015D82;
	Thu,  9 Apr 2026 18:04:59 +0900 (JST)
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
Subject: [PATCH v4 12/12] ASoC: rsnd: Add system suspend/resume support
Date: Thu,  9 Apr 2026 11:03:01 +0200
Message-ID: <20260409090302.2243305-13-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31068-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.158];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1C5353C84B3
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
 
v4:
 - Absorb rsnd_adg_mod_get() helper directly instead of a separate
   preparatory patch
 - Distribute suspend/resume declarations into their respective IP
   sections in rsnd.h
v3: No changes
v2:
 - Distribute suspend/resume into per-module files (ssi.c, ssiu.c,
   src.c, ctu.c, mix.c, dvc.c, adg.c, dma.c) instead of monolithic
   loops in core.c, following Morimoto-san's architecture suggestion

 sound/soc/renesas/rcar/adg.c  | 26 +++++++++++++++++++++
 sound/soc/renesas/rcar/core.c | 43 +++++++++++++++++++++++++++++++++--
 sound/soc/renesas/rcar/ctu.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/dma.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/dvc.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/mix.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h | 18 +++++++++++++++
 sound/soc/renesas/rcar/src.c  | 26 +++++++++++++++++++++
 sound/soc/renesas/rcar/ssi.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/ssiu.c | 20 ++++++++++++++++
 10 files changed, 231 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 9cae3bbefa55..8c0c8bc92ab3 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -908,3 +908,29 @@ void rsnd_adg_remove(struct rsnd_priv *priv)
 	/* It should be called after rsnd_adg_clk_disable() */
 	rsnd_adg_null_clk_clean(priv);
 }
+
+static struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+
+	if (!adg)
+		return NULL;
+
+	return rsnd_mod_get(adg);
+}
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
index cb31af8a34d4..cb7fb26f8972 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -963,7 +963,8 @@ static int rsnd_soc_hw_rule_channels(struct snd_pcm_hw_params *params,
 static const struct snd_pcm_hardware rsnd_pcm_hardware = {
 	.info =		SNDRV_PCM_INFO_INTERLEAVED	|
 			SNDRV_PCM_INFO_MMAP		|
-			SNDRV_PCM_INFO_MMAP_VALID,
+			SNDRV_PCM_INFO_MMAP_VALID	|
+			SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= 64 * 1024,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -2059,11 +2060,35 @@ static void rsnd_remove(struct platform_device *pdev)
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
@@ -2072,7 +2097,21 @@ static int rsnd_resume(struct device *dev)
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
index e3278ff7e2f0..b9138c5076cb 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -1029,3 +1029,23 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	/* dummy mem mod for debug */
 	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
+
+void rsnd_dma_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_dma_ctrl *dmac = rsnd_priv_to_dmac(priv);
+
+	if (dmac) {
+		clk_disable_unprepare(dmac->audmapp_clk);
+		rsnd_suspend_clk_reset(NULL, dmac->audmapp_rstc);
+	}
+}
+
+void rsnd_dma_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_dma_ctrl *dmac = rsnd_priv_to_dmac(priv);
+
+	if (dmac) {
+		rsnd_resume_clk_reset(NULL, dmac->audmapp_rstc);
+		clk_prepare_enable(dmac->audmapp_clk);
+	}
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
index 8f8e86cb6e62..31c501c3b024 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -267,6 +267,8 @@ u32 rsnd_get_busif_shift(struct rsnd_dai_stream *io, struct rsnd_mod *mod);
 int rsnd_dma_attach(struct rsnd_dai_stream *io,
 		    struct rsnd_mod *mod, struct rsnd_mod **dma_mod);
 int rsnd_dma_probe(struct rsnd_priv *priv);
+void rsnd_dma_suspend(struct rsnd_priv *priv);
+void rsnd_dma_resume(struct rsnd_priv *priv);
 struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *name,
 					  struct rsnd_mod *mod, char *x);
 
@@ -429,6 +431,8 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  enum rsnd_mod_type type,
 		  int id);
 void rsnd_mod_quit(struct rsnd_mod *mod);
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc);
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc);
 struct dma_chan *rsnd_mod_dma_req(struct rsnd_dai_stream *io,
 				  struct rsnd_mod *mod);
 void rsnd_mod_interrupt(struct rsnd_mod *mod,
@@ -606,6 +610,8 @@ int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod);
 int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate);
 int rsnd_adg_probe(struct rsnd_priv *priv);
 void rsnd_adg_remove(struct rsnd_priv *priv);
+void rsnd_adg_suspend(struct rsnd_priv *priv);
+void rsnd_adg_resume(struct rsnd_priv *priv);
 int rsnd_adg_set_src_timesel_gen2(struct rsnd_mod *src_mod,
 				  struct rsnd_dai_stream *io,
 				  unsigned int in_rate,
@@ -804,6 +810,8 @@ extern const char * const volume_ramp_rate[];
  */
 int rsnd_ssi_probe(struct rsnd_priv *priv);
 void rsnd_ssi_remove(struct rsnd_priv *priv);
+void rsnd_ssi_suspend(struct rsnd_priv *priv);
+void rsnd_ssi_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ssi_mod_get(struct rsnd_priv *priv, int id);
 int rsnd_ssi_use_busif(struct rsnd_dai_stream *io);
 u32 rsnd_ssi_multi_secondaries_runtime(struct rsnd_dai_stream *io);
@@ -827,6 +835,8 @@ int rsnd_ssiu_attach(struct rsnd_dai_stream *io,
 		     struct rsnd_mod *mod);
 int rsnd_ssiu_probe(struct rsnd_priv *priv);
 void rsnd_ssiu_remove(struct rsnd_priv *priv);
+void rsnd_ssiu_suspend(struct rsnd_priv *priv);
+void rsnd_ssiu_resume(struct rsnd_priv *priv);
 void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 			     struct device_node *playback,
 			     struct device_node *capture);
@@ -838,6 +848,8 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod);
  */
 int rsnd_src_probe(struct rsnd_priv *priv);
 void rsnd_src_remove(struct rsnd_priv *priv);
+void rsnd_src_suspend(struct rsnd_priv *priv);
+void rsnd_src_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *priv, int id);
 
 #define rsnd_src_get_in_rate(priv, io) rsnd_src_get_rate(priv, io, 1)
@@ -857,6 +869,8 @@ unsigned int rsnd_src_get_rate(struct rsnd_priv *priv,
  */
 int rsnd_ctu_probe(struct rsnd_priv *priv);
 void rsnd_ctu_remove(struct rsnd_priv *priv);
+void rsnd_ctu_suspend(struct rsnd_priv *priv);
+void rsnd_ctu_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_ctu_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_CTU)
 #define rsnd_parse_connect_ctu(rdai, playback, capture)			\
@@ -869,6 +883,8 @@ struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_mix_probe(struct rsnd_priv *priv);
 void rsnd_mix_remove(struct rsnd_priv *priv);
+void rsnd_mix_suspend(struct rsnd_priv *priv);
+void rsnd_mix_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_mix_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_MIX)
 #define rsnd_parse_connect_mix(rdai, playback, capture)			\
@@ -881,6 +897,8 @@ struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_dvc_probe(struct rsnd_priv *priv);
 void rsnd_dvc_remove(struct rsnd_priv *priv);
+void rsnd_dvc_suspend(struct rsnd_priv *priv);
+void rsnd_dvc_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_dvc_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_dvc_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_DVC)
 #define rsnd_parse_connect_dvc(rdai, playback, capture)			\
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 651ed378c4f7..aac749f917bf 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -848,3 +848,29 @@ void rsnd_src_remove(struct rsnd_priv *priv)
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
+	clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu_x2);
+	clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu);
+}
+
+void rsnd_src_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_src *src;
+	int i;
+
+	clk_prepare_enable(rsnd_priv_to_src_ctrl(priv)->scu);
+	clk_prepare_enable(rsnd_priv_to_src_ctrl(priv)->scu_x2);
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(src)->clk,
+				      rsnd_mod_get(src)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c65435551283..072e66bda9e7 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1261,3 +1261,23 @@ void rsnd_ssi_remove(struct rsnd_priv *priv)
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
index f483389868d2..83de5247d43f 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -630,3 +630,23 @@ void rsnd_ssiu_remove(struct rsnd_priv *priv)
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


