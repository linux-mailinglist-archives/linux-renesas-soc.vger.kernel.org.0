Return-Path: <linux-renesas-soc+bounces-17398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677CAC11B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 18:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE821BC0DE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990AA29AAFD;
	Thu, 22 May 2025 16:58:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4E29A9DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933122; cv=none; b=Q6hs1+vnqxrYpLqjuDmwOp4CeA7909l/HwhFzlm9VrOFwsUdKILkk2A6uw1nkp3hu480qEos2xn6FzRKvmIaL/p0fL9oGkcs0IQcVyxllKhFSQX/ECvU4Mwkq0aPl8JYTVZ1JHmLIgUcFUnMFP1I1uk/2Nz5REeAx+KiGeX8Ty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933122; c=relaxed/simple;
	bh=MDIiRkETpweUIwbIp2D/iMG81qbXBE4dZD6fYofTR+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/oi0d49bxDNIIAb7A4OPoIeW7yf12CZeenPe9MARsiYGFof45mxydo9YbuwOqHNPMik494m+vknQArQrF9K0mdRYHcZmHMH9jGd2DXd6wTRggJWTrDZ3ZYPxw3veqxewkzRBUU/TF05CglKSE1eyhoPZjWldbtvn7JEPaMzaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d2b9:ec6f:2b7c:8637])
	by albert.telenet-ops.be with cmsmtp
	id sGyX2E00B2sH3jG06GyXhB; Thu, 22 May 2025 18:58:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uI9FJ-00000002pSk-0fZn;
	Thu, 22 May 2025 18:58:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uI7oZ-00000003K9w-0fp1;
	Thu, 22 May 2025 17:26:35 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rzg2l: Rename to_mod_clock() to to_mstp_clock()
Date: Thu, 22 May 2025 17:26:32 +0200
Message-ID: <cb0d43138aa443578dcfdaab146bf9215cde9408.1747927483.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the to_mod_clock() helper macro to to_mstp_clock(), to match the
type of the returned structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v2 3/8] clk: renesas: rzg2l-cpg: Add macro to
loop through module clocks"
https://lore.kernel.org/20250514090415.4098534-4-claudiu.beznea.uj@bp.renesas.co,

To be queued in renesas-clk for v6.17.
---
 drivers/clk/renesas/rzg2l-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index dc92f09d5616223b..9449a5a5714302f8 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1200,18 +1200,18 @@ struct mstp_clock {
 	bool enabled;
 };
 
-#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
+#define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
 #define for_each_mstp_clock(mstp_clock, hw, priv) \
 	for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
 		if ((priv)->clks[(priv)->num_core_clks + i] == ERR_PTR(-ENOENT)) \
 			continue; \
 		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
-			 ((mstp_clock) = to_mod_clock(hw)))
+			 ((mstp_clock) = to_mstp_clock(hw)))
 
 static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mstp_clock *clock = to_mstp_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
 	unsigned int reg = clock->off;
 	struct device *dev = priv->dev;
@@ -1251,7 +1251,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mstp_clock *clock = to_mstp_clock(hw);
 
 	if (clock->sibling) {
 		struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1271,7 +1271,7 @@ static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 
 static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mstp_clock *clock = to_mstp_clock(hw);
 
 	if (clock->sibling) {
 		struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1291,7 +1291,7 @@ static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 
 static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mstp_clock *clock = to_mstp_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
 	u32 bitmask = BIT(clock->bit);
 	u32 value;
-- 
2.43.0


