Return-Path: <linux-renesas-soc+bounces-29892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFl7K3Tyu2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:56:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AF2CB7CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FE13206A5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600AC3BFE3C;
	Thu, 19 Mar 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhnSYnwC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7E3D3CFF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924715; cv=none; b=pyjCFb0ajzCysTY//732KJHC0v0E2SnynwMHJ53mPF2MN7w8Z4ipN+T1zO/lcy4U/+YkcCoYRaLf4a8PxeHV3OAJhlsdZ9paf8+8XudHiZOweFAXriS2Joa8oKEOoMrpbHqIaSYrWY6mRH+/CrO+NotlfXTS/vro4+1upDiBe4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924715; c=relaxed/simple;
	bh=yv5O6L9Osf92/NBhnnaAVjsGxqrRsiIBhDnkfv5ydsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uln9+eIjMliBFoVsl6JWUX5VuO/uVGl41LjSzMT5c4rREbY9XSBnyGvmqYrp68ZGjTu1frtFu+4yEylCLy12WA0kAhXsNXu4TXXBrZGX19itWa251qWQSbbiMwtzxtV2es/4T0BeuS7b6Ar+XoepiwpT8ZBcrHK97wghnlsokP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhnSYnwC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f454be5bso19766885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924710; x=1774529510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZNm9932r7RAgrKS/m/BnybmtJfLPaPBeO/K8gitoiQ=;
        b=XhnSYnwCDSnQkFPdCjLtqHuBrTBACsPWgKZOIkW+9LxaZ+FarCT+BQkmmYiunwmIIz
         n/8O8aGCaa52Qz6TFp6+ZEfEqVA9aBzb4OZ8EmHBKxLTDVBfK0pNtrKV8y4Pu5IcwndA
         znpNGmcimo1e0qqbMiteYc0XKg2mlcvoiKh9GCQiN9ZjzTf7O4Tuwr6i1TSbv7TGr0bN
         7NQt4SHmdPPjiuTQdooFW0nx6okkFT6YYSln378y9T9uPfvEZluIfoj6+vB+t5NNSDJ/
         fqfGS6P8qMJPwuRSZpJRLWs7DROD3hlsezBfl4DrPu7VKqZsTF6TeX6z43G9NhBUR2+a
         xPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924710; x=1774529510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZNm9932r7RAgrKS/m/BnybmtJfLPaPBeO/K8gitoiQ=;
        b=CKdiGkxNql/4IoFAnpE8t0E3woxvVBszCnI0hjkfEfE3PgnJj9DHTXCVjkU336ri8N
         LDziSKxf4V6Ep6MM/ra6cCD1GOpOzrBL5SP85zm/A/1ZQvOHk0lj4LPOizHqIp66zFLB
         cuToapjfgRr65zfZrlcZAFwh69xzv4byolLRq7Gz5i2qQEqxCnYpQ20PI7QVZdKwU/yk
         inDJjtqvToDz6JXilUWGWATV2nO+njsWgriZu8o9gLTGiDVwnAHcZAS6ifXUmMLr+QpN
         2NnEVCYe92G1KFfqiujaUJ9FkOmw3/5JKDalIKCXQrJ2O6wHe6halpDbXT1HdZ34mfSn
         U1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXmPlrO1wReICWtplNqSEaeVzXiNKx0zh55PQmJv0gb22/LlcQ0Hdbpr40ak85L1H8nw5ZY+eKnRqvUovSjxrVWBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcOz6y+d5kGL47hTTiKwyQEAAEwNpN9jAwitF+Manxw9dBLk26
	lX1ekd+bAuhNxu7DSZUB4TxSUPinPMasKiOp17Dy899AZIvKLoexpcl0
X-Gm-Gg: ATEYQzwMnUZFDqxpbD++hA3fC1VD07Bzmp9REHoG1ZUqqzh3/Woo7eCStGByfwK+VQd
	A17ZDz9CM4G3rPSxve+MbxZp6wcbYbIbK49oQayPAR6M1SGzchFbnDTaz2VxKaJigjQlaKt1mDF
	nKyW7EsPzYDuhuZUCo7vNUzYXZpLnAigF8+TWPUaP6NvIrqZeBV2eygLBf90ZlZRh723y150KUh
	+i2J1yhqKqI1GOeuHDoB5bvj88Tk9f0TFhEr70WpqDy7amwMnsolXaUjL2RT4ZKyuIkpMV6CoPp
	D89gqBUE+f7vfXU9Jx4Sp6Xq/tv0i7u30z3U5rvZAq1XcqR4YfiJN0rVfrRMxC8/K36M5XbNX6K
	SYHygz5BjOumCnGFRA8M+h1xarWYmCu4p9C0fga0KXGgSYwS5oveBMQBer+bH+Q1ILznvwbuKGk
	Qk3zilt4FT5AASj3BV/T/7aiVltqoHHkM=
X-Received: by 2002:a05:600c:c493:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-486f8b32877mr58559885e9.8.1773924710251;
        Thu, 19 Mar 2026 05:51:50 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 05/10] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Thu, 19 Mar 2026 12:51:29 +0000
Message-ID: <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29892-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.717];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 353AF2CB7CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
be left disabled as there is no owning driver to restore them, unlike
regular clocks. Add rzg2l_mod_enable_crit_clock_init_mstop() which walks
all module clocks on resume, re-enables any critical clock found disabled,
and then restores its MSTOP state via the existing helper. This replaces
the direct call to rzg2l_mod_clock_init_mstop() in rzg2l_cpg_resume(),
preserving the correct clock-before-MSTOP restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated commit description
 * Dropped the list implementation.
 * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop() 
   for enabling critical clks and restoring mstop state during resume.
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b68b0312f0e3..7899c79734e1 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1600,6 +1600,23 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 	}
 }
 
+static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	struct mod_clock *clk;
+	struct clk_hw *hw;
+
+	for_each_mod_clock(clk, hw, priv) {
+		if (!clk->mstop)
+			continue;
+
+		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
+		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
+			rzg2l_mod_clock_endisable(&clk->hw, true);
+
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -2095,7 +2112,7 @@ static int rzg2l_cpg_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rzg2l_mod_clock_init_mstop(priv);
+	rzg2l_mod_enable_crit_clock_init_mstop(priv);
 
 	return 0;
 }
-- 
2.43.0


