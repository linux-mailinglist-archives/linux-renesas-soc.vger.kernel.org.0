Return-Path: <linux-renesas-soc+bounces-27526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GsKM6YIemkK2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:01:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D53A1BF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88ADB304FC04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45422352C5F;
	Wed, 28 Jan 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an79Vu+B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD3350D52
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605142; cv=none; b=IxfgTDN2gRNgayyJjO1mJ/tMfUPvBNDPfmkcojG+Kj490B20fv8ocXA9Cczchbg/IC9XIrli3CCVh/4Ib+DEDq56AkUPq8uSmn9JtI5JcZX2nubhDGcjjA3fpuLTlAnqCIGKc9D6sqzUhuYr1+YaTCmYYGYY48Q0ivwyHbL97Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605142; c=relaxed/simple;
	bh=ZMSEbUn2rNHG3ChfjzjL8mmy+jPIA8ebIl6kc+le1vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6oqCyTbwX13IRBlBCPDUKjUsVLKZI2L9iHRhsS6aBsgkzYAH09GXVDtLjX/WzLqY2LydWLG/ayRdowhXf3r1UjHuWmdxkcxeRNMzu2j5GTGWADHtL7JA6ubRBPlBlR0YgLWhWZoTnmKSYKwQTzyKnaJhnehdAueU/hts2XERyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an79Vu+B; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65063a95558so9279056a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605138; x=1770209938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGAUwDv+lL3+4dwuDknORmpSBzHg4WpRaIurkPYiIOM=;
        b=an79Vu+Bieigsu9apodcTzGeZHWyRnqf9DR2I05llkHM6bV+D65vhkWQSI1Bj37/t2
         zg/dMxvN2kixQcvIuxxYctPQX0g5OKrWCCWeA0KOxN2LuVaCk8cfaVnTyoEJj61lMUlI
         zE3JqAnX/gmma8DQiZR5w2zaRTONCk3SpZD0nP0RYnfLMvDU+bcq2VGctu1FSVUsX78o
         tYlCiE+3KXCcm5AFBgmhKyUUsZ02pj4UxJSCMO92UZLeFafUL2XY+AtW+5nXsoclVlWJ
         VpG8fyZQcLJr3GZddfNAyb8ho7EB8W/aE3Wm/mvyrWYzSYJMO4/6fW9KhcmYfH0TTFif
         a1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605138; x=1770209938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGAUwDv+lL3+4dwuDknORmpSBzHg4WpRaIurkPYiIOM=;
        b=a7vtnedjjGqZMVwkHu1j+UJu2n5Sr6X4DQDnKEkG+6uCAHMRPgArBIoaJp36wQUuNg
         NUuDE8ZoFIcGSM/uyFeopfqtAJOiDmyc6BF5u+3jSxygjnpF/7uS1mKtJVnMGADQKF4r
         oVoRKi6TOe4VzQ/tN1NTtjZXPqYpDp+14UUceI2q4Tcg1kDi+LA3Uv3b+2aO01IgKmEa
         htXF8BqxF6c+1Xd3K01u3bhdfV4/64IrtKSYQRB7TfNfjOk3hwuH0gplPdo9SLA/7CPs
         uvgq8lF0RGuQIhJyg9p/swmTinw6B5kKAOlcAD/3OlZ1Io1UkHESbi+kNd41srTqg+BP
         KfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRvX5VnWTGozpE4avHNZphvaSgxoUILlZ64JWH77V8QFLJe/mX+MXAUDjliBZBU9sHFy9nwPSfvJUqaXuruGMMKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQujaf6anjp9sL1A1lfLnMT1xNc13mRp+46ywLxQwqOzeznOA
	7xUIj3gNMLZp13bd7vz/VHAupwa2q+wtXe6L/J03KTdR1MYvrMovUpfitpe3cQ==
X-Gm-Gg: AZuq6aINrAZ2XDdhmy1oeNtcOz0rm/JGCIq10Jy9EG7fRwKSeX9DXlVC0lQHLpVH3S+
	bNN6tzmhz0KgwVck+GQhM62bl6VcOazdXfdJ1oIfRnXQv7rnMSC+d0j6AuLzFS/8c7sNaDpHNzr
	TmDJTC8bvDbOdPo6wYHcAghdslGLA5hmnmdb/RatchtdhKUTdPIyhLzd7mKK3M6BcJrMcEc3fdm
	SY8Rr4RAg84jtVvEWpVFEa9V3SSxoG/rlXN2Xrvhwfpm8GXLSMGW8/23oZpuTOy1cYJgMPa4iaf
	NpriM0+V0Oq1kgU3qsmjY3DlZ2E5K5ezwJJkTg4VM7dyfZlNt7UMgLKw9j0MMHRzNuMjUhVW4vS
	RCcgx3Diw10lIZAPt+LnaEaGS1OqbJF4FSaskLu05dO88vm9SG6gnBjDItTABeCQnMec0s6B/T0
	PNyi7ScRCEzfVu8gM+PrQCawtMaAWpZiw5g9Y=
X-Received: by 2002:a17:907:3e90:b0:b88:31c1:c770 with SMTP id a640c23a62f3a-b8dab130a35mr365619266b.5.1769605138264;
        Wed, 28 Jan 2026 04:58:58 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:58 -0800 (PST)
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
Subject: [PATCH net-next 5/8] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Wed, 28 Jan 2026 12:58:42 +0000
Message-ID: <20260128125850.425264-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27526-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 12D53A1BF6
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


