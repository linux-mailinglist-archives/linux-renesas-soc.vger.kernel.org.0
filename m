Return-Path: <linux-renesas-soc+bounces-3163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74487867291
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 12:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F19F1C27885
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 11:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B1A20B38;
	Mon, 26 Feb 2024 11:05:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5322032B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945537; cv=none; b=XExKu1QIqvgpH9ZC6mwskDh74NHk2bkcnJAlGKOlM5a4zjBkw9dwoIOrFBoI3kDxTDJf/7QYblpghRj1SDWdHISAAjA5cozwdQEwahMRqvaEs2FWzArHrr9Sqf8W5mD1cXIlP/qU5XD7vSVQCk531V08SWzRIW1iXrOVMKdn0XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945537; c=relaxed/simple;
	bh=yLtQ/+RgVEkDmhivdlgaIQBj90rcXGFslKcpEwaRft4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qWqj0FeC3S1nvwb8qpVsYSfQTKPIBPq0jojPuFwKNis7IY8KcPxAh02fX+ftrPjOehTmOpZIHhVk2/S4is3Pmi20chpIlh9xLVoTOr+SY4Y0Uw5UKe0WL9MIv0tza4h2HUOsSEU/kBrtxT3+qhlAt9goZP4T+vIDr53zi5N/kM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TjyLg2PR9z4x1QJ
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 11:59:55 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7662:e968:947d:f3d0])
	by andre.telenet-ops.be with bizsmtp
	id rmzn2B0075Kh3Z501mznLG; Mon, 26 Feb 2024 11:59:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1reYht-001lUq-KN;
	Mon, 26 Feb 2024 11:59:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1reYi3-004Euk-2r;
	Mon, 26 Feb 2024 11:59:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: r9a07g043-cpg: Annotate RZ/G2UL-only core clocks
Date: Mon, 26 Feb 2024 11:59:45 +0100
Message-Id: <ffcdcd479c76b92f67481836a33ec86e97f85634.1708944903.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M2 (CRU main clock), M3 (LCDC Video Clock), and AT (Cortex-A55 Debug
clock) core clocks are only present on RZ/G2UL, not on RZ/Five.

Annotate this in the comments, like is already done for module clocks
and resets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

 include/dt-bindings/clock/r9a07g043-cpg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 77cde8effdc73c6f..a64139fec81520bf 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -16,15 +16,15 @@
 #define R9A07G043_CLK_SD0		5
 #define R9A07G043_CLK_SD1		6
 #define R9A07G043_CLK_M0		7
-#define R9A07G043_CLK_M2		8
-#define R9A07G043_CLK_M3		9
+#define R9A07G043_CLK_M2		8	/* RZ/G2UL Only */
+#define R9A07G043_CLK_M3		9	/* RZ/G2UL Only */
 #define R9A07G043_CLK_HP		10
 #define R9A07G043_CLK_TSU		11
 #define R9A07G043_CLK_ZT		12
 #define R9A07G043_CLK_P0		13
 #define R9A07G043_CLK_P1		14
 #define R9A07G043_CLK_P2		15
-#define R9A07G043_CLK_AT		16
+#define R9A07G043_CLK_AT		16	/* RZ/G2UL Only */
 #define R9A07G043_OSCCLK		17
 #define R9A07G043_CLK_P0_DIV2		18
 
-- 
2.34.1


