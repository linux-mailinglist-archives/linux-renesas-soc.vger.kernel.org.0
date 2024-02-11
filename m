Return-Path: <linux-renesas-soc+bounces-2590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4385099B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 15:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017441F21B5E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 14:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580515B5C9;
	Sun, 11 Feb 2024 14:23:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832A59B4F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661388; cv=none; b=Nh0Z5FYKT8a/3z8W8N9cJIQkFbnYA0yj9/qDNu2tzz59kiG1RXLRbGzVHy8WGbaZF93olQJ+7Z9SUXI4ra8/mm5+DQALFbvhQpS8UNbWA10Yyv9YplXlvl7IYIm8dq/QEzXJOOeYi7m/jGcVmbTRCxZ0oDOWv1q7HEF3JxmII+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661388; c=relaxed/simple;
	bh=nrxTaYyayeEAbX7cZFDXgV3HkCaKcBBZ3cXv2UpBXOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SpZ5k65ZRJjN4q3HJ7r9yCzl4vCROMo3+Z9G1ndKZ2PPEkD9m8t9smeTsFXmnT11VRuNOxdKuKL3uEP32TX9i/hIqJFBwxRmQelgOQRNCq077w8OJv7Juv65oaVyI9wb/kOGGEcfB1cMDzNwGqyRfIGfaqtTvdcbTDhbVz4k2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TXqYv2bGyz4x0WQ
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 15:22:59 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by xavier.telenet-ops.be with bizsmtp
	id lqNs2B003493aJM01qNs30; Sun, 11 Feb 2024 15:22:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAjH-000QhI-2k;
	Sun, 11 Feb 2024 15:22:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAjL-006Wof-Vw;
	Sun, 11 Feb 2024 15:22:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add EtherAVB clocks
Date: Sun, 11 Feb 2024 15:22:46 +0100
Message-Id: <a5b4252d9822ded3fd523bc35417306cae2ec2bd.1707661303.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the Ethernet AVB (EtherAVB-IF) blocks on
the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

Changes compared to the BSP:
  - Rename "avbN-rgmiiN" to "avbN:rgmiiN",
  - Drop blank line.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 70d104393594091c..46202e367d713d41 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -173,6 +173,9 @@ static const struct cpg_core_clk r8a779h0_core_clks[] = {
 };
 
 static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
+	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
-- 
2.34.1


