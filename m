Return-Path: <linux-renesas-soc+bounces-30777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB9aDSaazmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:32:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8638BEAD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6171630692EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BC63F167A;
	Thu,  2 Apr 2026 16:26:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F87230FC26;
	Thu,  2 Apr 2026 16:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147173; cv=none; b=PHQvmYaHtpRHY8K3NFU33jHgSBrsKf39sEjFIF9TF2J5HpyzucAEqvs/f1MHw0PycHtTIICn4Oe4ZIBPp7K1vxDyOr9Uf5RQ/6sRO8nLxnFxzI0btEA49EdRD/ZyyX4HYKEMjZoSALUbtXV3mIT3xyQfpn6QawYQrCNN+67rjIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147173; c=relaxed/simple;
	bh=oqA9FCtTDjJ3hkd4hCTmhwM5nYUxzjIzV+i+rJvSrxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2ulAALaiQd7RuFTluMusk//uJlTk1hERP7BfJ9lPTEEHEQl3SP4pMRlDzhI6oRjACOFUqrX785HAy13SXa9sdd/S4TEkPWd69lJ/+lqBTJEjiyQXY+eZUs+WmInqlTfPjBb5EnZ16xyDty+SUdeVambP+PjCxWOcqg5WsJS/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: XnEgzdlvRAqDX5C9S1L5nA==
X-CSE-MsgGUID: wsNLB5rJTiyUjeTCLfr9yQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:26:10 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6F818401911D;
	Fri,  3 Apr 2026 01:26:05 +0900 (JST)
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
Subject: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
Date: Thu,  2 Apr 2026 18:24:33 +0200
Message-ID: <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30777-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.903];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 97F8638BEAD
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

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/rsnd.h |  7 ++++++
 sound/soc/renesas/rcar/src.c  | 45 +++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 2c5738926093..8700b39b535e 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -632,6 +632,13 @@ struct rsnd_priv {
 	struct clk *audmapp_clk;
 	struct reset_control *audmapp_rstc;
 
+	/*
+	 * Below values will be filled in rsnd_src_probe()
+	 */
+	struct clk *clk_scu;
+	struct clk *clk_scu_x2;
+	struct clk *clk_scu_supply;
+
 	spinlock_t lock;
 	unsigned int ssiu_busif_count;
 	unsigned long flags;
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 8b58cc20e7a8..e1f609589406 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -516,6 +516,7 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 			 struct rsnd_priv *priv)
 {
 	struct rsnd_src *src = rsnd_mod_to_src(mod);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
 
 	/* reset sync convert_rate */
@@ -526,6 +527,12 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 	if (ret < 0)
 		return ret;
 
+	ret = clk_prepare_enable(priv->clk_scu_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable scu_supply_clk\n");
+		return ret;
+	}
+
 	rsnd_src_activation(mod);
 
 	rsnd_src_init_convert_rate(io, mod);
@@ -549,6 +556,8 @@ static int rsnd_src_quit(struct rsnd_mod *mod,
 	src->sync.val		=
 	src->current_sync_rate	= 0;
 
+	clk_disable_unprepare(priv->clk_scu_supply);
+
 	return 0;
 }
 
@@ -711,8 +720,9 @@ struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *priv, int id)
 
 int rsnd_src_probe(struct rsnd_priv *priv)
 {
-	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct reset_control *rstc;
+	struct device_node *node;
 	struct rsnd_src *src;
 	struct clk *clk;
 	char name[RSND_SRC_NAME_SIZE];
@@ -737,6 +747,27 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 	priv->src_nr	= nr;
 	priv->src	= src;
 
+	priv->clk_scu = devm_clk_get_optional_enabled(dev, "scu");
+	if (IS_ERR(priv->clk_scu)) {
+		ret = dev_err_probe(dev, PTR_ERR(priv->clk_scu),
+				    "failed to get scu clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	priv->clk_scu_x2 = devm_clk_get_optional_enabled(dev, "scu_x2");
+	if (IS_ERR(priv->clk_scu_x2)) {
+		ret = dev_err_probe(dev, PTR_ERR(priv->clk_scu_x2),
+				    "failed to get scu_x2 clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	priv->clk_scu_supply = devm_clk_get_optional(dev, "scu_supply");
+	if (IS_ERR(priv->clk_scu_supply)) {
+		ret = dev_err_probe(dev, PTR_ERR(priv->clk_scu_supply),
+				    "failed to get scu_supply clock\n");
+		goto rsnd_src_probe_done;
+	}
+
 	i = 0;
 	for_each_child_of_node_scoped(node, np) {
 		if (!of_device_is_available(np))
@@ -759,6 +790,16 @@ int rsnd_src_probe(struct rsnd_priv *priv)
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
@@ -766,7 +807,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, rstc, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
-- 
2.25.1


