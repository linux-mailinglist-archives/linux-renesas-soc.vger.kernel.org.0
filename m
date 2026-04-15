Return-Path: <linux-renesas-soc+bounces-31296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCjvA6WJ32kHVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:50:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F84047F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B468330FA63C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3579366816;
	Wed, 15 Apr 2026 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dro3whAF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0E286D7D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257268; cv=none; b=R/+QD2Xz/mi8c0tJ3v2zdhiEmYUwftARjwqQKvYgSp0maH5sal5K+HxFfkSqJqSVWHkTuXg74PSw/JN9lJgOWPO2xNStqUiwJ8KTUWm6D2vnl1mkSBh3dV0wQlrdvYWhv0LmtEPb+1lkH3mcgKAD9cEdCZZ/FotvrT52jZn5CvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257268; c=relaxed/simple;
	bh=zrguUJkTsmHxfkkJjR7jXzsxLZJp3bbWa1ZIg2o+Q6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rr53q40i8x+YQTJArFNlcp8JnFSkaSTNRZByokU8DNR6DiJbd0VdtjJIDMswsufN+u4dIJ6Gk9V11ASpMVxjMlB4n7irN3Jf2Ftnuo5R/gdhA9t5m6eF78dQnTAip8lxFLwlsi0MgGMqw89ZtL7OUUJAeP3D9LbQzCbCisVWmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dro3whAF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so63643755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257264; x=1776862064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6/tsH6v4egNQ8ZnSYLZFTG/36tQkFlhJNe8EuPwEFU=;
        b=Dro3whAFbPddWereJ1Upe98VTS1ltu8Iqk4Gnoj7RX89g2ngNBj+4B5bHdKUy9MTQ0
         qvmOnQt/PREMPyWDz2sePTZk6dV88ZnySO3sI40sOCV5eGFr5BuqNqEZigcr4tw4zg/Y
         5cYjXHfo2r/VsOs06hhHyLUl6MLDiBaDXTWXCdL50VL7oVVvIN+Ux0MO2ycx8nEZAAub
         /9quzKhpDV2jBIz4kaQ7Fe1sqDZisXeVNecLvlUeNaQtG/1pchX72qw1tlUFlVduf/AJ
         8zUQ8SYBrvzloZRwVZh0hmWU9FwciDdJlwc1IBfjmYbB9v1eLmGwJcaXDrDBdqxYtFlo
         AiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257264; x=1776862064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6/tsH6v4egNQ8ZnSYLZFTG/36tQkFlhJNe8EuPwEFU=;
        b=HuBenEHCtrSbIRA3O/S9FEYmGaQ5KfOeiBHd12chGyb4G8WGrRW8aYFLPO8BjofyNM
         LUdB6Jn1CzngP+oKVVA40pEzhmLjRjqImm+ZnD8HDKiez79afm5RPqtFth7H1yHr9tWY
         QVO0e6BNERpubDi4xrQEASDTR5CXySUR14GPfUELY42Z05kM326AzVY/WSZlx3XYokjv
         HZeXop8cqKpzJXQIae8JMz2HtTV393SCYsJNJ8hfso+KX8BmSSXfIIKOxKckSYIAGNux
         IP0+sGelpXF0trV01+fbd1s34Lqys6Ysy/j5KERCUDUYBQ+tkLfe/0Flxeu9DWVF91fK
         eElw==
X-Forwarded-Encrypted: i=1; AFNElJ8OwwulCguEXQbluq/Xup7fpqtgnqQHD/BtrNSEKuU/vQJIO84WmcYT1dOmBg6OIzniTqdPRlOWXwqkNyQ7KTSfWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhRresrOewMF8CJVLwLhHoOFicV/t5tjBj0vkufTFwc2oVsI3k
	rQOyW0XrvLPsY8wmE/BIYIJJ/GYYyfqq65Z+ZlVy+EgTDVAu1V1OCY55
X-Gm-Gg: AeBDies9P5seLf/CGlS6cTWhn5arSj54NJK0A4QICxuuK81t9KrTqgzT8FvBEgMRBds
	xe4GGWy6KQKZ+PxJR/IJjcwR2nu6MfdncpGhy4pZW+weGMDZdx74U0ruVMgTLmMZ3HFYtPihWIW
	fr4x/wlP4clmtXEzGiqIMjCPrk458CNu0YcERAJKINIVfQ/MupfqBr3RbS4yxcjo0+1vjD00QQ0
	kX2Im7rEMxevdI0OxIhxtjSq/kdTHAtmBAbX4q4TKltqmHs0HNIbL97UfbWOW4kuvWky8H5hsxI
	nVAvtZLwaps2F/PZNhnoqZ2mep2UpwLai+ik9yVcn5PMK+ZV7D71gDong2m6GjNyMGbT9HEuXyL
	6fXVYHSPL1Tq4Hb9eU+Spwao3KTed2TLti8IlK0m0QGxoSI5sRv4kCmmGBh/Z8sue1PIZg8Ui1p
	Z7QimnpcMGkRUb5CtTut1T19q4WI8h/lossEaswA==
X-Received: by 2002:a05:600c:c091:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-488d683662cmr215199215e9.19.1776257264281;
        Wed, 15 Apr 2026 05:47:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:43 -0700 (PDT)
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
Subject: [PATCH v5 08/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Date: Wed, 15 Apr 2026 12:47:25 +0000
Message-Id: <20260415124731.3684773-9-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-31296-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: A32F84047F3
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

Changes:

v5: No changes

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
index 16d7eafedae1..953a2d998a03 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -647,6 +647,7 @@ struct rsnd_priv {
 #define RSND_RZ3	(3 << 8)
 #define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
 #define RSND_RZG3E	(1 << 12)
+#define RSND_SSIU_BUSIF_STATUS_COUNT_2	BIT(16) /* Only 2 BUSIF error-status register pairs */
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -665,6 +666,7 @@ struct rsnd_priv {
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


