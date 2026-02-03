Return-Path: <linux-renesas-soc+bounces-27808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAAGJM7VgWkCKgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 12:02:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E500D80A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 12:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB7443048079
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 11:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE6A32D7F1;
	Tue,  3 Feb 2026 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3Fx09ia"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D82322B77
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116547; cv=none; b=ndN8kQz0CI5mbiWCqbi34ou0McTIvsX0NXmJUUxEMpgcCThMXky6XfNBNns9McMEdfhmcVXK/p/LifBM0DC1FTZ6iJCsSiFOZhvaUOhk4JUi7S2Rs1NXTJ+7rDC969ffHP6SHya2y8d2ZKmcepCGOopMLYppXPJ2RfhO6AWrXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116547; c=relaxed/simple;
	bh=vOflt+atRten/Nqst1jjUTFAZH6JuJBciL+/IDQ7kto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siaAjosd0AOI9mP+RUx6wK7JBu1bVWrBBF+9SqAPz0LmvsxXqbpJ5QnY+CBDFJMtAQo/kI0kEddJKcBJZ1oW61zgOKmqSJDl6Kc9YDde0GS+QDh8Q03Jjq+HM0oW1+OlkCKhZTIH6QrTeWDPq9yVahoCJo//Mv8UrzvxK2k7qZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3Fx09ia; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso46555595e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 03:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116544; x=1770721344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTOB99JSWbdOr4Zx2FpEkBOJM3Ss0Vn+3hSwsBCxk+E=;
        b=E3Fx09iah366lXACKYr5/Z4PFlHVFCFRtki11D+uj7pSPtWyz8FXgr0h1jg5sxtyl7
         MQ+4NIv+G5wGR/8GPDtg42xeS5/3kfCCcSRsqVJI5sBpVhsUkIR6+xg58Dtm+0Wo0RWJ
         qcit3rPPXbAmJmDqs3wLxrFa9WEuPh6MONII/2oz1u7M1cbPtlbpdfRm4a0KBOh9sk4t
         vYnCGSj6crVE60gCLh4mCsxgs5TaU7L7k/f2VBJvo1E2KuUvntDGnAWYBMBg6ZB46WHa
         05bsGCRPXb2L9sC/s7VfDmnxh5OMyl2/FNAAKskv73QPNEbkkZyE0cLtlgE8qFgs7CH5
         ehzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116544; x=1770721344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTOB99JSWbdOr4Zx2FpEkBOJM3Ss0Vn+3hSwsBCxk+E=;
        b=GWprOovkdZgXM9dTnLeaEYrsLLtO3ytnZpDSZ5efSFMCt3Uxw31xKwmmLnX0hwbYvU
         lwOjw/M9CVtMqhdlrrwYB7/h+8RBuyM3tjk59WO3iPU84UpM0p4UllSyASDipRYKuNIY
         ce9PkY75yZcquv/6/PQOIOwGIPuT/D39VcV3uPpfA8pNRE/xGK4vQ1P53tX+ftJuR/0R
         KVNoUGjpzdHMzHW7OmfodmLqGBoPrxe34hsEWHBUDEzeAbE3iuVp8+Qn9Ls+voDroO3j
         1IpIiuF1mrM82rA4rL5Z1/9ITHTMr/++2aoJgYNtF1QrGeFhvA91hjjFNomdcDwxhzYw
         mgEw==
X-Forwarded-Encrypted: i=1; AJvYcCUodaycwOw1F+Yv/Rtk8gbyuQmwkxjv9hkYNHGGGG5S2Fk2QChENaEHLp1Lc4Jv/aGnX5xx6652T5lN2A2mi1phJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgqJYVfiX2T3Rb2XquXMODXhIBnoL8MDY9ka7xW5JNB/v5Z2W
	lzL35uVXotjNNrGWckJmVw39NQqnVvEc5a6QcSVAkrQqQXW7IZJ+TVI2YQRSQU3Y
X-Gm-Gg: AZuq6aLntQGLLPbD0OsmS53oBbZwDL+r7zLvGtc4e9jarAj5IoL4r8qbXGWxMqpYs1H
	p8MlKK4kRNdKDg9nwTuVqLGMXKN2r2CX7JkONDltm76LzgiMy/8aXkJY5aSuZ9y9kcMnD38rQAM
	9LFV8mDpnxqkW6bqArrEoVfGOzNIK+nCtW3F3TL15vgopnYQW/jvSq3JOkSVsKufuLdKCQaT8BM
	E6AMoLquF7LJ9jgNqQR1RvJQYG8/yjOZiqvxRWMQllmAoZmn6Te9K0IQz8BB7rJpjccFNuKdIsk
	/bUHmc5eXZrwWI+oli+iCgANkHSrA0b+EL4jHRaFiCrdcDGpuEUtzmsMXmhl/333I0HCPHOYBbu
	rp2fFx45Mjo6hCJ0728d3jjmsB7gIkuwv80nOyLdbrpB6f8rg7Z8oJHOvmH+w4BMn9yD+r9AKRD
	K4z8MPYQFQOZ1wXI6eTw==
X-Received: by 2002:a05:600c:474f:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-482db452587mr188088265e9.9.1770116544355;
        Tue, 03 Feb 2026 03:02:24 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:23 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Tue,  3 Feb 2026 11:02:12 +0000
Message-ID: <20260203110220.265748-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
References: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27808-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 4E500D80A5
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3:
 * Collected tag
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f4deb5d3b837..945e31c8f161 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1107,9 +1107,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
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


