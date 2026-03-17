Return-Path: <linux-renesas-soc+bounces-29658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHOfK6KzuWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:03:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 576BD2B1F64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4B23194A7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DAE36606E;
	Tue, 17 Mar 2026 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuAnWhYv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6FD344DBD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777421; cv=none; b=V93ZGabTSvEj4D5QeVnrfX0/U/VKB/wF/nlD8Dq1PfkR6DQi9SfMDKzTKsyK6soCGWv/tr8BbxKt+mIReipM1DyIlzYmGo7GZrnJgxOJk2cZrfvYXPn4XP4a2KMHpj/QXG5TL9xLYcoHMCOjby+ov4gGkqpKSzaAbLOD9Y1XDWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777421; c=relaxed/simple;
	bh=/pfeBRZlSAeIZP2jyTAgG02IfuvKN3sK7yiMk55tNm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksfV2xM6j42nPQsJ2pe3ErR+MKiEvGt3QRVR/taCKIRV1u3mz6suIB06ScqAax4200S1JWmkEf9q8E8mXDS64kSdaNhHWdGFv9qM0qL2VQZy+gGuz0lvnbL0kKR6IK6A48DuwUUdt1PbRloR/6jH303cqwWG47XmcVtq7U8W/WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuAnWhYv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso6074027f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777418; x=1774382218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=CuAnWhYvpc5/KS4Veot31dAxGCS3Ok4Coi0J7DrJZ0o4HoG2BjYX/33PIhg+O/J5mu
         0UhCeOwndahi5EmL+UhGb5DHPixOV5XE+IkG4cnYTO7yrwAoOAsOz2fofkzw2L1t8mMa
         FTSDlnUtCm5dd7Nk+DRSEIZeYA5K9pOHwLLRg3nkehaDwZaYbZxndjxwCby6qKmqTLQk
         Mhcz93BXN4wXPs3GAh1kZFfdDTZrpRe86fUq1qYLCxJL7vx7rc/ZJ9XCQ0CGZHteAxRP
         mOhCF/QKwFCGBt52Azj3fGPAAET5alIMe7oAMqB/T8vx3qdA54J2jw/IyG3VKV6e/V6+
         8jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777418; x=1774382218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=WcbegS7W6LdGiuugOYo3+smrupaxS6J0zhlVVlMEjlaNSO+1NJYILN92vDe68P18My
         6ykCEj4sgaY7B90iYIpUifAREXJq/TvqeEfg/D7LAIYJmo+atV15WV2/K/zDsLC32oJk
         QMEAElhm6v/PUtqixk1BYh+/RuZ3i3xOU9LHaLZJM6dAtWq2qLhTzT9gn6La0o8TWMUw
         77TexW8tMTQ4DHzMFVhDIdWI9z18vvZNLUfIxN9QuSpCTiNuGqTmnRoeeN3akm9FNgDU
         +wPg9HuZTCKaK9yucUdafZlU1PuSgSR6EhrFhNriBtLBt+5HaBi5KkqsoO+S97Ejudi2
         qN0w==
X-Forwarded-Encrypted: i=1; AJvYcCVaRq5ddTxLXT4TCHPvJpfaFK5r29fB0uoJRnpFxdr0PSjfsDx6gpmY1XlpG4qSTrf1AoDwbomGkW1ATa49+1vRNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwucxXsKqUEhc1OxR8G9KsNjVB9rx58+rrMTtVJViVztt0WOmeK
	WQnj6c9C7iCePRutCSMOksQkeU6AZRBiGgfLEXpx1faCZp3VXVcIiSKJ
X-Gm-Gg: ATEYQzzVBhuz+QPDfcAnmiPGKUTWEo8qnFAtlhTGsyn/JP7WJS1dgGOcG6lBfhGXKQY
	jJ4yNoZzDP9y2/4vhAtn1Nrh9hQytEDcPBtAIEQNDiSiOMCQUq3te5ST/e5xUN0iD0cbE4znyHu
	ouGHAU+8HEmQKeh5s2cO2IZS0B+UejskrAt5zg0oTCLMKONAUKnNGQzdG3LYDZOufWKYBqENG28
	XWzmwD2+5EO1946otvhUdXyUBCxoiLvg+C+kMmIING8pnUBLEhVpCPLCdaCQtzecq1n2Orqxrs0
	ogKESNePPFuUk23HYe0T9v4AEzoCW1sjAGWtfEbE9O3qQSfn92QGuvb9SUBZkyqcvkBDURb/+1Y
	eKpJDiT8KjGt0PZhkO2Qss0w64CqlajXKjfi/qoMfLizS3/RWOGHpM7F+RdktprebRq80x1NWSz
	uO7+idJmBGTYxL44xT47+GlhgSOAGDfDnkuWef5LKoVuV4N0Dp
X-Received: by 2002:a05:6000:608:b0:43b:4489:d450 with SMTP id ffacd0b85a97d-43b527c52famr974355f8f.30.1773777418084;
        Tue, 17 Mar 2026 12:56:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:57 -0700 (PDT)
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
Date: Tue, 17 Mar 2026 19:56:33 +0000
Message-ID: <20260317195650.468330-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29658-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 576BD2B1F64
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


