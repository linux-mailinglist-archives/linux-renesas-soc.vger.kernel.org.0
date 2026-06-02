Return-Path: <linux-renesas-soc+bounces-33456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qd88JGI3H2pGiwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:04:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C156319EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dNJdMGhZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CF4E3086912
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 20:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBFC314A60;
	Tue,  2 Jun 2026 20:02:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C337322749
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 20:02:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430577; cv=none; b=XNMQ023eSxyHYaJ2CIMrHkOpdwnHChc4UTa3zElIfz3g/GZYtlecogZykF+o8TOyAzZbK/WdKq9OKoR3HSBomC6fftZ+Qf/t7tJN/YlKSsdvNF++bHB5Bgw9/h2wGcJwZQLZ6EfzeBpRZORu/L5xwfbvjH54cEKwVraEOIm4n2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430577; c=relaxed/simple;
	bh=Jfa5R8Hcp8fV8pBHclVi+5b8yBOKxWDa2CZqqB9gSbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7la8WcFkmh9NDWNaogVNSl/paKoA/cyS3x6Jt9534+hmlnOH7CCkr2FF8llH+UbMiR+apgWCg+ks6m2Kz6WHBtlLCSDJrFsGJG/epB9LP5S0+Vq13OfY2QxWnMGtJ9EhEj3jaFIVhidawgt1Cnb9L7nK4kBAO0GCiCJpSmUyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNJdMGhZ; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso112734305e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780430574; x=1781035374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlPgG6RjNCKxvEpnrQ9KQhAPgcHAQDrzTyIKfeGNbKM=;
        b=dNJdMGhZRE6KpZlfNHwne8yFGnKbG2URukkI5ztwPyeEE9hDkqSkLJW55DY5CseP65
         BaNCliD27bQkspCTd+mpKZ+aiCLX6RiEosFJBx3ZXPIh6qbgHzeALPhPdDP7tr726GOs
         zzLJmERVSZroh1hVKfW0r3/HlNUXKcfplQGNB4G5K7l+8YCuON+m7UaPR02QmeIFG3xT
         +Vrkcz9JoFDDhR8qmOk223/diDca15AXCKf83XYwBNS4Sqrj9zvjVNP2K/5LdiMAFYj0
         Z+k9F+AuBxAJZfM7C1KZqhtYNz/HERSckuEa7oFxms8/3KRvvIdkZZfMJ+/FhDlOGaq+
         y18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780430574; x=1781035374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlPgG6RjNCKxvEpnrQ9KQhAPgcHAQDrzTyIKfeGNbKM=;
        b=tUhjOa6ZMV8DtBu7TKy89jLPtE1IgqwilT1RZT+v+iEw3LWVfzwiZ5lipfVI8MEogF
         Tyu3d4i3wMCb3/3J6aqPe9J467XJ91yjwcpJfJv6GL2/0pUVYv1vBuGtTKEX32AmiXs+
         jP3cM1k3ZkwVMHWwZK3Ea7Nqwp+6e9BWJkCbRVOBavkdenDtg3eilqNt/eNWVnUNxf6s
         QsL410bQwl97dmagBbFOHqO846MO/r9iEdd7xsVFYB6q4MCQkrc+f7w2ax3W0npxeH7b
         gIsn2ZtSmyQExVAjfGB1G3j06at1yohKDzk5cLvhpAhKy0hJ4TEVlEO3dhNVGdQi8FYV
         G8zw==
X-Forwarded-Encrypted: i=1; AFNElJ+KLYtJOEJMwtYMtz5nNnIZk+VIm8rd8amD3iENooiG9Hn2QRGe/ryhEHtEOganbLlVpE7v/Eqp8EyY+PuAeGPTCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJ/KheF+PrwAxuqE01ZzW97Ut7DAgqI0HujhzZTrFH9e9ydp+
	ogFqoiCVHajNr+NPQVScJrHJZoh1jYm25DPf71+uWzIJ64/xpYhTHFFK
X-Gm-Gg: Acq92OEc7vXt9KGK4rZ8CqxvTyiJA7wvNbe1mYIanQwQqFko0zIIVzfhVTWNXBvEA7I
	g/BH0jDKA+PnKpz0//dlmcYPUcaYW/g9QynYlO2+bRxud323ft7/bkeji9bC1mATGNjRtxjwz/W
	iIEkStvLh5Sa9j8lirnWre58RZhA0qmszpjRzEQujA2jGYH63qDVSE4dDWUyXR7vzIo9ImNPZep
	h3jDTBTuu8Hi6mX7y4EDfjxL9TsBXWWSknJfIUFLJFBai4TK+ncbMBgEIXAe5M64INuYNfmczvi
	tPxou/+gZBuvE9/OlX/ozendFlExwLY19PhxhhoIr+m5AXv0XmddPIWrK6p5bw9HzFRvI6eXmaZ
	sWUC7MHu9GWYo9Qp3xx+zfnzyIgQXo9eCbev14D1KwPbxTAyYGgAjrOaMaMatjEvwzcgSBCDi7o
	bGSybl3IgUx98sMjWprWd3rhDEn46FwWiHyo4KgrXfsEHCHwI03PPe70OVMYEmr4ODHS3p8FBre
	4iiU0A4bXUDBfBlbxrnzNdbHq0e6ekJNhuJcnQFczEKgaOieybrzwsb
X-Received: by 2002:a05:600c:4e87:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490b5ecfe9amr4818515e9.11.1780430573733;
        Tue, 02 Jun 2026 13:02:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm97978255e9.13.2026.06.02.13.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:02:53 -0700 (PDT)
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
Subject: [PATCH RESEND v5 2/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Tue,  2 Jun 2026 21:02:43 +0100
Message-ID: <20260602200243.1806087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602200243.1806087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602200243.1806087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33456-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:geert+renesas@glider.be,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42C156319EB

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
v4->v5:
- No change

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
index b3b485d23ea8..f68216c65d3d 100644
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
index cb56931456b8..8ee1614128d0 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -61,7 +61,7 @@ static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
 	 * can produce.
 	 */
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
 }
 
 /*
@@ -133,7 +133,7 @@ static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *tes
 						  div_hw));
 
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
 }
 
 static struct kunit_case clk_divider_bestdiv_test_cases[] = {
-- 
2.54.0


