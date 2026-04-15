Return-Path: <linux-renesas-soc+bounces-31302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKLkD06K32l5VAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:53:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34F4048AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2435D3066BBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0873537E6;
	Wed, 15 Apr 2026 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsNhjAUf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4437F011
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257276; cv=none; b=lwNwQsYzins/90rVCV/ulKypMsPaZHNy3vjhubYGh/7I8nN7fq76Z8r0PQL+Vn6ROT50w0rS4hh7uhwe5d8qWkhY1fl9kfSHiu5fsGAHPvwc6GH+Rdk5k8H3VzYjr869CN/htjQjROJqHGYufusuT3yWye3HdE76Ou3pG8w+z4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257276; c=relaxed/simple;
	bh=3AUjaTuUAMOIoNbGwrNrTFB3KowfH8gyLJvGIZwmpq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X8u7vvOtdcK3ozGCYKsjId1cE92iLePTSxWpfVfzmn+R0Z5GI3O0yZckZWq60qlb9uw3C4h6YoXJxz8DLS81Y16pvH76RP7sIKi1+GDPpacjeDminMrudPFWgCoYoTkLxPXG5MNozzAP3otZxBtq8+1YZmEidvk1z67FT13blig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsNhjAUf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7650202fso2670027f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257271; x=1776862071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhkpJX525o0ma2rk+OGoGOKbbyNMDBMuVYVKcuyB9Mo=;
        b=OsNhjAUfKJRjl5kpMUXmiLMgneo8/ch7XSspk7QUvT0x9atP1eABdnm6DPCrBZC9hn
         4igj3MWoD9rUwLtcFoJr7+0cYOtKv3lpywRksxNqdTI/rVn4dD+UK8xb2T6UsC6Wl74R
         FJ0W5d1MNt5qRlix3sbLzr3A8VYMcOSiwXTyl/Z+TK6iKI8X3v2oYP6FSmTzzQ4n0hOa
         IlGbanLvXaTLJyJeiuEc13tQ5ZVHRrQ+KtpED0eZrQeZPFhG6lGdnBc4ara1tqWgJefm
         HaYR+sYOKsBYrgha1B05LmU2LYpTgM1TIhiVHCZ8lBrg7vNBfhM/RPM1y8RBmvuuv2A2
         Vj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257271; x=1776862071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhkpJX525o0ma2rk+OGoGOKbbyNMDBMuVYVKcuyB9Mo=;
        b=mu3qfuWdLubVM9GDAmucqLURJIbo8JBk5ilAOYvIhyNn+lXxinoCzX+fBEkmFcUaSS
         NuXdaCz3curql8r/BmOrzabSu9rfCOKWkuvSx4v9j150BxT4KV+ynLprHYMxLoNAf+hv
         LnYcDsKhUgdwWRLmVl+6892uXr8dib4VC0Kpwfp+X2YohsLoWYTt/pSQURO2jB0TDUzw
         Qzh1wPc37TIY6sF/9TQSZrvJxoho0pI5Z+cbSoVKFvqD3UsxkgRtbIISJxHYmjsbcnXz
         LrGhShFJaz9MA0IfgeRoY/yvMMP33WpdE8Eq5hZraOfPLRpZ8oI6oMHv/gD56rTGLJGf
         jiOA==
X-Forwarded-Encrypted: i=1; AFNElJ/Dz4S3F2agz6eBuga3mZUycLcKQ8SAHLuyFijVBFw0QDi+l4ljYTO7rhUJQ1W0PO17nuc9iBv49saiqu6sa+J5Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvsl+ot1FRdFfFA9zS+cXgBEBVaXMm1M42SxztB7uJj2/Cqcv9
	aQBiLqFnh3BkbsDOndRgfdheRLQmGJgwYlt/dzkmUAGVO4kT14MjXRGy
X-Gm-Gg: AeBDieuwOtTkZnxscI5SnnWwNRvILq5thDerGfrYRQLsizIlgFX3ZyjgPGNi9EJ8vpI
	mLaCTZOunwhdOuHdz4q6tkDE7LV5JNRFP1SQ9c9Luz5euoloX0CektLJSGJgUh036rrMA2RYhAH
	Qyk5uUCcsD92/ZqX3/lWqpRme5l3+/P0gQtztWwl1ayzRPoDGEa0Ho+oI8XDK/ggxgiufV7XHVj
	d/23mvSGOhe6X0/6mlype4N5LkErwoEY3XpiAPbMSWe0Rce+FuiKqCCsSsC6bq2rxecGKiM5Grb
	GsVJ0J1Ip+hRQeq1P8EB4iM5rkWMai6Ev/Zvrj4V2HPNylOmkLHcDOu9XCZHfNtJfzZxPRl7jDe
	aktU/uK6tR8qRrAtmGbWpDbHf+0cGRowbgWvMOROdcBIhD4CFMkeYXbEI2m+X7XuLtQMMuiwoE6
	HKkAayxujd6Nk/i9nFkae6hlP0ECJ3AF3z2D98DA==
X-Received: by 2002:a5d:5d12:0:b0:43d:613:33de with SMTP id ffacd0b85a97d-43d642a63d1mr32016431f8f.20.1776257270855;
        Wed, 15 Apr 2026 05:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:50 -0700 (PDT)
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
Subject: [PATCH v5 14/14] ASoC: rsnd: Add system suspend/resume support
Date: Wed, 15 Apr 2026 12:47:31 +0000
Message-Id: <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31302-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E34F4048AA
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

v5: No changes

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
index 93cacac1c98a..19d1f301cee9 100644
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
@@ -2082,11 +2083,35 @@ static void rsnd_remove(struct platform_device *pdev)
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
@@ -2095,7 +2120,21 @@ static int rsnd_resume(struct device *dev)
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
index 39f43e935cde..fbec7369d8b6 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -1034,3 +1034,23 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
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
index 0d2436beb718..44a804f216ea 100644
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
@@ -803,6 +809,8 @@ extern const char * const volume_ramp_rate[];
  */
 int rsnd_ssi_probe(struct rsnd_priv *priv);
 void rsnd_ssi_remove(struct rsnd_priv *priv);
+void rsnd_ssi_suspend(struct rsnd_priv *priv);
+void rsnd_ssi_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ssi_mod_get(struct rsnd_priv *priv, int id);
 int rsnd_ssi_use_busif(struct rsnd_dai_stream *io);
 u32 rsnd_ssi_multi_secondaries_runtime(struct rsnd_dai_stream *io);
@@ -826,6 +834,8 @@ int rsnd_ssiu_attach(struct rsnd_dai_stream *io,
 		     struct rsnd_mod *mod);
 int rsnd_ssiu_probe(struct rsnd_priv *priv);
 void rsnd_ssiu_remove(struct rsnd_priv *priv);
+void rsnd_ssiu_suspend(struct rsnd_priv *priv);
+void rsnd_ssiu_resume(struct rsnd_priv *priv);
 void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 			     struct device_node *playback,
 			     struct device_node *capture);
@@ -837,6 +847,8 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod);
  */
 int rsnd_src_probe(struct rsnd_priv *priv);
 void rsnd_src_remove(struct rsnd_priv *priv);
+void rsnd_src_suspend(struct rsnd_priv *priv);
+void rsnd_src_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *priv, int id);
 
 #define rsnd_src_get_in_rate(priv, io) rsnd_src_get_rate(priv, io, 1)
@@ -856,6 +868,8 @@ unsigned int rsnd_src_get_rate(struct rsnd_priv *priv,
  */
 int rsnd_ctu_probe(struct rsnd_priv *priv);
 void rsnd_ctu_remove(struct rsnd_priv *priv);
+void rsnd_ctu_suspend(struct rsnd_priv *priv);
+void rsnd_ctu_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_ctu_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_CTU)
 #define rsnd_parse_connect_ctu(rdai, playback, capture)			\
@@ -868,6 +882,8 @@ struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_mix_probe(struct rsnd_priv *priv);
 void rsnd_mix_remove(struct rsnd_priv *priv);
+void rsnd_mix_suspend(struct rsnd_priv *priv);
+void rsnd_mix_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_mix_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_MIX)
 #define rsnd_parse_connect_mix(rdai, playback, capture)			\
@@ -880,6 +896,8 @@ struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
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
index c00c6f9f5c9d..6dc76839ef0a 100644
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
index 8fb0ec5dc791..60b58096531d 100644
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


