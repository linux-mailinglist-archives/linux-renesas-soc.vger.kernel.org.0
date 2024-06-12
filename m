Return-Path: <linux-renesas-soc+bounces-6099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C16904CCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 09:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0D681C242B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8323167DB8;
	Wed, 12 Jun 2024 07:26:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF4168C1D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177160; cv=none; b=hIcHZCCW0wk1EWjQK8LA2spBrSW6dGmM4l52hEiWSDaosP8ZHWAlm6NkvWISTrhdu/eGOWgX+Lxfc+1R7pm5R5gd3hn3J3VIm2xkyLlbquRIctZd+9Kg0VD+2+Yr2sb8veHosDLHk3rTNNswqob8KT7MGq8G1mlajdOtvJpfHq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177160; c=relaxed/simple;
	bh=UMnagGEc0XekIe4D57yl7S6xH+N/zwySCoc10/zHPAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i5UV9++XZDm07/V9hYILEdKOY1jAoTEGoX5lgdARiHEOLOq+/kE5+H8AHtzZMQsLeAFTe3nrMh0D9VZcTP6J4REuhRzMwNFhXkCi13ZlEnzpxkLshAEdNZKrvgxj0o518StrkjiBJ2dz4y2WOGiwHDerm1Z5wOqSngASKPhq5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
	by laurent.telenet-ops.be with bizsmtp
	id aXRx2C0013axqkY01XRxyZ; Wed, 12 Jun 2024 09:25:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHILj-007ObR-Od;
	Wed, 12 Jun 2024 09:25:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHIMm-00E9a0-Rl;
	Wed, 12 Jun 2024 09:25:56 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Drop "Renesas" from individual driver descriptions
Date: Wed, 12 Jun 2024 09:25:55 +0200
Message-Id: <185323de4d38b9b599775c1b64ce4171551b98d5.1718177124.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All configuration options are under the big "Renesas SoC clock support"
umbrella, so there is no reason to repeat this for each driver.
Hence drop "Renesas" from the few that do.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.11.
---
 drivers/clk/renesas/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index d252150402e86366..4410d16de4e2a51a 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -218,14 +218,14 @@ config CLK_RCAR_GEN4_CPG
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_RCAR_USB2_CLOCK_SEL
-	bool "Renesas R-Car USB2 clock selector support"
+	bool "R-Car USB2 clock selector support"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select RESET_CONTROLLER
 	help
 	  This is a driver for R-Car USB2 clock selector
 
 config CLK_RZG2L
-	bool "Renesas RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
+	bool "RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
 # Generic
-- 
2.34.1


