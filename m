Return-Path: <linux-renesas-soc+bounces-31300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLNNKQmK32mgVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:52:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26931404860
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133C03126B02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3880637F8BC;
	Wed, 15 Apr 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAFGxp2/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D30E37B40A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257273; cv=none; b=fgiv04BjQ0lQ4nSYIUqb33N38nckTx2Seb2bZr0LQVfQVCHbb9VjjTuNOP97/pccLHSBHsvT8VCliCIsGbVvNPdkOmbSCrNzNEUsXHMGdh++YUYMnThtyKF1HTMVdYR5GKZ62tR73mxRGmWd17mD1Kzv4c62hMaO1BMgE8i2z0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257273; c=relaxed/simple;
	bh=o7cX6xYLyuos94ZpDZbf8yhOnasEgZX1AkNvoBGmzKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aRFSNtz5Cvq4Lg/GQwVwt7T5oNZWfgaUPiay8JASEcov8mLvmrH5u5tb+DrQpZOVMdHwBB9WrdZV1TuDGdLM4A+EfjN1nJ/IEidz3b60NVz4BtSChK5DmaoudnTAxOJfDH1M++UtnI9gCt/Rxh4Bl9WWEYqZ+UtZ4mrlkcfzAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAFGxp2/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b8efed61so66557655e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257269; x=1776862069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9HiyLdpQmGO7ARO5mYvJF04K3eGYiJQbh378YAjq5M=;
        b=mAFGxp2/a8iG/tmvifpQW35BASlyMVMoZpVFABz07/on262/GKHAbEw5ar1MJ0AFQ/
         toiOqFXWbzeRjgmLgTFC4DMuWC51Yk2kHdawEzbBnVKUBlNdYz+qG4FtlHASXK9N+V5f
         U35XR9WgLy8cPXYVOF+nbr5yQFn15fRreosHXnI4Ab8VhhCupKJfo+y5AgAHulf1WTPt
         FfHz+NBHAOfnTNm+u6xruMD7DWLWOC9wrzJeJp86XLtEZw/KcaA61iyvJ0XA4BoOx6BK
         CX0PeGt0BLWXCixeOZJQRmLcu3xOB0UwCa4hUoke7oRuGPI+Ye43eaMFOciOmmpAkJn6
         FOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257269; x=1776862069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9HiyLdpQmGO7ARO5mYvJF04K3eGYiJQbh378YAjq5M=;
        b=XiLeB0WbEYfH6hwI/qax4mKPI7ejXg9jdQ1fu+9QAMWW9a1G8mDOZyLYwA1WRIzPqQ
         1yYRkkpj5V5DZXrRrxAYfN/yCJ/U8x/Hkq582Yxl37SgP1RyolN0UwxIY55mOZ/xvrKF
         PhHRTlANnEtvV3oK2peqnmEP+UCK1ZLnwxPQ5xBOlwCgpEYajqJrKDdZ/hfdjBzU1FYv
         vDHIgjx77FuvV64LgBpYjYv85NgC59IB3IDOZc8VWrdYbn1zH3g/18nIiOi2WBBEetpS
         IdBVbvqUwz7jZriVu2ACnsbpjMehcOHmFutK3dGVWvbTLg/rfOVxMFBH0x0IWRrbJ+CL
         uUJA==
X-Forwarded-Encrypted: i=1; AFNElJ8ntKY4ZDlYm+3HVrcJ24p+yDq2MG1CLMdzK/s5JbD/VlMJeauX/8v8gbzURVPDLBsafLNzJtD/66o8gaP/Zh/57A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOn/tgo/NPAkFbmx7iTN9BTaJ+T6+B6yAlJoOMv3XxbOF/wPox
	XDvP/DYvuxSJCgVUhKZjmMhTu3a/R1beHHQV4d0V98JjGjj3VPuQpMtu
X-Gm-Gg: AeBDies/sLqqsFfUBwFoDe3LVch8nZSBxR43GxQJcww98vt5Zc6VHDPchdTIUXdwO4Z
	9pRWIQSOBAs+wqUN9x376v6p1eeZTJrN9OkeBE4HeDJNRt/nE+Uq4Bvl4f2SXaO79OADV09olAv
	wVJhwFBxwUo+PeuylmnIIivV4IGZm+oWJcmTd4ULVk05FdJHPdQKR6Otg0e/7xknV9vIxXYKqqz
	B1QYrZmLtyuXWZqEqohZUArhapu18iCoq+oey2PqQb5fSmYGT1prK/dFmHSpAPRwEdFoqhnJi7u
	bCD9NgfmB3/FAbQQ8pVrJLQoAsm0UeTqUUaPoSoTsJxwa204OOYGIm6kwGXTu/Z4xh4OFH5R0n3
	Aj0SpjVCPe7ffxUJso1s3ISws/Czqn71CGlAPvApSybEddCyHXCWF96uitudTAd7nh/W1Nzuxe7
	rXi9wrCPVqiRbgPyxo7MtUh3z+CXVgpqnkcNOXpg==
X-Received: by 2002:a05:600c:c08b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488d6816f66mr207396055e9.2.1776257268742;
        Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
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
Subject: [PATCH v5 12/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:29 +0000
Message-Id: <20260415124731.3684773-13-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-31300-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26931404860
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

v5: No changes

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
index 953a2d998a03..70e395d3c6ef 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -679,6 +679,7 @@ struct rsnd_priv {
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


