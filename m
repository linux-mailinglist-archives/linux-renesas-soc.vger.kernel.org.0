Return-Path: <linux-renesas-soc+bounces-25136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245ACC874C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF083B50D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8415833BBDF;
	Tue, 25 Nov 2025 22:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elswSCtU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95D3385AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108876; cv=none; b=PYJ78Tez3smrJ42JTzRB4SYHBit8vN8Pg+sHrHiq3AewZqHUOcTqRVO5gJVxlZO5c94Z5JK637TfC5uMIbmjXOSCCzQcBD1v/fTbeFkPgM6CrZTSaZVsSSdvQcfMR2NQlKA27Go58IhUTHQWXmVVcl6rezuK+E2Mgq4dB++Ba/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108876; c=relaxed/simple;
	bh=XUFzWpfEpUNKKSw9VZLQmPvSMy4TN8jsUWnYvc5kako=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyQ/gLM0zTlzC4MCXJrIua9JCfEBt6x6L0lvWpI1KCg68LP5tVQS3JUg1HBYrtDcFzQcaoItTpa8B8FLEtS9zQoJVOsuP7PM8EcyzU9zwDwBAwTVsjQSdRpc+IP4OidwXSxqBmPudIYXRRYSuG+2oonA31kiRSgSInSUuFiIJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elswSCtU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso3616473f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108873; x=1764713673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWRTrnU5YROzl9Bq0pdIZQdHhJ7q+pRTrT7iC994Adw=;
        b=elswSCtUqbXaNlWpBP78TYSJd0wl9C2a0xMkf8O8VsjNlrNIX7P8SF7cWcnLAwWAQq
         VQi31ixGZuJrWBxQmUtnRjJgd0CjBQB0WIWDt2NDwNZJ1yqfytnYKGG8V7HYfps7PiT9
         sNiJ8jFK8IkED33Ys8bgLgASjZH1GxbX0Hww4jQXOPBqGWmtpqw0IK5gfb+EKW04TpJU
         9IpSRy4UCNK08AsZRC5PM6hf7790PVOOxsUzaeVoY8wgu3idaNyRJuSGie5rKlXZaKqA
         zx71q9hMydIi6QnCbs3O/THtpdrBwfFqirzr2sRT6ZD4D5re3TuC2jngWh6heQ8syt4j
         yJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108873; x=1764713673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWRTrnU5YROzl9Bq0pdIZQdHhJ7q+pRTrT7iC994Adw=;
        b=vPnGyIJL0nXaIH/S5/gjpXqCrW9ATJQmMtLGR6qx8XinvykUPJJgdv6ORO86ocTAap
         mSPiB0zCafkA7w17GYHhDgFglMGDQz/ajntGD6EnEEErXkVk/ItmqsNorTyNwE1knyaW
         0memMAZoVxP2hYPFcvLe9aiU8vuki8TT0uWgkRYbKFpxs5v4SvoGlitPKyGtcSzEE4vR
         SMCCb2jWYXD6C0GNvCL2ZtQbTsKZvFv70U1ChOobvPpEjg7sm8eF9hOv5hE2lmA6fqoF
         6PFnhkTAx823V7s7vM/pKinbUzcgj4hNTUgqTrp0oWLP5kacPcW7dZVN6CBRKxDfaG9e
         W1mA==
X-Gm-Message-State: AOJu0YwrrMKAWMEx6vjUuy9u3fA6+Zz7HFw6mrIXA51sqSRK9ZCB3Bmh
	5wOJmpUdTmCWj6Ssb8uRTGv4gJ0+YvjUkvXwk+NJgfqpbMqD1IObp/tK
X-Gm-Gg: ASbGnctFEdHCBN/WYDkK2pfHVauwYGMxc35eX8SHpY64x0NN6OFOlpu8UfaoS5g7QXh
	C1UY9kG2o7CrHnCsKgfxIYmGMRCfct9T7L7/iIwMaDGH6yL4VjyNRvv0BUnWHTQ9RzU65wqh/Lc
	1FiVwuVJ4qbkZLri28Bx75488FXVNMe+B/nbAEbYvfBEvwEwqe+1JR9w/SD1ufCfTJ2I6Z8PN06
	0cp3UpqVdb19I8MJoGmtMJZkamk7/rjXn1zYOnloI+3OMemPFvapFDPH+x8xcFvWXiKUOJhSftT
	g9H3NTU8mORcKuw30Dq/C8h2U8heSaZzPIE+6vPYCEH8CrYYE0ORE7lVcVk9zF9mOVlIb+vSYkC
	eaTba+oF1WAhdtt8D0sMl4mc3zZW1A8PdqKWukTttwea0Wt61odTjidbLoNBF1hZkRqEUytWtEO
	B0WD0aoXDf/1TWDAgwoPhE7prhQaZP4opmFmh/Xsn6GwSX
X-Google-Smtp-Source: AGHT+IEhxPwUFNTA9UuTjc0VX5P2MIzvHVxUckJ4g7fYk9iXirjPnV/UV5jy++v9jbxNJppLQzEHkw==
X-Received: by 2002:a05:6000:2c05:b0:42b:40b5:e64c with SMTP id ffacd0b85a97d-42e0f34460bmr4420498f8f.30.1764108873044;
        Tue, 25 Nov 2025 14:14:33 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:32 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] clk: renesas: r9a09g056: Add entries for ICU
Date: Tue, 25 Nov 2025 22:14:19 +0000
Message-ID: <20251125221420.288809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the ICU IP block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 19b712685a31..1c6228b0544e 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -245,6 +245,8 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(10, BIT(11))),
 	DEF_MOD("dmac_4_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 4, 0, 4,
 						BUS_MSTOP(10, BIT(12))),
+	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
+						BUS_MSTOP_NONE),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
 	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
@@ -420,6 +422,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(3, 3, 1, 4),		/* DMAC_2_ARESETN */
 	DEF_RST(3, 4, 1, 5),		/* DMAC_3_ARESETN */
 	DEF_RST(3, 5, 1, 6),		/* DMAC_4_ARESETN */
+	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
-- 
2.52.0


