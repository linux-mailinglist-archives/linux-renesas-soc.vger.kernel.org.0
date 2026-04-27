Return-Path: <linux-renesas-soc+bounces-31678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIoYLX9I72lO/wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:29:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F178F471B67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B49F83007B26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C9B3B8921;
	Mon, 27 Apr 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH6KkKX6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511F3B7B99
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289326; cv=none; b=Dldzj2R6YvofbfaCUbracbuU0Kl5nU5LsMWrADRNskEDluZQIxvRPFQP1VTj6y14fx/95iTjLrdSBl4XEEcuewQMQqlC8+BSiXYc8VYASjZGwSTddrtvv0l6xbu8tBYYYfQ3+M4/UjMvhKIQ4QyVEoQk68nN+tnLLMKlUgCTjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289326; c=relaxed/simple;
	bh=h7uIE0mqqq4mHL5t/tYzDztinxFslRwHMvJ3tdF+6q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZ94v8/JdUFedVX0yJlO+7aahJr2AVgdBK8a/9jFw8p354Zn1tgTFwD4qhlo/Py7IHnNBlFBVj6nfocqoTrwKkpGDFjHWXmUP1W7FPozzfhB6c7lpH4A0soM1cNoLJUix+52GSrixPvOjYRzhCrob8r2BDOVJIjWEVxkuB2dIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH6KkKX6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d74086e5bso9684490f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289323; x=1777894123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCeqg+kQQc+bo4zJQuFR7vpp5utJVCWYM9xfYQe2WTM=;
        b=NH6KkKX6BTIxhRBg87mLl7vZkvyYVrP0ahuVj98Zu8/Q36G6sgjoBGVqA32qEskxdR
         x9e8MecXYft6GeGtWLMJikwkZSVC0zxO/pqKwu8AL+zeuInbRrnVDN/v0pLpF9AjfUC4
         w7kDHnxsVx7fQPG4z0o34R2eBSYaTgzqaAjOTPhU6JOXoMdkcVdCmpRs97iFlpjkfuc9
         3Hd+Y5P8JcKJ1J5XezUMmSdRbqIdaNQ74ZX+ZYWmh7G47iEK5yyHe/pkHv8sJHbZLP1k
         VspAS/1v7EOzVPrHDjjA99jbis9P616bp4Ue60VlFT9ezFYwyWOJ3gGgQpvnQpTbQBZn
         ga+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289323; x=1777894123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCeqg+kQQc+bo4zJQuFR7vpp5utJVCWYM9xfYQe2WTM=;
        b=J9Rneh7KivYq5swDYQC3BYIq8GeA0yU9TCtr1/XVJoIqXF2k31so1kRGYSxXHKewrC
         6qV8Erd1CDmOpMxucOmPZQf470BzvfxvGYQhp7MAHZX5of3rztC9puu/dZhpQ0rHjltS
         icDcc3j5V4VobZH7vKE1Gw1N7SRDOX8KKSsAljl9LGf/0xIJmJGICF75O17jmjVL5Am+
         HGKqCHVzlB784TUGLZRpj4Gn0w/dU49LRb7GhzBjhFAKyYk0a3eYxGgfXvba+iT4VWRX
         UFotcvYm7UJ1NanoW7vNFYUsGiecMrdchLasJiOjUJI0yVAxlcZD5xV0Kdhh9+jeUICc
         5Fog==
X-Forwarded-Encrypted: i=1; AFNElJ8fTSwzSvWn4SZ9lKtaZlndIA1J/nfRx2UOWFjdLUXwamuG2QdBdKffQcTXbcEs3w24HpACQIfOo4JvlSdHvFs93Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwzRycibNRYXeYUjrsY3RkOY8W433XXbS57wvKo459UhcaMDI
	oMwPwKbjNuyc2wFhNl8nVb1e7ok6HLxYdA5L7OZSMHfUdssRcc8KU7RB
X-Gm-Gg: AeBDiev+oaVXjoIJR2qZ/o3EQlKm4L8k6utwPdlF8D09sHgPOVIrB6DmPl5X2q+hgea
	tYV8/0iedIfbMJG/u1PSdzV6nbH2z64uOQJvgJn9HKrMmgiN5hm+cIeNlr9krqJeXKiUwCF6j7K
	u5Kc98Z5cxHmrWSTDSpSzmiQIjG44O4wpNPPz4tc7PerBl+3qv/tW9RrdPIvnxz4o+6Lf181wqv
	sSgYF3LFkbZhdYN8m3nZZJEYXOotK0bvl3d0Vf9k1bFgt//kHXw7AFK5ZLuygWwRsCVhluG0lPn
	WtBdalgbPqhyRoYmLDAEaKJpRujkxI0qwxT+hx55RtmQ8GvH+qddCHvB+zOlh4T+fslFHP/bswX
	vzNPfg/oHPdW6job61tN/dfDyK8XLlojx5n/XuwoTXl9c+1m6qAS3WoMpFxeu67sOB+buviyS0u
	GTDg7qrIZ30vv2a3FVr6nvMe8uaj1pr0DRD5gqIpk7PeyoY06LPfddxBxkXN3ImoKnkZvY/0aHS
	yY6ge82hqsXNE6QDL1JC6LVtod9mXPjyqCmodzpOmRiLDBqjzxp+O51HU/LDGpFHRdR
X-Received: by 2002:a05:6000:2886:b0:43d:500a:1e5c with SMTP id ffacd0b85a97d-43fe3e0dc92mr65324143f8f.26.1777289322784;
        Mon, 27 Apr 2026 04:28:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm85759519f8f.6.2026.04.27.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:28:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Mon, 27 Apr 2026 12:28:24 +0100
Message-ID: <20260427112824.231150-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F178F471B67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31678-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk_divider_bestdiv() clamps maxdiv using:

    maxdiv = min(ULONG_MAX / rate, maxdiv);

to avoid overflow in rate * i. However, requests like
clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
supported rate of a clock, result in maxdiv being clamped to 1. If no
valid divider of 1 exists in the table the loop is never entered and
bestdiv falls back to the maximum divider with the minimum parent rate,
causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
supported rate instead of the maximum.

Fix this by removing the pre-loop maxdiv clamping and replacing the
unprotected rate * i multiplication with check_mul_overflow(). Guard
the exact-match short-circuit with !overflow to prevent a clamped
target_parent_rate of ULONG_MAX from falsely matching parent_rate_saved
and causing premature loop exit. Break out of the loop after evaluating
the first overflowing divider since clk_hw_round_rate(parent, ULONG_MAX)
returns a constant for all subsequent iterations, meaning no better
candidate can be found, and continuing would cause exponential recursive
calls in chained divider clocks.

Update the KUnit test expected values to reflect the corrected behaviour:
  - clk_divider_bestdiv_ulong_max_returns_max_rate: PARENT_RATE_1GHZ / 8
    (minimum rate, pre-fix) -> PARENT_RATE_1GHZ / 2 (maximum rate)
  - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: 0 (invalid,
    pre-fix) -> PARENT_RATE_4GHZ / 2 (maximum rate with mux selecting
    the 4 GHz parent and applying the smallest table divider of 2)

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
v3->v4:
- No change

v2->v3:
- Added Rb tag
- Added the expected value for the tests
- updated the commit message
---
 drivers/clk/clk-divider.c      | 25 +++++++++++++++++--------
 drivers/clk/clk-divider_test.c |  4 ++--
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c3804bbc06f9..36bfaf7200e2 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/string.h>
 #include <linux/log2.h>
+#include <linux/overflow.h>
 
 /*
  * DOC: basic adjustable divider clock that cannot gate
@@ -301,6 +302,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 	int i, bestdiv = 0;
 	unsigned long parent_rate, best = 0, now, maxdiv;
 	unsigned long parent_rate_saved = *best_parent_rate;
+	unsigned long target_parent_rate;
 
 	if (!rate)
 		rate = 1;
@@ -315,15 +317,11 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 		return bestdiv;
 	}
 
-	/*
-	 * The maximum divider we can use without overflowing
-	 * unsigned long in rate * i below
-	 */
-	maxdiv = min(ULONG_MAX / rate, maxdiv);
-
 	for (i = _next_div(table, 0, flags); i <= maxdiv;
 					     i = _next_div(table, i, flags)) {
-		if (rate * i == parent_rate_saved) {
+		bool overflow = check_mul_overflow(rate, (unsigned long)i, &target_parent_rate);
+
+		if (!overflow && target_parent_rate == parent_rate_saved) {
 			/*
 			 * It's the most ideal case if the requested rate can be
 			 * divided from parent clock without needing to change
@@ -332,13 +330,24 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 			*best_parent_rate = parent_rate_saved;
 			return i;
 		}
-		parent_rate = clk_hw_round_rate(parent, rate * i);
+		/*
+		 * Clamp target_parent_rate to ULONG_MAX on overflow. The true
+		 * required parent rate exceeds what can be represented, so ask
+		 * the parent for the highest rate it can produce. There is no
+		 * point continuing the loop past this since larger dividers
+		 * only move further from the requested rate.
+		 */
+		if (overflow)
+			target_parent_rate = ULONG_MAX;
+		parent_rate = clk_hw_round_rate(parent, target_parent_rate);
 		now = DIV_ROUND_UP_ULL((u64)parent_rate, i);
 		if (_is_best_div(rate, now, best, flags)) {
 			bestdiv = i;
 			best = now;
 			*best_parent_rate = parent_rate;
 		}
+		if (overflow)
+			break;
 	}
 
 	if (!bestdiv) {
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index b1bc802f38e4..093399c06467 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -56,7 +56,7 @@ static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
 	 * can produce.
 	 */
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
 }
 
 /*
@@ -132,7 +132,7 @@ static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *tes
 						  div_hw));
 
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
 }
 
 static struct kunit_case clk_divider_bestdiv_test_cases[] = {
-- 
2.54.0


