Return-Path: <linux-renesas-soc+bounces-11575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8009F7DFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E3C188DAF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25DB22757E;
	Thu, 19 Dec 2024 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iW7Z/Aex"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8B22616C;
	Thu, 19 Dec 2024 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621923; cv=none; b=Gisc8312/572cPZJBKipDofMwhsOiNUjQ3Ol+LZlQSn5BZ5oBqhYNPKOPSBoxCEJvdBi6dW8bySg0H0nodFOz2rq125wlJ7o8oJHUSt0qqQINa27VhQXm07I39Mh7Unfk/ngnvtupR82SAl/fwshuOt56vFaDYrgXbU84+qIiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621923; c=relaxed/simple;
	bh=5GhY/njQFL7MQII0Jr324eXskY34hFLsy/SneCYDnnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiUcwDWQD3cVqjTy+/XTOZOhcywWKeNaPgTLPT7udysR6kg7kX2NchHXxlDSqQUT5UPAINjUfWOzpImA6qEcnxpSws6CFn6SaPLkJicJqZnFw6eiQJ3G+OEUlI7O0th5RHCrZsVGOJtzZCeCE82yU31Chqn0kF7w1KJPyvvuAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iW7Z/Aex; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C14E7AD8;
	Thu, 19 Dec 2024 16:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734621879;
	bh=5GhY/njQFL7MQII0Jr324eXskY34hFLsy/SneCYDnnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iW7Z/Aex/8Vx94Vjl6Z/sZIrPecQ2JgHSPz7vRPAQ3+LwZWnsuKdfGxJFjjyEgiRg
	 8v2erHJjQmw8iTpEhWAA65NjBgRBfyiNUyBR7u/23eHtyjY9r3O1Yo4xvlBEJ0HI85
	 pKNx4W3li+k024NhqqNcjkcTiwnwGETpLKeSOSTw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 19 Dec 2024 16:24:51 +0100
Subject: [PATCH v3 3/4] clk: renesas: r8a779g0: Add VSPX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rcar-v4h-vspx-v3-3-8fe8d2afb268@ideasonboard.com>
References: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
In-Reply-To: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=5GhY/njQFL7MQII0Jr324eXskY34hFLsy/SneCYDnnM=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZDrakr/9K5Ej6SfgVH64XqnMCTeWfsvDDvBrf
 Lw8iN9zSTqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2Q62gAKCRByNAaPFqFW
 PLMDEACc2Hbjfq1YfbI01F+ogZ0/wpBJWnQEwdBzgFf5m1HCPZmebsu/KQXBRpY9PAi2kvwWwCW
 9FI5L2fv3yXNn2HOaIo6KgbQDBtLUFL6+QWL96OxbyuJvh1TNdDhzNLDkEeo7P3m3EEcDXP05tz
 4FuECJriYQGhs9mWJ/Ji7yd1i07Eh+iBudk2hEnUcUlYfxa8ZzMOk+7C4SBfmSTQecogCfKCTOR
 fH/b7XR80PXwvOZwyIo9gs++OBknu1+HYy+AMOu9Wscv/p9xU8u8m1QvsnVajscwY1/Gzcxe9QC
 HUXma0qNQ+QlS9W8sIS0ERKukmDsycRzq7DNuSfdygEYMmkkdj3xYMAvKs5LLcZIww+fYJPDW0q
 5jrsZ4EtuGJzRw8MSuIzlZHM+70Dzreyx8ERKAJc0ejWiiG1mChEafpF9cFqFz3qgkhu/kQdM9h
 NG8T4k9t4/5YYmPj+J2pSzSNNCnAurbir+DaNoO/x3kbOVSdkupC6Fcf10OuTz3XtvL3Z8BAXeO
 J22EIVZEV1ARqAkp1GK2LPS2D/Kl2tTsnKseoX6RFWKAPvBP6Cln7wYKi10/VTrHctzczXoSirs
 LiuU672ZzFeZyZdL2kl5G+fDuTUqWublHQLy1BwjWueYe0g5hqh38t9juZWtZk06ob/cY0ukHq4
 sa5Zu1sh+0ii6ng==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the VSPX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v2->v3:
- Re-parent the clock to the 800MHz R8A779G0_CLK_S0D1_VIO
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index f41e7382a5e66ed15ce4e977691c8b4bdf18d255..d45571096b963b2e204e5d6b9426b664369cb942 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
 	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
+	DEF_MOD("vspx0",	1028,	R8A779G0_CLK_S0D1_VIO),
+	DEF_MOD("vspx1",	1029,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),

-- 
2.47.1


