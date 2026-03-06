Return-Path: <linux-renesas-soc+bounces-28957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HKnOPXbqmkZXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:51:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67599222207
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22957316131C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 13:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B66230EF88;
	Fri,  6 Mar 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkI9fPu+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC50313556
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804558; cv=none; b=N5EQziGQF/oHgFqSk3yMpUc0hFfzV6q69TgbHmejSHPUbUjsHUAzaLW6TMUiM3imYbEIbiB5CGUCTqgcLuGsdn+hkl+jIhwbrY6nnyUgpLHEk8TSSzdaaJJag37iZm7pK0ED2uxcJZmf4jrQsk8vJ7oTajRuvQMFJeFthrfv06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804558; c=relaxed/simple;
	bh=S9/Fzkiyb07FiSnwrS8MQmvi6Fitnuo1uoT04N7PIvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUCaM3liFMJIO/tGDtkxso1rzjy0mAJnU89mxp33TjVEUROMuB6kSclhO89wNHf89fs8eaiASBJcH2cwQCNTMpdS8aMJ00r+fgFNZwNssqCkzddKXvKKTlr3e+wvQQYsMM1Do3YIhL+OpGFhnKQnwjUqDHeyKDjAyKP1Vnou9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkI9fPu+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439ce3605ecso1416907f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804555; x=1773409355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0Ng/uajvfzozXdQpYK5vG2wa/u2Xjabl4u/B9UNDME=;
        b=CkI9fPu+4f/I4luh/7QtYvHZV6uOXYAphvjNk8iEaWpTQ1lFjD0nEHbztDCihwdWx+
         Ee2j9SehyGjRh/zQ85uvtnuFohrI/k7JbOymNxt0fxPrLOobx8aBWDuJl6lFS3740LQd
         HCpLz+qauSHPZOnxvJnx2BCcdk+jSKyCI709i/9o+jnz0w1EFvn9MboUMViWVMD8evDG
         0vxb+9Imt3LqARayhWBzn5tGXX+oHdpXJ97cH9U2tvEzyu+MqFRw1ZLQbCyy8pS1QDR4
         jYzdIHxXxqy+fz+y/mVPf0jHtd8xw70Tn5dr2X0VAnJDviqpWjjCOQquC6tVIJbOxAeP
         Hd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804555; x=1773409355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0Ng/uajvfzozXdQpYK5vG2wa/u2Xjabl4u/B9UNDME=;
        b=HgnuVAMqo1RqS5kBYu9xlCAzDsUgxg/tsAthrw71klog+zXOVrFaCEofFKq55HYhxN
         TKz+dNSQHweIbpIKLTYhFrc+if1KCFClYbZ2LgFf2AeYgQAf0EY/Kz498ZwcExfaSdJ5
         WAKi+FnwEeam6rYxWFdVXsHaIcmEPZarJfsGtI18VMF2WkvA61fu2YTZD3HqAsrIM4BR
         MBvh3GbCOJJOEsA0pJC1t86t6LZ4riYYAdBv5ALf+zoJXZzmt2dieUHEz8Nw2MClu4x3
         vZlksEA9qK6L/DynLUp6+ZWMkTNF/oigIIdgXZMWbJPj1Ui9rgmtAIop+7RbZeaWfIdE
         UpQg==
X-Forwarded-Encrypted: i=1; AJvYcCVr1SpyTn2f96hKAOAV6iMoftD5DS0+ISO3KxyZUYNvGX6CXKA0WSWx6/s00L+FCrOl6/kOQgFiNTn2cs3OBFb39g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1EILXZOiRvquC462NpVC+BfpgI00Smr91Uskk7hXzyPYK4h0w
	hhWoptTZHYPxETuEWka/Fa2X4Lt47yPvE+eEXkUyCTasijJO2pOxXhsy
X-Gm-Gg: ATEYQzwy7ftfQQQIdyfOvlOSlhBxKAOd6rE4dz8OUL/g0iA+9YyCZY4EmI2tgJa+skq
	IEdw5UEQ9unWIFOm+ENtmAEiVL3ejK01Yz9wdYY7p3SupFDeUZERw0At/X9QAGC51RBxvwphg/b
	95Zpy+UUTSbMGuCn2R8f0cDmO4Hp7x2rM0hGJdnm8jWNqZC8UEZNDVQXl4wvVT+BdDxvz4M4m8t
	Fa46FEa7PCYdFCHpM12jXD55CqEYJorgbU1kfH95CEzYSOB/JJfe56sAe5+7/4WpW/yrnB5sfeA
	8+73TiiLTdjTU5GUwcaD8ye3BmZAC0VyFQqzpVekkLUBu1y35ccQ16uHvbR9d/RSOUbhyhHXZjG
	Px/v+PkA9vA9iIT2CSbKctTR3qdErQNgqjzVBx9uSDlm59Cv4MwffneOYBGuqI53zmL6AG1CybZ
	DDt/Loc6xtygWZ1DotvTjtcWwBI0qPW8cnxebaTVs2CoUv7n0=
X-Received: by 2002:a5d:6384:0:b0:439:de1d:74ae with SMTP id ffacd0b85a97d-439de1d7642mr933964f8f.22.1772804554816;
        Fri, 06 Mar 2026 05:42:34 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d0f3:534:36a3:523a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm4223790f8f.17.2026.03.06.05.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:42:34 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Fri,  6 Mar 2026 13:42:25 +0000
Message-ID: <20260306134228.871815-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 67599222207
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28957-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks may be left
disabled as the hardware state is not automatically restored. Unlike
regular clocks which are re-enabled by their respective drivers, critical
clocks (CLK_IS_CRITICAL) have no owning driver to restore them, so the
CPG driver must take responsibility for re-enabling them on resume.

Introduce struct rzg2l_crit_clk_hw to track critical module clock
hardware entries in a singly-linked list anchored at crit_clk_hw_head
in rzg2l_cpg_priv. Populate the list during module clock registration
by checking for the CLK_IS_CRITICAL flag after clk_hw_register()
succeeds.

On resume, walk the list and re-enable any critical module clock that
is found to be disabled, before deassering critical resets, ensuring
the correct clock-before-reset restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 42 ++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 8165c163143a..f16c3962e0bd 100644
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
@@ -1737,10 +1762,16 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
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
-
 	return;
 
 fail:
@@ -2086,8 +2117,17 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
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


