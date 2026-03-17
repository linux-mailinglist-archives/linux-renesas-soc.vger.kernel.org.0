Return-Path: <linux-renesas-soc+bounces-29652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBl9EPSvuWkkMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:48:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB42B1B7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C29713094738
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0287E2DBF75;
	Tue, 17 Mar 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSxKhaTu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B44285C88
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776851; cv=none; b=Kj3iJPBk4seC9s1NuASkoprcOPTuiABpqbS/tKcNVUobP05IOyUCLcHspm808wMXao+kdi6C4sEiZ7Wjds/xp3JejT4R/UcsBYE1TyWE5UMLz7hI54Ev4t8Z3RhJPREc7naBTziOfkmQyxLdW35xL8rcpoe6IAu/OTMlY9zGXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776851; c=relaxed/simple;
	bh=/pfeBRZlSAeIZP2jyTAgG02IfuvKN3sK7yiMk55tNm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OP92JnWyfMby2SzfDVr+hVHQq2BQaz6yhyfA0QjlMaBGBzNwXz28c4b7D8s+GaVfwgdYtH79qrltFonTIe4L0eqRlDoEh6k6UpntgxgBCmCpQr5na8Y6GxezeI3r63yhWzoD4ynyrOi8gnf3utk8M+bIcNGfDuUp38pClxlN2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSxKhaTu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso6084434f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776849; x=1774381649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=nSxKhaTuBRv332k9NLLC6N8vRMBXs0T/TkRV44UQLdIMHxp0lmd9zNmUA/o0GfgFa8
         xthlPMoCsTXg7zwOtNcoiESj9775TglTA/swuQAsRzeHNZ2mZfzDT3VBHU7yUn+YUdDI
         PLQ6NODpZQoccnTJwzcKp+cfnDm1uUAJ8E6FzX1NmjPQlwHktgYgFF9EhEXfPOrzJP4W
         f2BxvVs/7Onsbse24WeavEiLw74p4fXg9avfzRSpKxo5cbrJzdUpERx4feMn1XN3l0Bj
         N04qOEExNjkjc/Et+NQBuMnqX2s7OVxgD8/GmBUvTgYIcHteaEpwb30koarVl0mSC2DI
         T95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776849; x=1774381649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=ih1VooGEloDwXKjhqml9fSSqZVdk2RS0W5cZsLZHOpbfxG1Bc/u7RAs1mBAQssizEZ
         wNkLC6PGlU3kwcKSjROuwH+qRDxebwGoQOm87Zz0hsfAHYUxC2poK9qjggR+69dnaFLv
         95eb9vAeVBJ67jXBYqtjJmTV0N2iE2Xo1cKSMamzLF5JCykKKk8E0udajCE8lD+MQwWi
         1yNRSrPb+xq8q36MsEQzAIkKCapbarbC0HY9DV+Cd+u8C5pzsalhVgBiHnF3/yfGjS7q
         bgsP9BHnzHIWtp4He4ao1uTDPUXGhqt3KzC88qWQMb+AE5S6CD7FlFBlJeTttRncln1w
         c9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYt2UTRixC5kM7kCK6hv8ZE0mlFHO1eoqoCoV90jR9HgNDutKnEj+j8G8NiBgJUPbkGMQJuTB5Zil2Ry/eEh7IIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6nq8LYFaOtIFht0j4fHu+TH1P+hrHOuxbo2Zz9wD4E0sY8dFr
	sF/x8z+E42/FD7502YosQ3r3Ng+JirjJY7+MH2BbmEQTSqiznhWzvi2g
X-Gm-Gg: ATEYQzxehJprn1YUdjSBypy9QUB2JQ0cZirG9uodeSgSYTMoG4UlEAwt+Lebq5GnXg8
	UKRnoS3vR4dj0EM2VHzUmGmSI1mU4mXcf0MD37MJn1h2lxPAzsWKn3rCMaQAb06oXuxBDaqQAAr
	FV4BwlT5PjO1DpFgGas8RI7IQFkre2rEHDsU1RfWXUGiclCk/XE17jT9wB7bH+feEqLgyVur0G9
	r7G58Yys91OhSGXSIsw2GtpjAMlYvN8YDfd4pMKJ9Sb3V60GYSMqhzkvjnbWksd9fix3zlKD6+N
	pzWm/0V+E9jAG//vt2net+z3ZF9LNP+1wNSygDCZC+Uu11Ih6Y6N6/MmdyVHRz2NnIdlb5q/j2u
	77gqe7TS3szFSgnt7Bqe1utEgQnS2+OltCWvV46/gLHcAY6fHv6YVGiBY5jWtBTrBuFVgn0kVKG
	+t4Uxjt0cx6CupG981bWA0kSQKAtYy5BjstRIjHjaf93IMXZGX
X-Received: by 2002:a05:6000:40cb:b0:43b:4f97:9608 with SMTP id ffacd0b85a97d-43b527a7368mr921067f8f.14.1773776848667;
        Tue, 17 Mar 2026 12:47:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189970fsm1767511f8f.27.2026.03.17.12.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:47:28 -0700 (PDT)
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
Subject: [PATCH v4 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Tue, 17 Mar 2026 19:47:22 +0000
Message-ID: <20260317194726.468270-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29652-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6BB42B1B7C
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


