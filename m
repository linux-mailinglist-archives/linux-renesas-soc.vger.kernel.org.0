Return-Path: <linux-renesas-soc+bounces-13454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241E3A3EEED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 09:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7915317F039
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 08:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEE61B0406;
	Fri, 21 Feb 2025 08:45:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC3201005
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127500; cv=none; b=bTzSgZoRfrXK/GclIFt3zyuzenIpjeuA1yfB/un6zzbA5rw3SDmtNrtbjyKtEI1NNCTLMsuDNu18xxyNNKU3yh9nVAiHH6R8Mhk10EMe8q8OyommjNdoCHWoontt70bV3HHwV0YLR7sh9VY2lnEzrV6+7ZP0jGFKRXKRKDLdQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127500; c=relaxed/simple;
	bh=j/3PdtzWpWzBm2J9MQh8FH2EGJEGksBmZ1DN/D/ISNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8bVBxvz5X9KDsiLa5z4hsuJwWlPmmGjQBkq2Dw9h86ZqWnJ7mxmJbYkMR8q/zBvFRu4fOHJ079brmVyBMYOY4lV+kna/Mi447p+csOYc45U1wU9MSYJ8tn5ME0hO0buBTwNK38H2kX3OlXOj9l0EqNrVrGpyxXCwbEVECoXOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by baptiste.telenet-ops.be with cmsmtp
	id G8kp2E0070y8aK5018kp1P; Fri, 21 Feb 2025 09:44:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOe4-0000000BKsb-2yMc;
	Fri, 21 Feb 2025 09:44:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOeP-0000000E5K1-0W1i;
	Fri, 21 Feb 2025 09:44:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: cpg-mssr: Remove obsolete nullify check
Date: Fri, 21 Feb 2025 09:44:45 +0100
Message-ID: <59ef3eccde0b0b63626480f27e77d5c68948ca98.1740126560.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740126560.git.geert+renesas@glider.be>
References: <cover.1740126560.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All core clock nullify users and helpers were removed in commit
b1dec4e78599a2ce ("clk: renesas: rcar-gen3: Disable R-Car H3 ES1.*"),
but the CPG/MSSR driver still checks for nullified core clocks.
Remove the obsolete check.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index bf85501709f03b91..da021ee446ec8120 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -338,11 +338,6 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	WARN_DEBUG(id >= priv->num_core_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
-	if (!core->name) {
-		/* Skip NULLified clock */
-		return;
-	}
-
 	switch (core->type) {
 	case CLK_TYPE_IN:
 		clk = of_clk_get_by_name(priv->np, core->name);
-- 
2.43.0


