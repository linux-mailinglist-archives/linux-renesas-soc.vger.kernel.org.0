Return-Path: <linux-renesas-soc+bounces-31067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKTjCh5s12myNggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:06:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A53C82FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 421A9302AF01
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE8B3AE712;
	Thu,  9 Apr 2026 09:05:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24C93A9DA6;
	Thu,  9 Apr 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725501; cv=none; b=tagdD5t2DTmY/Z7JTG4ceb3po3qYNJ2zXUlaI9s7Um0/MAjkW/B62D48i6dIvntD6Wkipd+DZxyg8EI/l7w+8KUgXJW33yy2IG1wi4RN8rMza6y11rgrrva4/r4j3+hbROKLsQkndhviEszmm44c2f3dpOjmayAOQhaAgloBWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725501; c=relaxed/simple;
	bh=cLGLr+r89gQqbTNIHaqbN911i6HiTCoOhoRnMMvrI8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTDPOByAa1WNl2DNjnIJSyBOnsp8W2/XHpuLHqZO7ZDmPwN98443VOdmFTER8+e4n1Inv4BZjJUNT1oGIdqt6QpvbiaWcIvsPCrW3fi1si20hT+vqoHRaUgvipRHmy0s8m5MbzH8km+nNghZcS4KmUNUDiwmqTOnrrMEbFNUilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: OL/D5ys5RqauwuWJnhvYLw==
X-CSE-MsgGUID: VybBkJ10QCu+BfFIT1j71A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2026 18:04:59 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.218])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 031C74015D82;
	Thu,  9 Apr 2026 18:04:53 +0900 (JST)
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
Subject: [PATCH v4 11/12] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
Date: Thu,  9 Apr 2026 11:03:00 +0200
Message-ID: <20260409090302.2243305-12-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31067-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.184];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: C02A53C82FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
reset and clock management unlike previous R-Car generations:

- scu_clk: SCU module clock
- scu_clkx2: SCU double-rate clock
- scu_supply_clk: SCU supply clock

Without these clocks enabled, the SRC module cannot operate on RZ/G3E.
Add support for the shared SCU reset controller used by the SRC modules
on the Renesas RZ/G3E SoC. All SRC instances are gated by the same "scu"
reset line.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v4:
 - Move shared SCU clocks (scu, scu_x2, scu_supply) from rsnd_priv
   variables into new struct rsnd_src_ctrl, following the rsnd_dma_ctrl
   pattern for shared non-per-instance module resources
 - Keep original declaration order for struct device_node *node

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/rsnd.h |  1 +
 sound/soc/renesas/rcar/src.c  | 59 ++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 5cf35a1f3e45..8f8e86cb6e62 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -680,6 +680,7 @@ struct rsnd_priv {
 	/*
 	 * below value will be filled on rsnd_src_probe()
 	 */
+	void *src_ctrl;
 	void *src;
 	int src_nr;
 
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 8b58cc20e7a8..651ed378c4f7 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -54,6 +54,14 @@ struct rsnd_src {
 	     ((pos) = (struct rsnd_src *)(priv)->src + i);	\
 	     i++)
 
+struct rsnd_src_ctrl {
+	struct clk *scu;
+	struct clk *scu_x2;
+	struct clk *scu_supply;
+};
+
+#define rsnd_priv_to_src_ctrl(priv) \
+	((struct rsnd_src_ctrl *)(priv)->src_ctrl)
 
 /*
  *		image of SRC (Sampling Rate Converter)
@@ -516,6 +524,7 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 			 struct rsnd_priv *priv)
 {
 	struct rsnd_src *src = rsnd_mod_to_src(mod);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
 
 	/* reset sync convert_rate */
@@ -526,6 +535,12 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 	if (ret < 0)
 		return ret;
 
+	ret = clk_prepare_enable(rsnd_priv_to_src_ctrl(priv)->scu_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable scu_supply_clk\n");
+		return ret;
+	}
+
 	rsnd_src_activation(mod);
 
 	rsnd_src_init_convert_rate(io, mod);
@@ -549,6 +564,8 @@ static int rsnd_src_quit(struct rsnd_mod *mod,
 	src->sync.val		=
 	src->current_sync_rate	= 0;
 
+	clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu_supply);
+
 	return 0;
 }
 
@@ -713,6 +730,8 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct reset_control *rstc;
+	struct rsnd_src_ctrl *src_ctrl;
 	struct rsnd_src *src;
 	struct clk *clk;
 	char name[RSND_SRC_NAME_SIZE];
@@ -728,6 +747,12 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		goto rsnd_src_probe_done;
 	}
 
+	src_ctrl = devm_kzalloc(dev, sizeof(*src_ctrl), GFP_KERNEL);
+	if (!src_ctrl) {
+		ret = -ENOMEM;
+		goto rsnd_src_probe_done;
+	}
+
 	src	= devm_kcalloc(dev, nr, sizeof(*src), GFP_KERNEL);
 	if (!src) {
 		ret = -ENOMEM;
@@ -736,6 +761,28 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 
 	priv->src_nr	= nr;
 	priv->src	= src;
+	priv->src_ctrl	= src_ctrl;
+
+	src_ctrl->scu = devm_clk_get_optional_enabled(dev, "scu");
+	if (IS_ERR(src_ctrl->scu)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu),
+				    "failed to get scu clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	src_ctrl->scu_x2 = devm_clk_get_optional_enabled(dev, "scu_x2");
+	if (IS_ERR(src_ctrl->scu_x2)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu_x2),
+				    "failed to get scu_x2 clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	src_ctrl->scu_supply = devm_clk_get_optional(dev, "scu_supply");
+	if (IS_ERR(src_ctrl->scu_supply)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu_supply),
+				    "failed to get scu_supply clock\n");
+		goto rsnd_src_probe_done;
+	}
 
 	i = 0;
 	for_each_child_of_node_scoped(node, np) {
@@ -759,6 +806,16 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 			goto rsnd_src_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses a shared SCU reset controller for all SRC modules.
+		 * R-Car platforms typically don't have SRC reset controls.
+		 */
+		rstc = devm_reset_control_get_optional_shared(dev, "scu");
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_src_probe_done;
+		}
+
 		clk = devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
@@ -766,7 +823,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, rstc, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
-- 
2.25.1


