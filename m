Return-Path: <linux-renesas-soc+bounces-30152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEOBNqV6wmnqdAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7E3079F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A461308FA8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DF23F54D3;
	Tue, 24 Mar 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGhtw5DI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497953F1646
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352626; cv=none; b=Dt6exPJjksguTjiuT96eZWW4+84YbPuqVo61nmOE2ZjskEDb6woZPmjawlCl9Vum0/7waxFZzbFAdEL45rYAXLPmPkQvfSj+F0KTj5bmFnUq55YiwZk7Ic6WgwrY6zyLyuIQCv4GwSXDBUkP2pUjS5JCzGuflb2Q9HXxp/XSLw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352626; c=relaxed/simple;
	bh=Xw5RFpWv75CNtpmH6n9yaeYAZIsgQZPNvujNLcem+T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmaZ4ZZVGBYPGWfK+EYiaPfsY0+sZgFNVtHZ91y8dWv9IW7U74Sr30mcef85EwCLhTzO8XbhLB/+SWz3zEH4GlexZ8/jbNH8cIJupabh8kO4GgmwJsv9sPJKLUFkydqtRDvVCgmQEcTubwrU3kMWi1OXmuidHsYFqE4lAfT1dNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGhtw5DI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso57787575e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352617; x=1774957417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GxufccZL3VoF+NgVSCi/f2xFeWD1b9Kcts6koYMzRA=;
        b=KGhtw5DIHP9p0uOeqTseJXXYBaTVu7cBYBJdvnOZPycruQuO+LA6qien+qzrlf2MEc
         Mnc9+bEFoBk5pD0dSEHNq05PIoOSAAEGNs6FldcbbTrq+ECfUCZHyen4Puj++F/QtF7r
         qSEp2r5fH4mY+RuDnx/QNHY432gwGD8GIH2y3lVqU7LOerCuTZm00nfimA1nYKZ1cFW0
         aEPhAq82le5HCD4HMNNwT0CwN9mLPZkQPy++1mi6A2DhZH//OUza3q1oYD0M3TaFQoK+
         51HrxreIqJDNS9yG6i47/Ikon41DfkrhdOxXo+DC09Nam9K9OLEbaJnd8WFI/hMj+GNW
         r+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352617; x=1774957417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4GxufccZL3VoF+NgVSCi/f2xFeWD1b9Kcts6koYMzRA=;
        b=bGGQOAvfEqC8/rhRR7AgztdKkXEEAJKI0G4HVD700gVGG6xivheZy5T4eeqNeHEtme
         p9lEcSbYgqN1xGhgEbzx87+i2OviezlXqTfFt8aGqD9If6OJ3JmJFTzM2plZkJVO78Eu
         MdS9KT9qvJLd5X48hEqwbp/Jyw1HJ6bMH3U8k1P1nsAM+DB7D4vM3C2eU0GO9WV7L2hs
         IzEYD0Ec+GHhg/eT/8dnux4GwHe0qfZoR7EIuxvRrpj0fgI8zLnvH5Jv+YRMujInr2We
         m/7tNX4zFNV50QAhDtESY2LKqMtlFnpmCxtlNPnGQVqtjyGUL53fLuMZD/nup/DWKxNJ
         4IhA==
X-Forwarded-Encrypted: i=1; AJvYcCXuinmwcvxtH8rE5seIUWIH5apaM9DxvQ2ZVEQY3x8f0zBdzd7MRU6FGZX/2zw+Ct1S/m077Ev0kBLpJ1UCj51JAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCaSuOFb3xI7FzIJKFpkamrFdLxc2k9ODoN5P6qQGr7Xe/pT7
	z/k7It4F/OJl0f262It+85KZxqOZuZAORSjwNpjVPo9OCxF6gwPgn3ze
X-Gm-Gg: ATEYQzwCboET7bEQ0EUiEhkxRgxtyAFQV3wytNb7dcV+YRvXrJYd2sixPKy8rad6NJm
	4BTJzH44ezF8CN5hrfAQ96crgKOKZjNgkBbRAi5l0+sMDCx5kxzYDktD2kGTsUV2C8IQx4Sv5O1
	D0rgSrYyDN4X4Pm+c3epd167cbZ0wfsen4lqhiGPgQI8xZ3sAIAdyMr1gEaABt2hHDJRd7BJP1z
	JeRJknUokDjcBaKjw38YnQ7sHYLTNxLBl6nWUfxL5UXKVd13ptaKsrg/xvmTt9XlVJg1CyJuFny
	fujqU6aBb5sUQRsZCzFHo13PWQChKOgsjAirJEjHzsabgB3qAztDS34WYB7RF+7KGk/4R5Xfhu1
	q9Fy4tRSJ3JNzTbr+1CMTcFZGaFFopX+buSx9kcGF+LhnZsJRRrvdKLyutFuhbvXutW52qZEjZQ
	LqAIHxCXx85mnLLhvLGLmnDP9/HjhKykKDcS4aOjBgiCaPLOdFyYUkRKN9gFw=
X-Received: by 2002:a05:600c:154b:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-4870f212c1emr45412185e9.13.1774352616978;
        Tue, 24 Mar 2026 04:43:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:36 -0700 (PDT)
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
Subject: [PATCH v8 04/11] clk: renesas: rzg2l-cpg: Add helper for mod clock enable/disable
Date: Tue, 24 Mar 2026 11:43:09 +0000
Message-ID: <20260324114329.268249-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30152-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: BCA7E3079F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor rzg2l_mod_clock_endisable() by extracting its logic into a new
helper function rzg2l_mod_clock_endisable_helper(), which accepts an
additional set_mstop_state boolean parameter. This allows callers to
control whether the module stop state is updated alongside the clock
enable/disable operation. No functional change for existing callers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f9e4af7f49d0..a38401c18dcf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1439,7 +1439,8 @@ static int rzg2l_mod_clock_mstop_show(struct seq_file *s, void *what)
 }
 DEFINE_SHOW_ATTRIBUTE(rzg2l_mod_clock_mstop);
 
-static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
+static int rzg2l_mod_clock_endisable_helper(struct clk_hw *hw, bool enable,
+					    bool set_mstop_state)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1464,9 +1465,11 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
 		if (enable) {
 			writel(value, priv->base + CLK_ON_R(reg));
-			rzg2l_mod_clock_module_set_state(clock, false);
+			if (set_mstop_state)
+				rzg2l_mod_clock_module_set_state(clock, false);
 		} else {
-			rzg2l_mod_clock_module_set_state(clock, true);
+			if (set_mstop_state)
+				rzg2l_mod_clock_module_set_state(clock, true);
 			writel(value, priv->base + CLK_ON_R(reg));
 		}
 	}
@@ -1486,6 +1489,11 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	return error;
 }
 
+static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
+{
+	return rzg2l_mod_clock_endisable_helper(hw, enable, true);
+}
+
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
-- 
2.43.0


