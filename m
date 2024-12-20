Return-Path: <linux-renesas-soc+bounces-11615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB129F8EBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507081896D4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CEA1BD9E1;
	Fri, 20 Dec 2024 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qp+wP+aI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867F1BC07B;
	Fri, 20 Dec 2024 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686111; cv=none; b=fxcdYSQL0BlDmEXsR1In2YdWQPDjwNdoyhiZXdxAZTa8zvGAwF+ZyHunfLk9IUpp4SzL/caNIozQ2xBVbS0xO9oEi8wYX2JPkql18XQb7UfTNV4QByO7XbbRM/PyFMe1LZu4DQUpoW8E+CH0fFB6mS0/a4uNdZ5JqcryAyqtRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686111; c=relaxed/simple;
	bh=2Sq5Imq2PS/4RH09JhccRSoFKlP0plH/izdITySqBIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdDZ5c+jerq83LQ/YoslPAozljCIM0CGKjD21yuhvBYgh3RarvI1w/mlqzmU5fRa7cS09pqVCAjle5xnNyyaIGLNYU89ErvAwPwMZhtij9EufqAzy7gB+vqmxxl1fcaM9OBFr+TUhB92CzwFRdXDFtUUs9JRcZY62zvDPnmERww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qp+wP+aI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B172CFEF;
	Fri, 20 Dec 2024 10:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734686066;
	bh=2Sq5Imq2PS/4RH09JhccRSoFKlP0plH/izdITySqBIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qp+wP+aIHrt043CggaZLsdXa6UknTl2bxF5mlH4kJ2n2NujMAueMdwRRT5jwMpcAc
	 Kbm2CeNIzSiaT1+7uNUCh8/OLpLmNK35+FF1ULXf1Xd2cKE6k426qfsF6gWyT63GDY
	 FohlkHTMzcD58isZx4ZFADlXyZy/h2gOZA149O6Q=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 20 Dec 2024 10:14:40 +0100
Subject: [PATCH v4 3/4] clk: renesas: r8a779g0: Add VSPX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-rcar-v4h-vspx-v4-3-7dc1812585ad@ideasonboard.com>
References: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
In-Reply-To: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=2Sq5Imq2PS/4RH09JhccRSoFKlP0plH/izdITySqBIQ=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZTWVmH9G4itnEzjPhq6t5KRVYWvCoHXg64d3Q
 WpLV9oqTKiJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2U1lQAKCRByNAaPFqFW
 PPu4D/kBfULaNycgErAe8jKgnYNfsspokrTWSGjv9YmRK+2pswPCvWnaM45PFWpxbf9PdvLRgCJ
 BskCPCn/5KJKA2bs09a1Lc1LdS28OCOkIyG+ndA0NTfO74DA7riDXPnKsisbiqpBq8soyTiqL8n
 0GxNjRX4mKg1uZx8TlrpGFQPeevLdzhwe+h/NgltM5Ga5gLy5HprFZo9+hdG14kOw0AvjTmIhSp
 bmFNB0GwoJi8wLqT2veixe423HgMAqznUOUUEKtQL2wgmiaf89ylZtqNbla7thFvGNn0JbcAV2P
 5xl/Tu0GsDClJ7i1CbZOYLsiMc90JmOq88/XaWViSFxaCaEdknWyFbae4iEHom5dpKIneUnUwaU
 XhYD8gtVYgBMgrsP9fJQoEurj68ysfCHjxWDH3rE+G1bHmyyVDctjLzKDjF4Ehc1GbG0q5zfBaj
 kG7ZNIBYSKwY6KU2gpF7TffcLi1yjsD+bI3OYYnWb4iDP28FuZkvZ0bysGvhFMXEHl8BWD641vz
 h/AZooMioT1BqIORaypub++QF02MCiNjiphIf/QGgXRltDQefPwFYve5Q63C2YIxpMZZNpHGDyR
 /WWxY2DRHyUhbQfC9AOyg+eFB7REG9q9paNvuZ9kCVMVBAF2JdXziEPHo/HEPNU0HYBwDudzYrY
 w3D6+750vl3Hhew==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the VSPX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
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


