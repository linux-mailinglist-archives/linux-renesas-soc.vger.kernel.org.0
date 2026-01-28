Return-Path: <linux-renesas-soc+bounces-27524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCwXNGoIemkK2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:00:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C994A1BAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EC65303DD7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B9C352C20;
	Wed, 28 Jan 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/tU4+Yf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA59350D76
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605140; cv=none; b=jDq3K5CWXqkfFmeO9Dv71pvuIFyryarIMfcZpHY0y3CaGvjblw4dPEUsJssSikYizSfDzLhv868A1tr4biiqfrdMJDaP8PD1wH2W24hq6p9RErKTA7Iylj6YiPcrJ2iMUTSv+U9OrkWy8ndaeGxNGncOcVcJpvUcuONd5oiYygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605140; c=relaxed/simple;
	bh=7YFUtgelMFOVKpyb9ypVosVyngqWrClp0du9dlcbdrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDUjLTDghlYc/2Oa1KjBRI1uYmJabAwd81gCRKBw/RkjXKgmb1FrkREkJRSRMW0crUuzComqDeo5FYgAKlfjTu1rGvE8ae1fJiotMP6XTEt9PFvVntBjibfiHU7nu023I4g4XaKH0X6qFkMp0RuznX09djH5jHpr0OSg1jajKYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/tU4+Yf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so897152866b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 04:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605137; x=1770209937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0g+MkC89noAM8Vt0NYxoywKe+JcvmhVaQUgnGdd6tI=;
        b=Z/tU4+Yf/6hMSM+v+WmPKp+jhNi+s6t7nDYi377Wl27ibFvUJndU15+5MEYigbr06Y
         mrHYmmb+8SzlEocbu4zyqHwMNqMVFrwCnydjwe0ZDqz1RBxwoB4tbZJmuJU9jnV+dq6F
         1kRBoaioQpQjWxpoKO8tCyzmohIaUcwCFWpSntHpPgTvMPen1Y3utwrPUz7/6wnIYIc4
         /r7FlxnORa3krDthL8qAcUqHQDVA2rmRve0DC130oKq1x2DndJFu286rDqhskgzy+sxi
         TbGjfMwRIqL31vxrBJ9H0HIZkx3clvux5e5WxbHbrH8SwBhMw6aT4fKVkXKj6TEpHZdH
         VAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605137; x=1770209937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0g+MkC89noAM8Vt0NYxoywKe+JcvmhVaQUgnGdd6tI=;
        b=fs5scmtMis4ObPu2EqhYt7sVA2Lw7aTLZPzsV2rYUv01+XzSARhxPWIgxyq2zCxOvF
         bgNsyiZXu/dltwjbXGPYYy3W62bxCQ9NRUc0vlLnlIjPjQrKpnEkTKoA2d9mRySklQwv
         KpQd5lLF3gjuYkKmtHXpC2oV/InhKd8cen/AKDJZ8/ER89ehVkseHtyFKFNhd8m9ne2e
         0KiylDKxyNlZMHrDUi+ayNc0aMka+7On17R9oE0Eg3462iDU+4zNuZCwplSZX4bQDMov
         ejI7SRwAJG1/j4SJD1a/vvWUgXsBAOvj/ZmrDSczdsH82BGeOpIloh8sy4ANrq8vtzZD
         Kv4A==
X-Forwarded-Encrypted: i=1; AJvYcCWy1f6F1JgJVCG3z2vQ/uXNhh0EatzT5f1Guzv99esXVn2cUIRYUz3HOlfQD0vdwv85t4aQdnsjNxetta8aRGKhzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxRytbdl7nmQ+9ozEhnTOeCy/AFYsRPF/yhoqC2zULVylrftu6
	dpCYt8AG1zpxuvtuh3MRTUcgnxyyaCljvsVt/YGiPEw6HX8ajHz+1x61
X-Gm-Gg: AZuq6aKB83curJaChBsXcE3/GPwL01X0/D1ghCQ7LJpIjtYXSxoG/vjE7Yc7LaQIPku
	1PdHeYERoCU3ANaNSeqg/N5UO6tT5weon1cbPxveXV6BKq/w2IsC6W7aJgoiQJ2Dh8WkA0w6Ku3
	f/caTlAl0hSlVEH9ddTNZWkvkf0WJnqe1/C4Rgb70LLyujWdJdhnxkt7vJSZy2rdPaKfliVhZCg
	c5A0APxyXXN997kG39iEd6M0kbVJbfgBEjoxpr8WJ9if8DEEWQ6zPgdwkJRT4/ONDynVBQoIEaq
	b8vq03c9SH+j6PV/HH4ue2p0cyrOh2nkgVgE2sD1nz0QRCz+DTkC+q9E5pk8creFZlTZpwHsl4g
	Cgh1c2AGs3OyTTu/9xu+tB3cEuiESmeUYilVOA3+9YGW+YsUS6fD34WLnGwU2EAcWO8DmfErXXJ
	Od6quhY/i+YYJLdJSXgHLBaDIMr+KShnRmHfUzBdqdXMGZsA==
X-Received: by 2002:a17:907:7245:b0:b88:5a44:fe27 with SMTP id a640c23a62f3a-b8dab33cee0mr379789366b.42.1769605137055;
        Wed, 28 Jan 2026 04:58:57 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:56 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next 3/8] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Wed, 28 Jan 2026 12:58:40 +0000
Message-ID: <20260128125850.425264-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27524-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2C994A1BAB
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 16771a0101bd..ee92d07c6ff7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1113,9 +1113,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0


