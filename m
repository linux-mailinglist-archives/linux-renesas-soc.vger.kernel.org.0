Return-Path: <linux-renesas-soc+bounces-29269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MeSMVqgsmkOOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:15:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0479270BA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FCC7300B461
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C633AF65C;
	Thu, 12 Mar 2026 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKfL5WS0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F139DBE9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314133; cv=none; b=neqZRfBe387pD7SUxy1NNzL3APZQPu2txVMonrkBxM5DIszUd4SGpM0vvrCnGcU/uFWoQcmNOv5ApvBuoMYM4UUmKRIeEbiClOOUZQyx24hzxV8p5Ll12sGtzRlExEGOvR7DV6mLnLuSJWFqTYBy69gPFqs5546/02rxJUf28PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314133; c=relaxed/simple;
	bh=mVSTiklgT8j2fcLLBeE0uC2mMSd0YvRYVEMiGlYCFRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4dI2Cl/J3mIVhHTlagdbBKZw8qmyYmbcm6Y/8/4xLCNpEwam05QJdiS2eHfkhDaqpojnwNDwO4xjEI/mPyXAF8GcSrrqBNCGhAEjahMVDRBji1Bj3biz7cEOEsuiw8LDeC9VQYW9aZE5Z9PW42yDu9/O0aRrdczYBV0QgDA2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKfL5WS0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so9417665e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314129; x=1773918929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfRnDFh2VU0AWQY5oFOwQ40Dt8Qug7bA+xDy5JGD8pY=;
        b=FKfL5WS0SMNkxGZntTuKtrj52AOGiMvhboUJ69/l6qm3kJgAgbBvYyw3e6keBUt5CO
         pQpii9gzbfp4oMaD6DyNbyIvdWAD97CnTnR/OCCfo/UywLIzsL4byUo1VOoVEKH2kyBa
         8YZ8wKnM/2JsRexuMhRruj4V3kUwU+iozAoZqnokhUSa93Yd9ZaUmRRFv1Ib984dsWHS
         3LSB3lQRaDJYorF/jEJoZCc0nen3Ai0fcMmhMSjZHLbtaVjaC9smTi8OmwqbwRZNbBO/
         B/hfDauamYlwTRT6AqFvf9p5rV7IOT0SZCy9km1yUA9UTXiIHMfC5CSOHPoILeMFfTU9
         rvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314129; x=1773918929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfRnDFh2VU0AWQY5oFOwQ40Dt8Qug7bA+xDy5JGD8pY=;
        b=h0wlh+cPRHYuDsBPrPEleqRJTvknTaJ/sVEceewu4/50zjKPrz6xClXARqZqFTgTU/
         gbKubfTMSrDK0KEGU2bc+4qkli1MXp6nwSL36mwCWNzgKs8hwrXm6SdAqwZdlx8A4/eu
         AgWa0GevTwAx7OJ2MbNOBjA5RtbcRj/H7H+qjqwtgRm8Idyy24ohWJvBLwUmlue+oejS
         S3YEIN/FUurGCKm07D1AoYz2DRqJfZC1oqGyiyfW0HIhcdGhKJpnzPTb3xduJ0Upm0Ia
         xkkFLUnfzOmVTAVuCVEBsu4jGuANzPjt8R8Ws1X+T8viKbTUyQhYaBRYFYVkkUrsQOlG
         0Cxw==
X-Gm-Message-State: AOJu0Ywixc9ulycJnwWZmdC/EDV1E8Nuv8rm9/6roFWBznLMQ2ZYeAwy
	2gjGI3grvpzdi9OZNZE9eW1W2Jm5rqMdKw57VFR0GZU7FioFMJuBX/lV
X-Gm-Gg: ATEYQzw50WhKVzRA5D8o5fNqwtaxYc5CtV9UmzlOMP7b4iJaxuNnEGxqdwh7jKBlJ9i
	a5OuwJZuEsOzydjGpZ0ceFjaQbg+dE9FzIjoKQbMKt7bkOb5OMjOhFBU/Vmo73ZyqmSckV3osGb
	FN1XTl55NQZQIMVnXIBZeqCM1fe1CbpUONMqJ5YxCoe+gYPZd9p3klIdbfZZHiBTD5p50q91Mpv
	WD2xPedrRf7DjW/ZwYqc33WeqppN3UgwggtYXgBimRyRACLSC4XugQwsUwj0Y/KXuTNaixg0Q/d
	ScqjSxcrcz3q/yHgOJuhjmYZW9GpWQJDmDK2MAxguPGuHJVHECdyfQPXKxGmOK2G2PY2KEpjjOw
	5YITtFfzETFTpSDFLRmwD3HBVx9rh85lfS/G6J8gialJQwycfcBFRfOWi0sa+43gXEjIHh1hoYf
	hTOAI7yMWTPniuQnZWSvh1i3fbkjKyFxEIjw6UNkZG932naV5AVVnr0UGX8j2moeoEzzf/vKSoR
	/swPg+pjtPfYh+mDk8HWQNBamADxQb0hitY8g==
X-Received: by 2002:a05:600c:1e8f:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-4854b0a4c24mr99535165e9.1.1773314129024;
        Thu, 12 Mar 2026 04:15:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm311458385e9.11.2026.03.12.04.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:15:28 -0700 (PDT)
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
Subject: [PATCH 1/2] clk: renesas: r9a09g056: Add PCIe clocks and reset
Date: Thu, 12 Mar 2026 11:15:20 +0000
Message-ID: <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29269-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0479270BA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the PCIe controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 549c882f9a18..6f9aefd5f069 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -505,6 +505,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("pcie_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,
+						BUS_MSTOP(1, BIT(15))),
+	DEF_MOD("pcie_0_clk_pmu",		CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
+						BUS_MSTOP(1, BIT(15))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -628,6 +632,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(11, 2, 5, 3),		/* PCIE_0_ARESETN */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.53.0


