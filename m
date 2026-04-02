Return-Path: <linux-renesas-soc+bounces-30776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNjjJbCazmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:34:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716938BF2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFFC431449D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A403F075C;
	Thu,  2 Apr 2026 16:26:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23996349B1C;
	Thu,  2 Apr 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147167; cv=none; b=pn9D1dKW/DKDMJeoG8H4LxxlxVnJBvYTYNlN2wX0Z+8aG5iNt6iRqAQbLg5VgBjVS4NVTJeS99A3c2UZkZ5Wm34oXucdMHGAMa3FHpWo67xLgNtwdrM9Yyi4Nwwm993RgeiCbmAKI51Ec//vl5XuX1PL4mCyS6IWP4QFENEZSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147167; c=relaxed/simple;
	bh=GHVI8raHT7tGtkieqa35eRoq3AJOFMy64nb6YAyJ3Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPjJCfmB5mAxO602DykiJk2W/GNTHoc0bJlsmQdsdOY09QWsieCtJLCwLtawZHX/yBnzEo/rWMmg7/QDrvOJassXyYSqdas/bUeEIv4ys1MpH/tix9nghBiDbSSA6yj8hXIWs22vhevVMJ3vamddi6yBN9FSztZM/xc7xQ9dB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: sQFs4m6RQr6HnpVL0WaGBQ==
X-CSE-MsgGUID: DLxIT9V2QC6RF1N7MkKW8A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:26:04 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 96A20401911D;
	Fri,  3 Apr 2026 01:25:59 +0900 (JST)
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
Subject: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
Date: Thu,  2 Apr 2026 18:24:32 +0200
Message-ID: <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30776-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.900];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5716938BF2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E's ADG module requires explicit clock management for SSI audio
interfaces that differs from R-Car Gen2/Gen3/Gen4:

 - Per-SSI ADG clocks (adg.ssi.N) for each SSI module
 - A shared SSIF supply clock for the SSI subsystem

These clocks are acquired using optional APIs, making them transparent
to platforms that do not require them.

Additionally, since rsnd_adg_ssi_clk_try_start() is called from the
trigger path (atomic context), clk_prepare_enable() cannot be used
directly as clk_prepare() may sleep. Split clock handling into:

 - hw_params: clk_prepare() - sleepable context
 - trigger (start): clk_enable() - atomic safe
 - trigger (stop): clk_disable() - atomic safe
 - hw_free: clk_unprepare() - sleepable context

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c  | 99 ++++++++++++++++++++++++++++++++++-
 sound/soc/renesas/rcar/rsnd.h |  2 +
 sound/soc/renesas/rcar/ssi.c  | 18 +++++++
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index cbb5c4432a2d..131a60689f6d 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -19,6 +19,9 @@
 #define CLKOUT3	3
 #define CLKOUTMAX 4
 
+/* Maximum SSI count for per-SSI clocks */
+#define ADG_SSI_MAX	10
+
 #define BRGCKR_31	(1 << 31)
 #define BRRx_MASK(x) (0x3FF & x)
 
@@ -34,6 +37,9 @@ struct rsnd_adg {
 	struct clk *adg;
 	struct clk *clkin[CLKINMAX];
 	struct clk *clkout[CLKOUTMAX];
+	/* RZ/G3E: per-SSI ADG clocks (adg.ssi.0 through adg.ssi.9) */
+	struct clk *clk_adg_ssi[ADG_SSI_MAX];
+	struct clk *clk_ssif_supply;
 	struct clk *null_clk;
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
@@ -341,10 +347,58 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 	return -EIO;
 }
 
+/*
+ * RZ/G3E: Prepare SSI clocks - call from hw_params (can sleep)
+ */
+int rsnd_adg_ssi_clk_prepare(struct rsnd_mod *ssi_mod)
+{
+	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct device *dev = rsnd_priv_to_dev(priv);
+	int id = rsnd_mod_id(ssi_mod);
+	int ret;
+
+	ret = clk_prepare(adg->clk_adg_ssi[id]);
+	if (ret) {
+		dev_err(dev, "Cannot prepare adg.ssi.%d ADG clock\n", id);
+		return ret;
+	}
+
+	ret = clk_prepare(adg->clk_ssif_supply);
+	if (ret) {
+		dev_err(dev, "Cannot prepare SSIF supply clock\n");
+		clk_unprepare(adg->clk_adg_ssi[id]);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * RZ/G3E: Unprepare SSI clocks - call from hw_free (can sleep)
+ */
+void rsnd_adg_ssi_clk_unprepare(struct rsnd_mod *ssi_mod)
+{
+	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	int id = rsnd_mod_id(ssi_mod);
+
+	clk_unprepare(adg->clk_adg_ssi[id]);
+	clk_unprepare(adg->clk_ssif_supply);
+}
+
 int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	int id = rsnd_mod_id(ssi_mod);
+
 	rsnd_adg_set_ssi_clk(ssi_mod, 0);
 
+	/* RZ/G3E: only disable here, unprepare is done in hw_free */
+	clk_disable(adg->clk_adg_ssi[id]);
+	clk_disable(adg->clk_ssif_supply);
+
 	return 0;
 }
 
@@ -354,7 +408,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
-	int data;
+	int id = rsnd_mod_id(ssi_mod);
+	int ret, data;
 	u32 ckr = 0;
 
 	data = rsnd_adg_clk_query(priv, rate);
@@ -376,6 +431,18 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
 			adg->brg_rate[ADG_HZ_441]);
 
+	/*
+	 * RZ/G3E: enable per-SSI and supply clocks
+	 * Prepare was done in hw_params
+	 */
+	ret = clk_enable(adg->clk_adg_ssi[id]);
+	if (ret)
+		dev_warn(dev, "Cannot enable adg.ssi.%d ADG clock\n", id);
+
+	ret = clk_enable(adg->clk_ssif_supply);
+	if (ret)
+		dev_warn(dev, "Cannot enable SSIF supply clock\n");
+
 	return 0;
 }
 
@@ -769,6 +836,31 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 #define rsnd_adg_clk_dbg_info(priv, m)
 #endif
 
+static int rsnd_adg_get_ssi_clks(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct device *dev = rsnd_priv_to_dev(priv);
+	char name[16];
+	int i;
+
+	/* SSIF supply clock */
+	adg->clk_ssif_supply = devm_clk_get_optional(dev, "ssif_supply");
+	if (IS_ERR(adg->clk_ssif_supply))
+		return dev_err_probe(dev, PTR_ERR(adg->clk_ssif_supply),
+				     "failed to get ssif_supply clock\n");
+
+	/* Per-SSI ADG clocks */
+	for (i = 0; i < ADG_SSI_MAX; i++) {
+		snprintf(name, sizeof(name), "adg.ssi.%d", i);
+		adg->clk_adg_ssi[i] = devm_clk_get_optional(dev, name);
+		if (IS_ERR(adg->clk_adg_ssi[i]))
+			return dev_err_probe(dev, PTR_ERR(adg->clk_adg_ssi[i]),
+					     "failed to get %s clock\n", name);
+	}
+
+	return 0;
+}
+
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
 	struct reset_control *rstc;
@@ -800,6 +892,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (ret)
 		return ret;
 
+	/* RZ/G3E-specific: per-SSI ADG and SSIF supply clocks */
+	ret = rsnd_adg_get_ssi_clks(priv);
+	if (ret)
+		return ret;
+
 	ret = rsnd_adg_clk_enable(priv);
 	if (ret)
 		return ret;
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 5c5be0f64cb1..2c5738926093 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -602,6 +602,8 @@ void __iomem *rsnd_gen_get_base_addr(struct rsnd_priv *priv, int reg_id);
  *	R-Car ADG
  */
 int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate);
+int rsnd_adg_ssi_clk_prepare(struct rsnd_mod *ssi_mod);
+void rsnd_adg_ssi_clk_unprepare(struct rsnd_mod *ssi_mod);
 int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod);
 int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate);
 int rsnd_adg_probe(struct rsnd_priv *priv);
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c65435551283..c61750922aff 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -537,6 +537,7 @@ static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
 {
 	struct rsnd_dai *rdai = rsnd_io_to_rdai(io);
 	unsigned int fmt_width = snd_pcm_format_width(params_format(params));
+	int ret;
 
 	if (fmt_width > rdai->chan_width) {
 		struct rsnd_priv *priv = rsnd_io_to_priv(io);
@@ -546,6 +547,21 @@ static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
 		return -EINVAL;
 	}
 
+	/* RZ/G3E: prepare clocks here (can sleep) */
+	ret = rsnd_adg_ssi_clk_prepare(mod);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int rsnd_ssi_hw_free(struct rsnd_mod *mod,
+			    struct rsnd_dai_stream *io,
+			    struct snd_pcm_substream *substream)
+{
+	/* RZ/G3E: unprepare clocks here (can sleep) */
+	rsnd_adg_ssi_clk_unprepare(mod);
+
 	return 0;
 }
 
@@ -956,6 +972,7 @@ static struct rsnd_mod_ops rsnd_ssi_pio_ops = {
 	.pointer	= rsnd_ssi_pio_pointer,
 	.pcm_new	= rsnd_ssi_pcm_new,
 	.hw_params	= rsnd_ssi_hw_params,
+	.hw_free	= rsnd_ssi_hw_free,
 	.get_status	= rsnd_ssi_get_status,
 };
 
@@ -1070,6 +1087,7 @@ static struct rsnd_mod_ops rsnd_ssi_dma_ops = {
 	.pcm_new	= rsnd_ssi_pcm_new,
 	.fallback	= rsnd_ssi_fallback,
 	.hw_params	= rsnd_ssi_hw_params,
+	.hw_free	= rsnd_ssi_hw_free,
 	.get_status	= rsnd_ssi_get_status,
 	DEBUG_INFO
 };
-- 
2.25.1


