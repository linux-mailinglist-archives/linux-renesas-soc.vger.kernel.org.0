Return-Path: <linux-renesas-soc+bounces-11573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A39F7DF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C243188AC1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56289226524;
	Thu, 19 Dec 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AkpFECg/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEBC223C49;
	Thu, 19 Dec 2024 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621920; cv=none; b=gOJ2LaU2jTJej5v5QRxHJsSRIHsDEtLS3SqtlX8OMtN4AUjxrkf3UVEDqxxX8+4XBMLIuythniSOrFpytFiMq2kbMyo9+t3WM1RzZLSm/m15sc5gbPzXCSbOB/NXTRWIO8wNoDtkiM+qKZZ+SuPOmsDTU4pTF3L0G01dbYbyNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621920; c=relaxed/simple;
	bh=WUD2jPFOJ7K+9TghgBfHWQiv6ujh3Ii16RtoTY5mUhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GYXlJpqVK2DlCs8UErWojUvPsd6l3huPD9K7qu02OVELjBeziuAvVMeMiJGgS0a0kM/PRJqeUwFAgEYqbZI+3fUvsaB7MftE6z0HMKFHD9voPvVT+9902qsJnHV1dExvp947ud77bMUww3cz97SOnD2Dlyjd7UV+4aratgOEnms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AkpFECg/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31B646D6;
	Thu, 19 Dec 2024 16:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734621877;
	bh=WUD2jPFOJ7K+9TghgBfHWQiv6ujh3Ii16RtoTY5mUhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AkpFECg/CPMit4MVHYXevjoaMYUhEknQwbxddMoGYeAAJr+3aScgWOMuwMroZUi6X
	 SEz8FoiPNmhpp2zEGma6o6HUXSLhIvFQ/Fk8s5/4PFQfF21A/3YNwakwxaFrJUXzuc
	 /4jU3Org6PUmMxi/v+EUHvUzQ99esHRqbn06qWdQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 19 Dec 2024 16:24:49 +0100
Subject: [PATCH v3 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rcar-v4h-vspx-v3-1-8fe8d2afb268@ideasonboard.com>
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
 bh=WUD2jPFOJ7K+9TghgBfHWQiv6ujh3Ii16RtoTY5mUhs=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZDra+JBwLRsTnF+QvFuoWFouvOl2CSKnc/BF2
 4MufHwr0G6JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2Q62gAKCRByNAaPFqFW
 PD/7D/94FAPTVhYBLpQ7jfQmc1Eu7tG4R7GFEXS1mhsqDZLToeC7kfLkwtCpsCOp0TIVwdg7HTw
 87C38M1zr7E+f4CCW2KGxDj9ryndeyl35lrVGXHF7XVs0Sqn1HrUTuOVd1xOmTTFMqE1t5yAryJ
 wyMPVb5lsnnp2cMvVwJHFN0u5Dz3DbklL7aO5/la4h0PF4J0rAI10LSNDti2uaKZVEIV2Ls0Pim
 +kD8ZUk7dcaJGSDMioZnR5ppJN7vZqbBcfuv9UW+nn9+QpBj0IK72joXTp3xct7aCSDWgwSNy3d
 IZlB11T5xMY2epfqqYklWbcznkl1A2yZpSmSZ+gEG59D6SI80yAtGfp29ojY6zaHsJxnmBN48Tj
 uqUYYSMrb+eFVGJUUk8es4VtrkltircqpmiUBNWOwlTld3h48LHDwrp2rYZWtxy1DACmP6aqXjJ
 n1+WN5DEi0gG78oXst52nrqRIurTGhyi71PAjrqBF1O5TtkeWsQcj1JiPuLadMsxdc0EBnN4jDk
 lFeK2wSCWfjX2yDz4DN4YUEyDzUk0HYIH4PbQdRMaFe278ZY3bewETX2Y4sj/MSY1MUszrqjdkr
 m+IaD7n6qT/SbJ6hYC1dzT/1yJl+SINAD6+ki773RifZVIwiRnSpomB+l1eeNhp0/49PNAX4N8O
 TsrpoHTvfuWVGFA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

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
index 55c8dd032fc325c63727f21dc4d38b8e08ce0ca0..f41e7382a5e66ed15ce4e977691c8b4bdf18d255 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
 	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
+	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D1_VIO),
+	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D1_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),

-- 
2.47.1


