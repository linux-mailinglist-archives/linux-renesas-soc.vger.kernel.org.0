Return-Path: <linux-renesas-soc+bounces-3508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD078734EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 11:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2A2282473
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 10:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A4E605BF;
	Wed,  6 Mar 2024 10:52:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB195D8F6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709722339; cv=none; b=fS1Y7KMFAvNpo+qXYs7bIaZJPPg6nNksF/Gzny8yrwYjsLrtfdCFRgeVxM+YlwIJX1fnRCW+ASFpSvfsMOV/KVPrKn4eEnoBEXG6BO5R8qbjUqQjTQ5dQsTsR3/rQO00NSk+lyj4WLT4/r7RDJ/Z7Ep+VVjKPKGQ3OzgQFnxKTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709722339; c=relaxed/simple;
	bh=dgH6+6yoJ7fNzf9QTPuENGsrnfgnWNDP6tn1WLOKBgw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=go2MKRqzcwCucY8bRqmatyCbaQKVoPdtOPo+iVnY3cPBmhh2lAKHj1Bp0JXyJl8MOtxrFI9L4pxxUsyYWg4/HthbAUuyEo8ewTX6YbN3qAU1pA+bLSQZenkeul+d4UAsf+ZFaJ8OZATgpZXUFQHHvb311SI92i1iGuu/+jcYOZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.187.55])
	by michel.telenet-ops.be with bizsmtp
	id vNs82B00T1C8whw06Ns9aZ; Wed, 06 Mar 2024 11:52:09 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rhosN-002Y7i-I7;
	Wed, 06 Mar 2024 11:52:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rhosa-00EMHD-MZ;
	Wed, 06 Mar 2024 11:52:08 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add thermal clock
Date: Wed,  6 Mar 2024 11:52:04 +0100
Message-Id: <befac3e8342cd552f580d34be863ef84403c541f.1709722056.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the module clock used by the Thermal Sensor/Chip Internal Voltage
Monitor/Core Voltage Monitor (THS/CIVM/CVM) on the Renesas R-Car V4M
(R8A779H0) SoC.

Based on a patch in the BSP by Cong Dang.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

Changes compared to the BSP:
  - Rename "thermal" to "tsc2:tsc1".
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 71f67a1c86d80f4c..5c48e645f0c3197d 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -192,6 +192,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
+	DEF_MOD("tsc2:tsc1",	919,	R8A779H0_CLK_CL16M),
 };
 
 /*
-- 
2.34.1


