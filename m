Return-Path: <linux-renesas-soc+bounces-1828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1009C83C6F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 16:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A52531F242C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DFE74E3F;
	Thu, 25 Jan 2024 15:35:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9D374E38
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196907; cv=none; b=iCL2NF1mnE47Pdce5/bltEHuojaOEP18ihyOcZ/Wyw/u9IUkoGRzBppqfqeNDV/VRjdboShEvRKygeR/WFmDrTo+tDnqOtn6cLzudNaXG95tvVhyr0WI92t5QdG88h6tWS9VaF4fcdlVj0rxud7dBHUjsdMcHD1Z3GnNcQHjDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196907; c=relaxed/simple;
	bh=93GkKmd4fyfQi5SOpTnAYdsS7YxqGZvt4lLw8GcEVM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dt6mB1q1LrJLFB7L+GWvzvW2vQhaAwcsAiJgC/oo1OG7g7LusJ+XUeTw0UVzqnnebyjus9k+n/njDIj9ht31I+Gmeh6dvc+iOxfH6hqonfDUBmaEPskNy0L6QhkY5lf3+RoUVV11+laB8qWQN6UiCJD3ty+mkL80XoMd+A29sG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TLPyp5Bv7z4x2Nf
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 16:34:58 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by xavier.telenet-ops.be with bizsmtp
	id f3am2B00858agq2013amcN; Thu, 25 Jan 2024 16:34:58 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1jo-00GUvt-3q;
	Thu, 25 Jan 2024 16:34:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1kc-00Fs2l-3A;
	Thu, 25 Jan 2024 16:34:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 07/15] clk: renesas: rcar-gen4: Add support for FRQCRC1
Date: Thu, 25 Jan 2024 16:34:35 +0100
Message-Id: <f64d5573a92a18505619ff0ff808d50cfc2bde55.1706194617.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706194617.git.geert+renesas@glider.be>
References: <cover.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

R-Car V4H and V4M have a second Frequency Control Register C.
Add support for this by treating bit field offsets beyond 31 as
referring to the second register.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Tested by enabling CLOCK_ALLOW_WRITE_DEBUGFS and checking the impact of
CPU core clk rate on CPU core speed on R-Car V4M.

v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 8f771fe59bfdc756..8e4559fbb0bc3352 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -220,7 +220,8 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
  */
 #define CPG_FRQCRB			0x00000804
 #define CPG_FRQCRB_KICK			BIT(31)
-#define CPG_FRQCRC			0x00000808
+#define CPG_FRQCRC0			0x00000808
+#define CPG_FRQCRC1			0x000008e0
 
 struct cpg_z_clk {
 	struct clk_hw hw;
@@ -345,7 +346,12 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-	zclk->reg = reg + CPG_FRQCRC;
+	if (offset < 32) {
+		zclk->reg = reg + CPG_FRQCRC0;
+	} else {
+		zclk->reg = reg + CPG_FRQCRC1;
+		offset -= 32;
+	}
 	zclk->kick_reg = reg + CPG_FRQCRB;
 	zclk->hw.init = &init;
 	zclk->mask = GENMASK(offset + 4, offset);
-- 
2.34.1


