Return-Path: <linux-renesas-soc+bounces-7416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A4E938E5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD973281DAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A08216D30B;
	Mon, 22 Jul 2024 11:50:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858216D30F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649048; cv=none; b=VBmmka3SP0u13JHJ0lC8eNftnjAF2xK5EkifHtDhdPJm1gPe/jRx8cp5p1h+1jMfpZJKqLLGINwQVmLb59rZVv+yx+OiEh5Inoh9TUooQ9BiVT+zMKDUXxxVD6LDavBEZKrN7PwgZHE06WDE5lMZlZEOsJ7/kH8ZZ+Wngqz/HlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649048; c=relaxed/simple;
	bh=0vDPthtPTiECVi7PG2+Q5xFAmR/fIxbXzbcOEVdryt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qWWZx92lxC4rc2cgCAmLRLXnoAFFjh5dnOn8r20tqAmHrBUc9EtZ6hhSx7Sg5BO02Q6KdkaC3nTr7mLLKVr2dUxUc2I42tlwkMGTeZ/kNwZoHm8rDEWXIpY76WxQIzzqCkO7jDh2GMh0jXPgZUb65KAVa6WhLWxvDZb3OB1K3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by baptiste.telenet-ops.be with bizsmtp
	id qbqc2C00N1wvoRx01bqcUD; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAF-3X;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hW-I3;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 01/15] clk: renesas: rcar-gen4: Removed unused SSMODE_* definitions
Date: Mon, 22 Jul 2024 13:50:21 +0200
Message-Id: <19f84bfec94eab5f301a9c33563c285ab59b9b2a.1721648548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721648548.git.geert+renesas@glider.be>
References: <cover.1721648548.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All SSMODE operations are done using CPG_PLLxCR0_SSMODE*.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 77a4bb3e17f34848..72c740f18ac9b370 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -53,10 +53,6 @@ static u32 cpg_mode __initdata;
 #define CPG_PLLxCR0_SSFREQ	GENMASK(14, 8)	/* SSCG Modulation Frequency */
 #define CPG_PLLxCR0_SSDEPT	GENMASK(6, 0)	/* SSCG Modulation Depth */
 
-#define SSMODE_FM		BIT(2)	/* Fractional Multiplication */
-#define SSMODE_DITHER		BIT(1)	/* Frequency Dithering */
-#define SSMODE_CENTER		BIT(0)	/* Center (vs. Down) Spread Dithering */
-
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
-- 
2.34.1


