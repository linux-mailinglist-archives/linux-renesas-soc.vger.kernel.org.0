Return-Path: <linux-renesas-soc+bounces-30972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL9dCrIk1mnCBQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 11:49:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 808753BA1C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 11:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AC1A30276BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F023ACF19;
	Wed,  8 Apr 2026 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIfZCJ0D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EBC229B12
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641754; cv=none; b=WoKj4tOOYUbFIgW8bMPZm1ke8KlL+lpY8rCOL/+u2bv6lYrICr2yOa/TC4KY44YIPVmKB+LxnkDv6IjIS/bM1vMHuk8CwugKGlT5TEs7VE5HQyhymKjOW0+XT3VTHDJ0S9oKguQ2uobUmGq84730hmSOoE/PtfqDUnu42J1thak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641754; c=relaxed/simple;
	bh=mpR/q6X3i/M2BnduABDgEH02LEks6wSFU2eL75pnwGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxH80Zw+oFCYnabT8eXFt44G3uLI5hiy42vnURwpd/q8tLKp6qrLpRQI8pb+rRWc9RyiWakwN9XHotHQlIhH1Rr+8X3ya/86vLoUEMA0q/WTfCCKEANxYp4lAjn6cqIxChAgfqYTzpC6kpyqUt3NbosSge9Cue+SZMeTLIFc5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIfZCJ0D; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so18822015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775641742; x=1776246542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYoGMeCz6Y1Ts2t+vdMHS9mUEhRgNq0fMUR9Htuve1Y=;
        b=HIfZCJ0D/DvySHEPmNeKNho8Q1o0qqXhzL8g8LdFHOoUXXQqzXcHNfhbxemd5yfJ3a
         S4bIZ5KMv38nvrzvW+k2vf8a29hA7CYiwYjd9SN5cJcobfa9/Jf/Oc/U0ytmHq/ERB/g
         Gj3srS1WgCHjNwuUSP4hqkrmjPufq7lXhLEue0uoKyjyZqAaXVVNzlO0/ZUrVe1pkb9r
         9DwWo7nw8B0fNJ8AbLikKKildFqMbk+oo5levvcJEXWUmReLDaZJIG+wTZop3EViJxlK
         jogV+O7nrZPbKf2wjx6LkJkjHA0GwqkjMDsrXiWC3vQRjGYsCtOaEkrQHLI1atrKKj71
         Hd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641742; x=1776246542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYoGMeCz6Y1Ts2t+vdMHS9mUEhRgNq0fMUR9Htuve1Y=;
        b=tY/cENCuiGt2RfBlhXTNeohO83VVbJ0WMvWSNzLTn2QfeDsFUkus0cwfeFaU2s7md/
         S8Ihz1TXvLtqfe7WoE1+AgfqUk8tvUufMe9+vL8ipqUbQ+1k/1BhAtJMjSSl0myRYb7i
         lUpWVWHCzVskf1kDqn4u7B+WHh3hDEXE4Cc4xJe55HNFpYRHHVqs+Vy8mMsLGWDzRvRy
         qPmPbvbVgTMF8Z/BgklQDdw0AnwO0Y+vg8/dnk+lZ5efTrzPW5BJKkXwcWNgihEAi4yE
         LJFtuXI5t4huScDZICZkNCrigwDBaq1l0dX8x5bI7sIt5GY2v/SpdbeJ785JVDoK+jUn
         C/IA==
X-Forwarded-Encrypted: i=1; AJvYcCW/6R3w3LHPvPXwCVLkE/d3Y+SFaSINhlwkfwx4eZQMCSzfvRgh8viSjmvb0uFulv3RvzFq74gEB+3L1TtWNkBkww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwceGAxalrGS+ur65Bp9JSiayIS8jOCmIyZ5umq+F1qFlS0Ha1
	6zQ68eEvvfg47t5TzgTGkMl0j9TDb7+DvbESucFbzy+nMiAFf6mokD56
X-Gm-Gg: AeBDieujN11PrE5u7XHOCYNy/ZUreBzTRgp+ZaZ3dcIxFlhcsafwcXr3ZhulKQrtUCu
	L9ba7WNSeAm7lOW8Pgq5jgArFEIR1lSxwPY6GCWJ1rqmmrhpPj+D6gwfSV6cdThiLgVKOZHcsF2
	smb3/vt+I3E8YcQjc/OLiy/YjulWuCMLibsE5Xc3rdyS0n0m3Mvz17xHwNWBis/uhI4FXpr0ViC
	GUFuQGdedreUIKragzpOh/VQZfPQLanrkqJ4kdoKB7u/3r2jXYIja6LTv2a7rfGBjjvBw4dnAiW
	UsU9xDlthWPif8LSZzWOuQl0vUsrOOi1ijF+mChXpwv07/DD6UfEBFoWagDRr7/ZMAqqTdS7Dc+
	5rcngDc0aiZdmyx+5AR5lJRjuyimSVCGaV/0+I+nZzYsF5Fhbl3q+eflKCIS0drKRPsvAa9VXPQ
	lGklk8LMqeTD1x/4e0O58ZEBA8zTgo56VylJgNAOuDaL4qUEtuSC0CqzpDfmG3UIZewDtwHDVyo
	1MLfSAuNq0qtTg867Lvn35WauHdWfK+Lnw66g==
X-Received: by 2002:a05:600d:8449:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-488996a1e01mr217238555e9.4.1775641741935;
        Wed, 08 Apr 2026 02:49:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:98bc:78d2:5881:a11f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm57689153f8f.23.2026.04.08.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:49:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: divider: Fix overflow in clk_divider_bestdiv() for large rate requests
Date: Wed,  8 Apr 2026 10:48:14 +0100
Message-ID: <20260408094814.321072-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30972-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.976];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 808753BA1C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk_divider_bestdiv() clamps maxdiv using:

    maxdiv = min(ULONG_MAX / rate, maxdiv);

to avoid overflow in rate * i. However requests like
clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
supported rate of a clock, result in maxdiv being clamped to 1. If no
valid divider of 1 exists in the table the loop is never entered and
bestdiv falls back to the maximum divider with the minimum parent rate,
causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
supported rate instead of the maximum.

Fix this by replacing the maxdiv clamping and the unprotected rate * i
multiplications with check_mul_overflow(), clamping target_parent_rate
to ULONG_MAX on overflow. This allows the loop to iterate all valid
dividers regardless of the requested rate, and clk_hw_round_rate() with
ULONG_MAX will correctly return the maximum supported parent rate.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/clk-divider.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b..dc486c2aa946 100644
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
+		if (check_mul_overflow(rate, (unsigned long)i, &target_parent_rate))
+			target_parent_rate = ULONG_MAX;
+		if (target_parent_rate == parent_rate_saved) {
 			/*
 			 * It's the most ideal case if the requested rate can be
 			 * divided from parent clock without needing to change
@@ -332,7 +330,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 			*best_parent_rate = parent_rate_saved;
 			return i;
 		}
-		parent_rate = clk_hw_round_rate(parent, rate * i);
+		parent_rate = clk_hw_round_rate(parent, target_parent_rate);
 		now = DIV_ROUND_UP_ULL((u64)parent_rate, i);
 		if (_is_best_div(rate, now, best, flags)) {
 			bestdiv = i;
-- 
2.53.0


