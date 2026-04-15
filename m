Return-Path: <linux-renesas-soc+bounces-31297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMbrIi+J32kHVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:48:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DF40474D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D8123006817
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83629378D8D;
	Wed, 15 Apr 2026 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkRo6ALi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB2352C58
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257269; cv=none; b=TXqHko4pfoil+5U03DL3WHlCQbtZXe8LbT4IcET9zt3Gq9pmGTWwSmTxiKH/CEY0rSWjSOz0WdosH5km6OqOpiVsmkeqFmvpV1BYfohD7AB9HoSRu9YYdqyitJQBccbqOvf9dcyAzmxnm8ioH6eAIB4b8JEyjm6mLqq+gc7suzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257269; c=relaxed/simple;
	bh=+pFXbL5AUesXszbyYGLL+MT4o6mCBIo3EDz/8Nk1tsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nifekuMprDZhufScOuquwlJhspxJqHcqQgYWS0uWYm3KykTz5ZUeWJNOEPlMavjHX60PSl4pbOJ4Xp1hq/luq3RwMP/fEWkKk/kOQTCk5m84oPrFPuoryO8RwhvVQGoxs66fcidr1lYZ6Bzd+GgSGbMRT26wNNKiRCVXpV7ZYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkRo6ALi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso4235045f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257266; x=1776862066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk3PxfqcVUsp/jCD7Gx4pQpsBhAEOkB0+K5c3K014GE=;
        b=bkRo6ALi6W1W93K6is9Ju3AxZjJsSpwcqoBB7avtdHweihydmokzLL4Zc/82BWzhLQ
         PWveHscKFnBFOBi4GYuDwmNZ6cLvyz2vMIh0U1oJgHFX8VVHAGa+NB0JQ26LiTRgVBlL
         12CgOFOrlPjm22bwzjGAfWiKwnQTXNZumlXC+zbkZ0QAJySBcBLNdcUXjKx4eTO+X55w
         HpagweuAS+aKINBcn3Pk7YXrfClavdnsEJlBLghuBjhOD5fUqG9RzWoWZ7xCBeKge+Iu
         94Q3i4ZnGtK6ZIgWEVwy28CwPEa3fusy3jncp87lARxqwKgivg+z+0MG+5Ipgal53EUB
         BjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257266; x=1776862066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jk3PxfqcVUsp/jCD7Gx4pQpsBhAEOkB0+K5c3K014GE=;
        b=BG55kpXLZO7HyNhWYgOodAu7S0L6r9jgunN8oLORARLaSLPyxN1W4XMu7OzcmdCC+s
         L0aL7WuGkRJqofjqXh2gUq1cbPdocLoImDu0varH2jUwlFuAwxhdUWjpMQgKdSfNl/pD
         LutTbjMB95ZGT05HJqA4a+w3p2MJMWmA2CCG7VlqZuH4gZBt++RhpiDu/AoTi2Z0Ajw5
         TwbiDlvdLq/kW6zuEomgrUoyLLzosY5ieIQSfInIHKE4BlClIWPR9l+UlTnZsnO8GCLW
         kH89mcl642uqJXZgzQBJN3uHBe4hqqeOHvWtFAxzSnBQc+jCZT0lojUU+/VzW87iBkS9
         J+Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+lMV9krKcaAfmKJsTHL7+2hjlsm2AJHeG+3a3yOmJru+81raTaWXjAzLpXLLuVM6Nowra7Xw4xt8MltMqtQckw/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyErXJJKyJvhGvoFsATiC/US0u6fpUEl3mGN/8aADynxOdb3mrL
	QXhmpaFZMWgFyIva0cjWuPwGJg7jPonGxv3Bt2ItXUqOUQ50BFVUaNcr
X-Gm-Gg: AeBDietdixH3EPVG6PF/qISFkuTLQM/UAus80tOvLhSCUjbXNbhkCWl4G04rVjTgxzJ
	lzmHGcvD09y3tvC/eQCyrq5DXn0PGP01FAGOZQBFHnJ/d2MgOpl8Smjwvm3ZZ5agSwiVr77kKFv
	EANDAKQxKCIdRn9t9umgmbRYkJjdxpKDF7RDVpYVpT9IvPF9QM6U6/t7Gdxt3WU8tJKW04UyP4x
	wSrC2Aamm1EOmc8si0VXdkgfF/5DhRPrvxON23Fe8ahgV5LRLlsFCedLDoItJrfpRBULZBAFs4F
	n42PN/X4oVVuBDTPFKyEqi4L03QfQkhaxxqZzVSCzEWSqpueNguhQmPYRnLZqLCYQEJBaoVFL+0
	fI0O/HyrkNjUs5YxA8M8JDhtLp9vyunb5sYHIVvyYrJbZL4owGFU7BQ3mvHqdmBTrlP4mydqVPf
	1SB5YE+RUgm8J8QQbCgyYx8b4h/W6BOmoSzcFBAw==
X-Received: by 2002:a5d:5d83:0:b0:43b:40ef:5d1a with SMTP id ffacd0b85a97d-43d642552e7mr31331940f8f.5.1776257265506;
        Wed, 15 Apr 2026 05:47:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:44 -0700 (PDT)
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
Subject: [PATCH v5 09/14] ASoC: rsnd: Add SSI reset support for RZ/G3E platforms
Date: Wed, 15 Apr 2026 12:47:26 +0000
Message-Id: <20260415124731.3684773-10-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31297-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 253DF40474D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SSI reset support for the Renesas RZ/G3E SoC, which differs from
earlier generations in several ways:

 - The SSI block always operates in BUSIF mode; RZ/G3E does not implement
   the SSITDR/SSIRDR registers used by R-Car Gen2/Gen3/Gen4 for direct SSI
   DMA. Consequently, for the RZ/G3E, all audio data must pass through
   BUSIF. PIO mode remains available for R-Car Gen2/Gen3/Gen4 platforms.
 - Each SSI instance has its own reset line, exposed using per-SSI names
   such as "ssi0", "ssi1", etc., rather than a single shared reset.

To support these differences, rsnd_ssi_use_busif() always return 1 on
RZ/G3E, ensuring that the driver consistently selects the BUSIF DMA path.
While at it, update the reset acquisition logic to request the appropriate
per-SSI reset controller based on the SSI instance name.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Clarify in commit message that PIO mode remains available on R-Car
   Gen2/Gen3/Gen4 platforms

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/ssi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c06cebb36170..c65435551283 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1158,6 +1158,7 @@ int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod)
 
 int rsnd_ssi_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod_ops *ops;
@@ -1207,6 +1208,16 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			goto rsnd_ssi_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses per-SSI reset controllers.
+		 * R-Car platforms typically don't have SSI reset controls.
+		 */
+		rstc = devm_reset_control_get_optional(dev, name);
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_ssi_probe_done;
+		}
+
 		if (of_property_read_bool(np, "shared-pin"))
 			rsnd_flags_set(ssi, RSND_SSI_CLK_PIN_SHARE);
 
@@ -1225,7 +1236,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    NULL, RSND_MOD_SSI, i);
+				    rstc, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
-- 
2.25.1


