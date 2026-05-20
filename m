Return-Path: <linux-renesas-soc+bounces-32857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBmcGxV/DWosyAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:29:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAE58ACC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09DFA30098B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB803BFE4A;
	Wed, 20 May 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSmnGDtz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AF3A2543
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269393; cv=none; b=OjOsxKw19cAgeI+Hs0Qpoe+oYfKhTtLCKjTmv9LuEgZUUnJjUh+nsaGKPLOimu3CtInG/6BDg+mIil99MduqMBBh3C961ZWGemns+quvBPiDAkHdP6BeV4XQyrJdrqVo8g/Dr6v6kapNU7eaw1Crxk/3PZQ5FJkDT8nhqXdY+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269393; c=relaxed/simple;
	bh=EjAMWc65H0NBHcJrRF8ZPun1V8oREyg5MoMG6na1NY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQpB7V/4q0DYBrnxNe+vh31mGGrJ23lsMBUvWsLOHstNXiWJXSBUbmvmRGB60cdLs50ZMebCELHNSSw1XVnGYTw+LrGAsYaLnxZazZd0Etx6jQz5i30c1KNkV7SJ5TR76EX5Qxo06GMTlmZdZKwVaWEiR7FbgCr8atOOSnhkBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSmnGDtz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so27015165e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779269390; x=1779874190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJXcLlUsgEhIc4w3TLsV9eUQAnqp7oDifuEz48zVFFQ=;
        b=RSmnGDtznFgo4bDc0IOGhB/U0vb0Srz6uY4KXU2iAk94w2j2woqd27Qridu06tEREj
         lMcZXqkk6/e9ZtS5RZBLh+ZS2e9ayD35Fl1ZTWFC6zVjOw8rAcI4Hdzgn3CSnI6V4+Yv
         KJo2COOUTe9f8dm3+QmV+LqPJfhQPV1yXw5gvlfaGPnZxv3yezGjxLUrDCmVA1STLagS
         /NY9utkxaQ+A3uLKHPxNq9kvl/cVEs+vy4uUw5jywPkg86KlWOISeGFz/sd4IvIdVU1o
         R4aEgjgOx6cjz5eZFmthRtxP/px8YfxQ4o0ROjTOZSclDZfoVzZYU81DajoH9JJuCl6z
         VAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269390; x=1779874190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJXcLlUsgEhIc4w3TLsV9eUQAnqp7oDifuEz48zVFFQ=;
        b=O7ebiqAsZTejP2woYvj/dPeUzvL8+y7UMzvCC3hYVnenD2K6SjekSB2lPSuYMBjupW
         WgoWZHcq+ss3TnoL1jMfPKo+YPzmDp83AArM56MUHxlVMna2xTrdZUvcJFYnp2mx5mo0
         bK03iThvFYlCTURWF5YffwmnpfogkiOAw8vBfgFlFQ/Wm1K6VL1yI+MYH+z4wZC/l0rg
         NOnxLQlt6/Wg7yT4LAHE1m8PEykgrqvdRM5h8nakG7YIiFEjJzuzBxOgRIiMv0T72Mw8
         7YE/Vt/NJbX9IqmLh6dxQa2XAFGEaa1Puij7X9d4NLRlHi08xODxMLqTLpyVfzsNQw85
         C49A==
X-Gm-Message-State: AOJu0YwSJmNknkV1pTHDbYXS0+hRm9rYypdvtya3h3gtS3cMWA12rot0
	bgXEelf3HUK6Iq/9LjRYPtIF2Bng58uM1eCaejyA/fwoJX3vNvLEadiM
X-Gm-Gg: Acq92OHJJkZ2kbYvm88DAq+kVMe/4ea+R4pdM4949y0dh6o2IVC6Cqr/J0YkxwjLuMX
	xmuk6ZhIaC7h7a18PYuB+01nVaYRoZmXgPwzAUTksNiYUQgIDmHceYZaGUgoSKeR1qwCUrL6HTN
	DJBVpkhaZjMKYm7BPUjvgimvnIlopQKk1be85XczOFu0iggsovfQCE+mQpr4UN+rHwGYvRo3M5X
	ymPpnw0cFraNepA5HPx31YUPypnxNhgvhRyRHjdpfTA2A7fMi2FjnLuK4pGRREG+B/usYVc5rR/
	K5kcJBr1A9yMaIVMpEnKv2LKtcxxhr5Tj8Ol1+HGZLQ/W7PgzV+SGe9VJSk1dUIkKNV3NxYD07Z
	XfmNDn6VkVa1M/chEdXuxj7ibyQl7Qx8neDxMFj99qefukE4imS1WmwW1lOh2odf6zdX6D+BOwF
	lx5REIpHVtfscYNkEFDxMoF1onZKRdAvUjprOImtvvvpMNjWTDuSh0GAKnzP3v1NkZGkk9Op3ji
	1BuomrDhMCLOLSrOmdHxKSKC1AH/K34IFKyI6l/NcHEfTN4
X-Received: by 2002:a05:600c:1512:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-48fe60ecd67mr211947555e9.9.1779269390015;
        Wed, 20 May 2026 02:29:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00bbe4sm126455775e9.12.2026.05.20.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:29:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzg2l: Rename iterator in for_each_mod_clock() to avoid shadowing
Date: Wed, 20 May 2026 10:29:47 +0100
Message-ID: <20260520092947.70596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32857-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E0DAE58ACC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Rename the internal loop iterator variable in the for_each_mod_clock()
macro from 'i' to '__i'.

The current naming conflicts with local loop variables named 'i' inside
code blocks that utilize the macro, triggering compiler warnings due to
variable shadowing:

  drivers/clk/renesas/rzg2l-cpg.c:1494:36: warning: declaration of `i` shadows a previous local [-Wshadow]
   1494 |                  for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)

Using a unique identifier for the macro-internal iterator resolves the
shadowing warnings globally across all macro expansions.

Fixes: 3fd4a8bb4b63 ("clk: renesas: rzg2l: Add macro to loop through module clocks")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 426e93dc7a98..782367a3d98c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1402,10 +1402,10 @@ struct mod_clock {
 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
 
 #define for_each_mod_clock(mod_clock, hw, priv) \
-	for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
-		if ((priv)->clks[(priv)->num_core_clks + i] == ERR_PTR(-ENOENT)) \
+	for (unsigned int __i = 0; (priv) && __i < (priv)->num_mod_clks; __i++) \
+		if ((priv)->clks[(priv)->num_core_clks + __i] == ERR_PTR(-ENOENT)) \
 			continue; \
-		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
+		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + __i])) && \
 			 ((mod_clock) = to_mod_clock(hw)))
 
 /* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
-- 
2.54.0


