Return-Path: <linux-renesas-soc+bounces-30154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOFqJ6h6wmnqdAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452E3079FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1879308FF84
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BFD3EF656;
	Tue, 24 Mar 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/otXvN2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A363F2107
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352626; cv=none; b=l0gZX+8m7x2qV+bcqzLjUHOcMiyu45MapRr/bJHiXgtKSH20qyBTPa2lD8+0jCBCCHNOBRRTiWzo/lpZphJPlMlXHR3iWj12GF3lAFlAv2PLo42e2sbAHaGO4mx/ZD0UQynNhA4AYTCmaXgPttHqwCuU1qBHLZPH/ZKhsrwRzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352626; c=relaxed/simple;
	bh=H2fEHpybBLkHHbMdo005jZoF83+21eGUWFFuQTrSrhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVMphQMjstQmG+vdXz6C6G9sXl4pppdPk6bPwY2xErSdIz+FvZhZuBT0lquDZMKGRXxINYndAkaMUoU0a2B1cGHKtZSV/AnLs3GKxFVL7rltD9/NC1QW8R9ZD3ex8QUNzq5C3RYAfwT8GL0XnSOvl1pYXE1gcJhZBBNs3rEGrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/otXvN2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so41180445e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352619; x=1774957419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxpLZewpBHQBH30KhBV9xXPz16M7OH2igp4cA1rTclg=;
        b=O/otXvN2YZ/ULA1ZCnHq/ngBHImRn7DaknCszOj0HpJtE0R9XsuZbZp9kE6SZJDCAQ
         nMkS2CCTMBrbXQDXPW+1guB37Q9S4oMjm0pUevgba32hY0ttvG49mwTPNyrZVksg4WGR
         N9tEwkAJqSvN9Bxom6ABB34BI4Uz+pP7BAegwNBlF4jW8vqJfBzn7VY58CKLgx6RPY1k
         Cmlutr2vC7BQGj6BKB25Ut52BN9FW0Ol0y6LhLURPqYYVSQeENWUTxg+fm3HcpjCYRRU
         J6K+HU3866KGQrWYPiDPyQPFHQlhLhgr7eMgQ5swF+HQjhBrMCNX5vBc2yliv3N+loo+
         OHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352619; x=1774957419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxpLZewpBHQBH30KhBV9xXPz16M7OH2igp4cA1rTclg=;
        b=gx9oFzNPkUX9U0HJ+Ac9eTGHifTBtmCacSicgf+cmmpMqiezQ/uVE2IRCOAvXdLM48
         5kkrWZcMpHFVF2xUB3OLLDprpmixNFH2qQpDP0TuyPuzuOTSWv1q6vubBazB0bVZrU/j
         JlrDRHaFqpOowTavHRc3otIv2df8kAwxx1DD5GLkTbG4CYCXe7kRzocA6ZQSLLEQtSLt
         hB70/lLe0dGoijyGR26edwaPQvE8eT2LDVjV6i5RQGkaESWHxMAS0uZEkoWB9WcmJ1cJ
         /FQjj4cMW41E9+WmEUR1LOxbkqVK4H5lIAYIHx6mbjGc8ayiQsns/GgFf0vhPxB03oB2
         dzVw==
X-Forwarded-Encrypted: i=1; AJvYcCXra3PQtkJcRQuu/bV2M7nA2uBAWAwtG3Vae3mm8ER2Ll2zVtNOPT+z/ZAYSWn2XJhDWP/Xq0xiCX/nvSyF3RMFjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycaWElAu5pyYHfwUg9YUXNbDOn8mnwbmTRmV8dTQ2II2CyW27E
	kQY65++naFAwvWTgQb8Eo0wRDFF6KDzUquzJKRRR10/afx1OCcnXrE0o
X-Gm-Gg: ATEYQzw0J4NBDeEyuHknxJaehC7wxv4q3qUxaUtfBIcx3GLE+Bi+nBJ8rWjZNgjte2s
	4AVHyzsWNlyVO+spY0Xk3GVX8l5ZULZbWnUxFtf8xb8l/HfD6nWr8q+nGIVJZJTO6kOlwld+z9j
	sYZtJCoZCfNb6CaWBM+kUtQbk4KJpseYSbHOqDolWEfMbRWoGMb8YsD78GtsTCe5BNwoBJ4DCZA
	+t9xyjasf1OZrmsnnuu9kijaBjpgfbTBZSdW3cS25J3M5uCjrNoPOMq61J9A0AZdAJev451fEbQ
	hcXXogzzXTTjRdLkr9ig4bJgyIMDlhKirjbIwwIUsSuDRcBAipkdin9NsuS9FecGs20aU9ay3h9
	DDl3M69Z+GyZkhejBNTwMN/7+qmYMI4s9MTdafP4G6+EkWmFn7lfgy4HY5qzlCwx+95db7rbg6w
	UDQ5wCWSqibvKaZtIrCy/x459RZvOysI7dMScJKkyhe6JzOa7U
X-Received: by 2002:a05:600c:a59b:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-486ffa30b26mr120244995e9.28.1774352619155;
        Tue, 24 Mar 2026 04:43:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
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
Subject: [PATCH v8 06/11] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Tue, 24 Mar 2026 11:43:11 +0000
Message-ID: <20260324114329.268249-7-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30154-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 7452E3079FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
be left disabled as there is no owning driver to restore them, unlike
regular clocks.
Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clocks
on resume, re-enables any critical clock found disabled, and then restores
the MSTOP state for clocks that have one via the existing helper. This
replaces the direct call to rzg2l_mod_clock_init_mstop() in
rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore
ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Updated comment in rzg2l_mod_clock_init_mstop_helper() as resume()
   calls this function.
 * To avoid setting module state twice and also not to update the initial
   mstop state for the critical clocks state during probe, replaced
   rzg2l_mod_clock_endisable()->rzg2l_mod_clock_endisable_helper().
v6->v7:
 * Updated commit description
 * RZ/V2M has critical clocks but no mstop, so move the mstop check after
   enabling critical clocks. After this, we need to restore only mstop for
   module clocks, so remove the inverted logic and continue statement and
   directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
   mstop.
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
 drivers/clk/renesas/rzg2l-cpg.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 738a4b182f27..70228d8a2ef3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1599,8 +1599,8 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 {
 	/*
 	 * Out of reset all modules are enabled. Set module state in case
-	 * associated clocks are disabled at probe. Otherwise module is in
-	 * invalid HW state.
+	 * associated clocks are disabled at probe/resume. Otherwise module
+	 * is in invalid HW state.
 	 */
 	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
 		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
@@ -1608,6 +1608,21 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 	}
 }
 
+static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	struct mod_clock *clk;
+	struct clk_hw *hw;
+
+	for_each_mod_clock(clk, hw, priv) {
+		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
+		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
+			rzg2l_mod_clock_endisable_helper(&clk->hw, true, false);
+
+		if (clk->mstop)
+			rzg2l_mod_clock_init_mstop_helper(priv, clk);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -2103,7 +2118,7 @@ static int rzg2l_cpg_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rzg2l_mod_clock_init_mstop(priv);
+	rzg2l_mod_enable_crit_clock_init_mstop(priv);
 
 	return 0;
 }
-- 
2.43.0


