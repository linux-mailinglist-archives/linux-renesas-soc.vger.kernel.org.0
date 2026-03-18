Return-Path: <linux-renesas-soc+bounces-29733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bx6AY5lumklWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:42:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2402B8468
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFBC1301C951
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665B438B7A9;
	Wed, 18 Mar 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKIu3Km8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D338BF72
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823326; cv=none; b=CfEju/hTLdfIwfQyQ01xvhey8EkZKiwq81+dPC+WrQujWdStivry8bYKn2ysYHcNJK4KUNB95pjLcIgniFPvnJ+ZAy46GxKAyoAwgwvi3C91PvaP13tW5wVL2DLVXelrLnJwuz2hWEaHdnnxNYOwsqR3n7GyOnFh4pt6hX4E5UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823326; c=relaxed/simple;
	bh=UlVIEWksOGidzLhELm6FOhj1fA2LcWYuCIseKRxqo0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNZ9d+7jTkOtuKhQi8GycZ9Eaw0/E4YpNGzyEF/8J975MWD5txpbbshYEB818zd1dW9+xaArrG6UsEFUefTXVHVnyoowHobRcV6oV2zGICS76BI1qO2S3EyA2FZ+tEkeAVSvFtiT2E0zQKYA5c3Hna2POA2AASIzzwmOLuGYoYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKIu3Km8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so6454069f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823319; x=1774428119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJhdYIHEqHngGQnhgH6a4HSKJLQKsmBPc8Z152SEJH8=;
        b=hKIu3Km8SLbc3vxQjpbKWzeXwD//YeAIpAdj/5NZE2m7338LspWZkwVJgwQ4NIHOSH
         rFqSycvxQBWGTVF9KI/P1X5fvIvyuEkwxKSJjl7M7xX90+YkqkwWP3UIv3Pv19uE/4F2
         e4ynQaic5c65+66WGSBiI4HXaByF9S5VZOh05EBNY7Ro16i/s1fvvm9Zo3swlS2kfswL
         Mq6DO9XHpotiWQ618au09FUbQAFPBNNCSvuT5iLwIrBw+obI/HRo8hMo8h1ArQx/GNom
         1IeuKgHnBg3/4yeHakXdkgZet3ub8Ecx+3hgKLEKA6PMvhl4+oXiI0ewSRBBnjYfpfUy
         0Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823319; x=1774428119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zJhdYIHEqHngGQnhgH6a4HSKJLQKsmBPc8Z152SEJH8=;
        b=oFRv1c8DrLifdUgJFl2UHFrP43KxbdotGV7PVvsaDTbVgGlQpKWzThEz25klGXom5N
         dZD7SI8iitaEHVilbXg1rRM8RKXgi/yB9QlUM6zlYInuII/I9xV2aPtIjtQdIxGUmOY2
         JoyvrwuDOOzxpugNQLS2eZXHx16xL8wtRfPazsJhBp+60XQt42IY5weFia0YlWPE2OI8
         vCEao4XWik5CHUf4NxUaMkOpSXfGFq1fKZdLDEzP0S+fMWbzOAreq4nyAkkKgJ0mKT+e
         lnxJYU4kSKZRBBRDAb6UJD45oNzN0HufBFpYX+SCSHF6/2Y0ZKo57dennQi7D7UhiRVl
         15sA==
X-Forwarded-Encrypted: i=1; AJvYcCWwfies9DEpq0dSQPYYyrjq7zAEvrGWJCgGmxqPuiqUvUZZtXB7QMUMbbnOZjV1VRwzWWRXO3EWPGYtQGJBp81X8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoi7P8IiM7vAV71MO7/Pes2h8A9vh7oDNnG1ZcTnPBh0R6awSL
	0HIyWjmX+3WQO8haJ3ZaagnE7CYmCH3WSiEK2dTY7h40y+15yKIfdwr/t/YUAw==
X-Gm-Gg: ATEYQzzG33E3+1TuUPJnyhtdcqca39kneqzzrRCncp6OFXZl6rMK+RZDALXqNKIN3yx
	F2rvEY3UthD0wQMBMH5xj9j09PYb8r09SGkEbXCeoSfElxgwLDcj0LYmQOoNU5UU6Q6QHDEcsyb
	rf4AhoKULv9nwizWL/FWJkgLyEWtwaO7+DQMX4z9bO+sUABGO4CspfzidJ05Bn/1nimxLjC0jU9
	b6tkmLBDVbo2Z0iOIO5Tiw3pte64FPoInLib7EeLCAQLOsGe5055lzu+4l78aztvjpIS1h8hKjC
	AsNfB9R4RrlRaio0PBmHZ7ajNxamzHJDELyx9eZfUFa3cTpnwxo4+to+C7AgKa6sZDXGorSHU7F
	fIMIrsbVWrYLj312hkKBRkyPVCC2vUpDAQeuECr+Tmjc1U+rbfXSPE6d4RezLiV2dqur0UTLSYf
	8DKelEuAFNxiwWZnddvqgYn+W1SWRGL6BPf617pu2gNB2niYJt
X-Received: by 2002:a05:6000:26c7:b0:43b:47cd:8f6c with SMTP id ffacd0b85a97d-43b527abd15mr3693582f8f.20.1773823318724;
        Wed, 18 Mar 2026 01:41:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Wed, 18 Mar 2026 08:41:39 +0000
Message-ID: <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29733-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: BA2402B8468
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks may be left disabled
as the hardware state is not automatically restored. Unlike regular clocks
which are re-enabled by their respective drivers, critical clocks
(CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
must take responsibility for re-enabling them on resume.

Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
entries in a singly-linked list anchored at crit_clk_hw_head in
rzg2l_cpg_priv. Populate the list during module clock registration by
checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.

On resume, walk the list and re-enable any critical module clock that is
found to be disabled, before deasserting critical resets, ensuring the
correct clock-before-reset restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 8165c163143a..c2d31b93f62b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -130,6 +130,12 @@ struct div_hw_data {
 	u32 width;
 };
 
+/* Critical clk list  */
+struct rzg2l_crit_clk_hw {
+	struct clk_hw *hw;
+	struct rzg2l_crit_clk_hw *next;
+};
+
 #define to_div_hw_data(_hw)	container_of(_hw, struct div_hw_data, hw_data)
 
 struct rzg2l_pll5_param {
@@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @info: Pointer to platform data
  * @genpd: PM domain
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
+ * @crit_clk_hw_head: Head of the linked list critical clk entries
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
 	struct generic_pm_domain genpd;
 
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
+
+	struct rzg2l_crit_clk_hw *crit_clk_hw_head;
 };
 
+static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
+					   struct clk_hw *hw)
+{
+	struct rzg2l_crit_clk_hw *node;
+
+	node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	node->hw = hw;
+	node->next = priv->crit_clk_hw_head;
+	priv->crit_clk_hw_head = node;
+
+	return 0;
+}
+
 static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b)
 {
 	return (b + 1) << a;
@@ -1737,6 +1762,13 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
+	if (init.flags & CLK_IS_CRITICAL) {
+		if (rzg2l_cpg_add_crit_clk_hw_entry(priv, &clock->hw)) {
+			clk = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	clk = clock->hw.clk;
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
@@ -2086,8 +2118,17 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	struct rzg2l_crit_clk_hw *node;
 	int ret;
 
+	for (node = priv->crit_clk_hw_head; node; node = node->next) {
+		if (!rzg2l_mod_clock_is_enabled(node->hw)) {
+			ret = rzg2l_mod_clock_endisable(node->hw, true);
+			if (ret)
+				return ret;
+		}
+	}
+
 	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
 	if (ret)
 		return ret;
-- 
2.43.0


