Return-Path: <linux-renesas-soc+bounces-31063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA3zNKtr12myNggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:04:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C93C828B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB8B1300FA12
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E253A8FF6;
	Thu,  9 Apr 2026 09:04:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7562D3A8738;
	Thu,  9 Apr 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725477; cv=none; b=XbVwb9qakapxKICxl3Nxxp/t+gU96OCR+mnmPVxqsvmggnxnQP/kb/zQeQpm3eaFoIFgfv1boUxB/yN7KZohgasBroNgr5Lf6Eq9cyDDVIX6gwXHAusejgJ15Oce3nN1ZSs8MA61WtMc4+5JRiwqQRY7db211dAB47vj1ty5KmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725477; c=relaxed/simple;
	bh=SlY2IZUzTsmxR4CcT/ib5rjIT1RyjWQSCMfm0g+FTCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiYIHasMYsfquIbil/CNN87ckyUI9Fxu5/EUb4bf+ETyym6P6O29viTQKDfi3cHzhjdhTtcx/4x5qubWr/zXYX+QCvuiTFlml7EUuK9YzDwzp4jC5AdePVVE93OBGIerhK9cu4RTD1pFnoujqYLBQCh6gkWTFxFdi7oAC2kvBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GxfsRx4bQYKc2pMY8npCgA==
X-CSE-MsgGUID: npVTKl/KSM6azYdV63o/uA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Apr 2026 18:04:34 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.218])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C7C9A4015FC2;
	Thu,  9 Apr 2026 18:04:28 +0900 (JST)
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
Subject: [PATCH v4 07/12] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Date: Thu,  9 Apr 2026 11:02:56 +0200
Message-ID: <20260409090302.2243305-8-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31063-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.278];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B39C93C828B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the SSIU found on the Renesas RZ/G3E SoC, which
provides a different BUSIF layout compared to earlier generations:

 - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
 - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
 - SSI9: 4 BUSIF instances (BUSIF0-3)
 - Total: 28 BUSIFs

RZ/G3E also differs from Gen2/Gen3 implementations in that only two
pairs of BUSIF error-status registers are available instead of four,
and the SSI always operates in BUSIF mode with no PIO fallback.

Rather than scattering SoC-specific checks across functional code,
introduce an extra capability flags in the match data:

 - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
   register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
   and rsnd_ssiu_busif_err_status_clear() to limit register iteration.

Future SoCs sharing these constraints can set the flags without
requiring code changes.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

v4:
 - Move busif_status_count from rsnd_priv into new struct rsnd_ssiu_ctrl,
   following the rsnd_dma_ctrl pattern for shared non-per-instance module
   resources
 - Properly propagate reset control errors via dev_err_probe() instead
   of silencing them
 - Update changelog to accurately describe rsnd_is_rzg3e() usage for
   SoC-specific register handling 

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/core.c |  3 +-
 sound/soc/renesas/rcar/rsnd.h |  2 ++
 sound/soc/renesas/rcar/ssiu.c | 63 +++++++++++++++++++++++++----------
 3 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 4544791f3883..cb31af8a34d4 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -107,7 +107,8 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
-	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
+	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E |
+								RSND_SSIU_BUSIF_STATUS_COUNT_2) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rsnd_of_match);
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 28ed90ffe0ab..5cf35a1f3e45 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -648,6 +648,7 @@ struct rsnd_priv {
 #define RSND_RZ3	(3 << 8)
 #define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
 #define RSND_RZG3E	(1 << 12)
+#define RSND_SSIU_BUSIF_STATUS_COUNT_2	BIT(16) /* Only 2 BUSIF error-status register pairs */
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -666,6 +667,7 @@ struct rsnd_priv {
 	/*
 	 * below value will be filled on rsnd_ssi_probe()
 	 */
+	void *ssiu_ctrl;
 	void *ssi;
 	int ssi_nr;
 
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 0cfa84fe5ea8..f483389868d2 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -29,31 +29,39 @@ struct rsnd_ssiu {
 	     i++)
 
 /*
- *	SSI	Gen2		Gen3		Gen4
- *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7
- *	1	BUSIF0-3	BUSIF0-7
- *	2	BUSIF0-3	BUSIF0-7
- *	3	BUSIF0		BUSIF0-7
- *	4	BUSIF0		BUSIF0-7
- *	5	BUSIF0		BUSIF0
- *	6	BUSIF0		BUSIF0
- *	7	BUSIF0		BUSIF0
- *	8	BUSIF0		BUSIF0
- *	9	BUSIF0-3	BUSIF0-7
- *	total	22		52		8
+ *	SSI	Gen2		Gen3		Gen4		RZ/G3E
+ *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7	BUSIF0-3
+ *	1	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	2	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	3	BUSIF0		BUSIF0-7			BUSIF0-3
+ *	4	BUSIF0		BUSIF0-7			BUSIF0-3
+ *	5	BUSIF0		BUSIF0				BUSIF0
+ *	6	BUSIF0		BUSIF0				BUSIF0
+ *	7	BUSIF0		BUSIF0				BUSIF0
+ *	8	BUSIF0		BUSIF0				BUSIF0
+ *	9	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	total	22		52		8		28
  */
 static const int gen2_id[] = { 0, 4,  8, 12, 13, 14, 15, 16, 17, 18 };
 static const int gen3_id[] = { 0, 8, 16, 24, 32, 40, 41, 42, 43, 44 };
 static const int gen4_id[] = { 0 };
+static const int rzg3e_id[] = { 0, 4, 8, 12, 16, 20, 21, 22, 23, 24 };
+
+struct rsnd_ssiu_ctrl {
+	unsigned int busif_status_count;
+};
+
+#define rsnd_priv_to_ssiu_ctrl(priv) \
+	((struct rsnd_ssiu_ctrl *)(priv)->ssiu_ctrl)
 
 /* enable busif buffer over/under run interrupt. */
 #define rsnd_ssiu_busif_err_irq_enable(mod)  rsnd_ssiu_busif_err_irq_ctrl(mod, 1)
 #define rsnd_ssiu_busif_err_irq_disable(mod) rsnd_ssiu_busif_err_irq_ctrl(mod, 0)
 static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	int id = rsnd_mod_id(mod);
 	int shift, offset;
-	int i;
 
 	switch (id) {
 	case 0:
@@ -72,7 +80,7 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 		return;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (unsigned int i = 0; i < rsnd_priv_to_ssiu_ctrl(priv)->busif_status_count; i++) {
 		enum rsnd_reg reg = SSI_SYS_INT_ENABLE((i * 2) + offset);
 		u32 val = 0xf << (shift * 4);
 		u32 sys_int_enable = rsnd_mod_read(mod, reg);
@@ -87,10 +95,10 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 
 bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	bool error = false;
 	int id = rsnd_mod_id(mod);
 	int shift, offset;
-	int i;
 
 	switch (id) {
 	case 0:
@@ -109,7 +117,7 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		goto out;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (unsigned int i = 0; i < rsnd_priv_to_ssiu_ctrl(priv)->busif_status_count; i++) {
 		u32 reg = SSI_SYS_STATUS(i * 2) + offset;
 		u32 status = rsnd_mod_read(mod, reg);
 		u32 val = 0xf << (shift * 4);
@@ -160,7 +168,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 	/*
 	 * SSI_MODE0
 	 */
-	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
+	if (!rsnd_is_rzg3e(priv))
+		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
 
 	/*
 	 * SSI_MODE1 / SSI_MODE2
@@ -510,6 +519,8 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node __free(device_node) = rsnd_ssiu_of_node(priv);
+	struct reset_control *rstc;
+	struct rsnd_ssiu_ctrl *ctrl;
 	struct rsnd_ssiu *ssiu;
 	struct rsnd_mod_ops *ops;
 	const int *list = NULL;
@@ -534,8 +545,15 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 	if (!ssiu)
 		return -ENOMEM;
 
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->busif_status_count = rsnd_flags_has(priv, RSND_SSIU_BUSIF_STATUS_COUNT_2) ? 2 : 4;
+
 	priv->ssiu	= ssiu;
 	priv->ssiu_nr	= nr;
+	priv->ssiu_ctrl	= ctrl;
 
 	if (rsnd_is_gen1(priv))
 		ops = &rsnd_ssiu_ops_gen1;
@@ -558,12 +576,21 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		} else if (rsnd_is_gen4(priv)) {
 			list	= gen4_id;
 			nr	= ARRAY_SIZE(gen4_id);
+		} else if (rsnd_is_rzg3e(priv)) {
+			list	= rzg3e_id;
+			nr	= ARRAY_SIZE(rzg3e_id);
 		} else {
 			dev_err(dev, "unknown SSIU\n");
 			return -ENODEV;
 		}
 	}
 
+	/* Acquire shared reset once for all SSIU modules */
+	rstc = devm_reset_control_get_optional_shared(dev, "ssi-all");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get ssi-all reset\n");
+
 	for_each_rsnd_ssiu(ssiu, priv, i) {
 		int ret;
 
@@ -586,7 +613,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssiu),
-				    ops, NULL, NULL, RSND_MOD_SSIU, i);
+				    ops, NULL, rstc, RSND_MOD_SSIU, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1


