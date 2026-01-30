Return-Path: <linux-renesas-soc+bounces-27667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEPoNRqdfGn2NwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:59:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C66FBA47B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D86BA30276B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF63374187;
	Fri, 30 Jan 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqIRWMFY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9D36E479
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774337; cv=none; b=o7V6L8Mq++ExZdCM/c2E7fI2Un5NVPFx8zkoeL+VQNDvzTfpsbTjS6FLmK8iCRtr5mdrIA4wv1rA51bAlJebSIv6U5YvxHFcF+S92yDI8hg8Cwd2TjT+KfNmOsjabyuqu0zz1HQVRQH3IJESy2CKHOy4lA9Raq65lQRuWU88NRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774337; c=relaxed/simple;
	bh=KefAlO+NM/X4AH06AuNLpw4gAKi3rKcm5QO5l2tyg3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCPK/o1Cc6zN9LEMUC9ngSzLs7pH6aDlF5HCVrGW3IfX+dmlJB3vvX+1/3wDbjUQB6puz05+eYiGO4yb1L+/f4PKCx/jDHD/6u6fy6isKTtlNitGF26URvjFUeckqTUbHeV6vI0DIsTVAEoCU+W5J9+BQQhqcZXC4xAPxmEOpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqIRWMFY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-658b9e95990so3883270a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774334; x=1770379134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyG64XmyWIdVs7sZ4Rn6fZ3iJE9VgCVPcmxB8ieVcgI=;
        b=RqIRWMFYY2mlK92hrDZ4SYRSNxv+liMz7/9I09nkgnzU8l+njgNgfomp0lmqXyqIf8
         ww0se3gIvxAIltmwxCOjt4PjIhklMUyoWJFeQz1NLcmtVClXRxcysX80EyZ6qDdgiA5y
         lpWkLy7ngAlxvIiL2Gsq8VXdb79NCJQanDGDkSDkXVUVBDnQFdC+q7uBQRoCD65lMjU/
         G8UClom5x1FQQrIOv+a72IDpylXLpvkmuG+q2Diw8ss7irm4yaxcvu6rXwb9lonBFAff
         i787+ZjANTGLXVnN9VzU37e7ub/gc6xEUV3J4U+Bg2AhbnbeBjKeNsmqINh6iSEJxTyL
         fyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774334; x=1770379134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyG64XmyWIdVs7sZ4Rn6fZ3iJE9VgCVPcmxB8ieVcgI=;
        b=RSE+ww0z5Yzd54/EojKXDPToOrxsQ7D3gLMSIj1/tfx/5yyvVVyguk2Q3hDoEnPYXw
         JmKqmBtD2VsmLA/ZNYLj2/me24tKz3+ddLDAFQ3l+whKYM4V2WDX/48ukZWFvp+lrN0j
         ZaTzL4CM26QNnKRbdoR9k+eLVMadazA94pjYG3/tGX03ETyv7Ij9nR//Lgs5nAUrAHO2
         KMd/gfA0zP7/vcguVJ1LA3dumy4Z1OE/VqQDPsnHVWEcEvgm0RQ+omZlJTe3V+66s794
         pivOjol/0Yd9PmvqRF258Q3OsqkBT1yfrrtu7syYZBRZXuqS/0MO6MZiD6la4JnaQiJk
         8lvg==
X-Forwarded-Encrypted: i=1; AJvYcCVSCyjTucAeE7kn/KFyMFCnhGEoEtQTgJMeFkyW1JsY0wO1n2rmnXpXvjxCqJcyMjJLdzEw8gmscA+WVFOxuu+R+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPv13wGhnUae5h7RVMTC0ZIAs1b38jcbtS/Lp5+3dS88Pp9Mo
	7SFCrwp0v86D5c2CnRfeqVf+as1pvb1rfj3TVQz5hxXTSct8F1fGYfnX
X-Gm-Gg: AZuq6aJxiubvCIIgcyQwq4EpESw9FhRhrOZKW2if4EQ2gtfDHirrzcUvbb59b6sUeOa
	QfBYPm1/POoq3QxkuRIBul5gAxUnKzpQlQRKX6We5XiDx+W0XNKjP17Um5O6WP2bs8fiVOMjf0d
	pbFFvTLFGlvffrQ2P3a6E0Kj912P3ZlEPNwQ85lNkseVC+Ze7MJeTpd7p6a/jzbUJkSUWa8GF6K
	GnLbP1GDSbj+l+LM6D2y+AKZVTQd+gYwRz4tJgFhKvqq/LydQZclajddWa78xZ3mcOg0ZNR9kXj
	zpusG9az72vkE7gy7+dlMSf9zlnVjrqN47ZC5yFyadQqmJoIvqUWenTRrQRzYrBBhvOLir8Yyge
	t2rupNoAxQUgcmwwHeFY8/4bwxKCbcdToMepePzFpSkk7hhWx7FuG0dcJ6XklXZtKqFWdPCroAs
	S5HHuKaN6Vd+4BAuKylKD7ZntPkZVKma9rp0M=
X-Received: by 2002:a17:906:fd89:b0:b87:711f:97a3 with SMTP id a640c23a62f3a-b8dff73a356mr143900366b.35.1769774333695;
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
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
Subject: [PATCH v2 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Fri, 30 Jan 2026 11:58:44 +0000
Message-ID: <20260130115850.253555-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27667-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 4C66FBA47B
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d77934872cf4..cc7d3872e9e4 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0


