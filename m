Return-Path: <linux-renesas-soc+bounces-31242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAbbCVjm3GkZYAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:49:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC23EC304
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A8F2300B477
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9453C8720;
	Mon, 13 Apr 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcvT/ODw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907433C7E1A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084562; cv=none; b=NucQZB8D4BktM5QK/Qfkbx45TFfLAhFLCtDd10oQmlnzognoYWf98DMy6w2ddoXjWjsE3XnLkqYuoZGH9aLZ0bvyMS2moWs0AA3RHcll+PdR29yTdqULv7/3UXRol8KTc7JyL+y6sI2hR0q68pMO7QbWQZnFI6L9yWO8IVqeBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084562; c=relaxed/simple;
	bh=kBqnvQDwdiPZ+uQ0CawA0daWE+Ez/OQGt5TdVXg//xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7PClpLuoJIfmwpQAwXNWB3cbcf+f494h6wTx7h8GIVCcP7yxbEbw4b2LszsH/5xHTc/tHWWZAwEqk9jnomGG0lYx7vEuvEfd45oyIW53CkjJSFjFEWMKf97TH9yBFBH5Tr1hsKsFopUxb3lclDKJ1UXIU2NKJriFj9+eRYxSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcvT/ODw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so2968704f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776084559; x=1776689359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iZLzX9bqF3lkIILNvVjrN7/XoHKLWrdf/ip5ggw2bg=;
        b=JcvT/ODwioXnS7kcUN4oOz85buJqkdCMr6iwXK9kFiRh8s6fbWsGCkOUG6m9KV9mp3
         lRNijl4zU6ozn3Rvu6HlY6XfIT80mqdZX0NNj2VPHgCVMRy93W/AR5SBdts8I8EFJw0L
         xRolZnEsJbk/AfK+wyv8jr2LfXjIVJdBMTFH1xdv7zb6O0i97V5yRTgezlW/Qc6UPhcU
         Lic8YKBn+vxJF12FmBJ1Aipr8QgQYOngI+Orn9wCiyrmmCijlMgzHUlt7P/pttWqAzcS
         pjPAaW/qM1ONrLt7BvnJhRhn2e6X/8deKoat7VPHdlyU3vOtIq0G/25BCQox2UArKfXn
         SdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776084559; x=1776689359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iZLzX9bqF3lkIILNvVjrN7/XoHKLWrdf/ip5ggw2bg=;
        b=pCoxx8tg6+EfS9hVuKhGO80hiNSVr750loYO/RckcdRfYECAZ0uEWUsczkxcjh+Xzk
         51j+b0/5BptwIzc4cXKvRQmb42+SFtFsKmp6XxtNsAxLbOgKKXbPE/bN/kXySXG3RrV3
         IIgySlCqEs2dABg6RF5tq7tbcKJQTbNVUaSnlWaxcGSHFu/sWPNbxIPgW9N69j4wKzFn
         eoClAujNhrCsgc6dosBW6d6ivQ3ECvdH6UDWl17Ypu3QVyZILwuWP+jSqEGKV9EeWkAx
         By0pM/fO3fF/PolVrcL2eq4RXM/jlOOXL1fXzcdV2uek4phKv4l5asLVfMJm1TFier8u
         Uc3w==
X-Forwarded-Encrypted: i=1; AFNElJ/46VM67jsXrbLeEHG/th940UJmhh1FYBIQHTzgo8XmMb1/Vxhqz7U3PmuOEf/yN/ES3MPyGuP+qypBWatoq+HtTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvxJaFYPalEWuM+yP8D1ZaoI3kzMOM7vUceEK9OGUy9eB8VeEX
	/SpQp1ocwUWA5bNuHuj1g3Bsk6IDoJ82kl1KiRI+iRcZGLQIkHSnXKTf
X-Gm-Gg: AeBDieuB0/Bb+ChRc9igbaSdHGWjC/Wlfok/ITEuFqZhvBdQVVxiB0kwmshyhGXppjC
	lFnXHZjJ8ZSDTA+X9GRlkQljIX7zjDrJIWG78uV62LvxfwOE+KUsjCiQXnLl9f8Nnapkz3i46Xw
	KZtUM1oxiIIS9B6LMc7QZMnOsQ2W28lbHlW8UaCXYtHw4B1q3hSjspZYcFfTAUSo3RD69EsDurR
	hZhOzWg7FiLT2FxnKj7FgZS3yO0QZ3aWxiGFwJ9Ia6tbLG3Pfp6RJUvamuBwy7/nud0ZST8eskO
	REJ21Uzg211P/hyjqIoLoAdjj/fyo6Lgh8rGXYvDiXAShWsb4oBs9aGUXAKEJkc9HcPBnU3RbSu
	Jf2nzOKmIxinLooedoRMFRu20lt/4w8hj8f7bX41UE7J2ygjzBQvyQ9H3u9JHHF+iMA1N+5lSgh
	NEzPhgdPJ0q+ax0PbXN7IvF+karZRotgG/14e99I/MmKamGb6zSGJl9zPMBIaU3fRRpDkz2IWR2
	qTM9RtlK1PfYPQ1nhFR5ZDCV13APz/LFjZPDWgd9I1yhdwc4cCOfB0m8Q==
X-Received: by 2002:a05:6000:400e:b0:43d:1c39:26fd with SMTP id ffacd0b85a97d-43d642dc79bmr19277103f8f.43.1776084559020;
        Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm34634318f8f.27.2026.04.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:49:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Mon, 13 Apr 2026 13:49:11 +0100
Message-ID: <20260413124912.3260571-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31242-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.989];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12CC23EC304
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/clk-divider.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b..9a6a2ad6f397 100644
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
-- 
2.53.0


