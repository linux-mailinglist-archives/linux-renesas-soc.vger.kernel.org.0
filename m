Return-Path: <linux-renesas-soc+bounces-31299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id djH2DOmJ32mgVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:51:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE962404841
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EEB831182AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F69D37DEB9;
	Wed, 15 Apr 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGosha4A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379A372ED6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257272; cv=none; b=q1JBBqf3aD5k1JFywC+1SCiU94n9n5LjQGNivbgoSC4dGHOzj9a5Ukfq2RIGIdomS5EBfVPjK/glcPknW0blqO1IehmOXnfy/vLWiBzrTXPEKoPFoELJY9KC7tS5ZY7fYSzBIdmDw1AYnrq0/cIySk4tCARbsNUiZKcMziahK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257272; c=relaxed/simple;
	bh=cHIp6KuufZJKj+9QDEYAC41FG9t4fNq15lb/6RK1zSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nVQCGLv4JnTaWGiS6noPvgLhDTAh9x+2xg01/VeLvcuFpAilWDnGVFXpXJkMu9Eg2LUfAG8I+OTbvaWlf83oU+OXXWXFg6Znr7pcYDCcLWMib82PyPrSz3COklq/QZApr6Xu/9a2JUX8FziHRgcyo68WJx+Rb17v702q2B/TFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGosha4A; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so4020435f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257268; x=1776862068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBHWbtUtlzPl+OxM8QOAujP59U80OqIWeXAKTEjo1lo=;
        b=kGosha4A2ROn4iFWCGDtiYyyRFAprmG2r7M8vq09yHHyY4e051cs54O+qcLnvApfwq
         R+dPnohsjojcxXEnBEulwSyjU1je8xcwRImqVj4il25xRA0te4TKv4YyF5h6C7GtJzEh
         /8UJSmIt1HmabOFV/FWIs/tP9AisNA3dG2096ed95UwOdgAVnC95zXlp28Nh92Oiqa+R
         jGFZ2pPWKhx4lQozbOtJ/zCdPZTQomGASrcD+ylKkcvArfSEjEcFIjSEOnCT+wLb8BkG
         wD+2UnwntTWQvH0lRWhARz+GBbcW4+YB9Izd4FgUlJpSpDqYiDYuZFW/CRQkQNc6LEp5
         X7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257268; x=1776862068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UBHWbtUtlzPl+OxM8QOAujP59U80OqIWeXAKTEjo1lo=;
        b=l3po/QPAmwXVP6UQGoZia53Sn3qo4BkaelJttR3Xi4mw+3Zg0w0INDMS3GshVvE1Qv
         WJMb1fzKoYvzBhylOjSaKkBI2p2cLK840bbagPgXZXfiErGX3SKfDzj1gxg3vVeP1GqD
         2BWmrRuo/rsjwXV9zEdklNFUzE7v5/r0nXkdWWZuQ33ngvGhVSfQIpMGvJ0bEUfPfLGz
         eW4a1jpg48b1bBMRAGD8s+iydkQR3KYeLvRiZuTcyYWzBB3FfOE2G9UezmhDrLEIIAvN
         f91UHy72lV9OccdhK7c2QWUEpU0PNFuu+SgZ4pMeYuCMfSBPw0auiyHU84gfXtfz9ff3
         dDOA==
X-Forwarded-Encrypted: i=1; AFNElJ8NC0jv+NTxSVt3wzSAt0SBECrwcKd2r6EEd7J3lkmBuGozJybhGJ/A8iIIOFaB9LKkBXrXp9lYLg8woRuHvI2B/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXqDdHl82CTSIf+K81aziA3wRKvWnAUy1+w+FEOd5IFp1SkPp
	upfTHjaPNjOBH5xu+++wCasu9TbFGuTVaHeA5lWmI1qgNNPehhOEjjRn
X-Gm-Gg: AeBDieuUl+VowPfT1WoG9fFzs3fh1KACAHdKNkgfkfXXFvHU+MoMfBtGTOWKtYYDDm+
	Y6+XNrdEbTrcY96UX9fXjZ6AwzEAsogkDjzyw5l3VoCtirdq8wONaUZwl36wX8D2d3Ot2m4e3Af
	NX+54cm6Ve/9VBXS/p67iKj5GKTWw3YUvqEcjhGlz/ycrtWUtwgKzuMxxGyM+utlyMQz8sXPkg8
	85SkAtMNVRsWq6QJxNOgt9bnVCClJKY7OZf+u6JkEIa1XN6ZUUpMnbwJqqXvvRBz+okMDemj7qZ
	19wuQN3iJruh5Akbxfdp3Ogdwx18vsTHRRnSuds5Mdm9XmNNflnqdrUj6M8o7dj64Bsj+roElt2
	frKbcPB4J0ZF165/JLnWaFgsCXdQDhb4VgJqYQjnVYrUVhLdIu/t/zGp/rYkhE/PSxyNHn3TbU/
	QhjBb8/to1gPh+TiuJfTLe1HWoxTj3PBJJqs9rQg==
X-Received: by 2002:a05:6000:4010:b0:43b:5095:d101 with SMTP id ffacd0b85a97d-43d642b8e12mr33503201f8f.27.1776257267636;
        Wed, 15 Apr 2026 05:47:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:47 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v5 11/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
Date: Wed, 15 Apr 2026 12:47:28 +0000
Message-Id: <20260415124731.3684773-12-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31299-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johnmadieu@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: CE962404841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E's ADG module requires explicit clock management for SSI audio
interfaces that differs from R-Car Gen2/Gen3/Gen4:

 - Per-SSI ADG clocks (adg.ssi.N) for each SSI module
 - A shared SSIF supply clock for the SSI subsystem

These clocks are acquired using optional APIs, making them transparent
to platforms that do not require them.

Clock prepare/unprepare is handled in rsnd_adg_clk_control(), which
is called from probe, remove, suspend and resume (all sleepable
contexts). The trigger path (atomic context) only calls
clk_enable/clk_disable, which is atomic-safe and requires no
additional splitting.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v5: No changes

v4:
 - Move clk_prepare/unprepare for per-SSI ADG and SSIF supply clocks
   into rsnd_adg_clk_control() instead of separate prepare/unprepare
   functions, centralizing clock lifecycle management
 - Return proper errors on clk_enable() failure instead of dev_warn()
 - Eliminates hw_params prepare leak concern since prepare now happens
   once at probe/resume

v3: No changes
v2:
 - Split clock handling into prepare/enable phases for atomic context
   safety

 sound/soc/renesas/rcar/adg.c | 91 +++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 813ad5eabba6..9cae3bbefa55 100644
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
@@ -343,8 +349,16 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 
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
 
@@ -354,7 +368,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
-	int data;
+	int id = rsnd_mod_id(ssi_mod);
+	int ret, data;
 	u32 ckr = 0;
 
 	data = rsnd_adg_clk_query(priv, rate);
@@ -376,6 +391,22 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
 			adg->brg_rate[ADG_HZ_441]);
 
+	/*
+	 * RZ/G3E: enable per-SSI and supply clocks
+	 */
+	ret = clk_enable(adg->clk_adg_ssi[id]);
+	if (ret) {
+		dev_err(dev, "Cannot enable adg.ssi.%d ADG clock\n", id);
+		return ret;
+	}
+
+	ret = clk_enable(adg->clk_ssif_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable SSIF supply clock\n");
+		clk_disable(adg->clk_adg_ssi[id]);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -424,9 +455,35 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 	if (ret < 0)
 		rsnd_adg_clk_disable(priv);
 
+	/* RZ/G3E: per-SSI ADG and SSIF supply clocks */
+	if (enable) {
+		for (i = 0; i < ADG_SSI_MAX; i++) {
+			ret = clk_prepare(adg->clk_adg_ssi[i]);
+			if (ret < 0) {
+				while (--i >= 0)
+					clk_unprepare(adg->clk_adg_ssi[i]);
+				rsnd_adg_clk_disable(priv);
+				return ret;
+			}
+		}
+		ret = clk_prepare(adg->clk_ssif_supply);
+		if (ret < 0) {
+			for (i = 0; i < ADG_SSI_MAX; i++)
+				clk_unprepare(adg->clk_adg_ssi[i]);
+			rsnd_adg_clk_disable(priv);
+			return ret;
+		}
+	}
+
 	/* disable adg */
-	if (!enable)
+	if (!enable) {
+		/* RZ/G3E: unprepare per-SSI and supply clocks */
+		clk_unprepare(adg->clk_ssif_supply);
+		for (i = 0; i < ADG_SSI_MAX; i++)
+			clk_unprepare(adg->clk_adg_ssi[i]);
+
 		clk_disable_unprepare(adg->adg);
+	}
 
 	return ret;
 }
@@ -769,6 +826,31 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
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
@@ -798,6 +880,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
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
-- 
2.25.1


