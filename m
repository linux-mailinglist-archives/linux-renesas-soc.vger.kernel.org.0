Return-Path: <linux-renesas-soc+bounces-11482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A19529F5574
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 19:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137DF18851A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 17:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECDD1F9EAA;
	Tue, 17 Dec 2024 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W2tGqo9R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056ED1F9A83;
	Tue, 17 Dec 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458038; cv=none; b=bX8Ykg68Kx1laLWt/6sy1BGD+cneLBI4BKykIVleLUcRoGPOoA8bd4YGyqx4CBI197Ti94ryj3IjjuGZikYEW3cw3DQGriSaHPAF2hWkeGuQip3/+YPogsiKEpFuRTFhsGKho3MxHX7+i/OcORuiwm6cp3bLdotGZDNeo1i5gAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458038; c=relaxed/simple;
	bh=47uARPAw80tvF1+ZK0PdCRdSA/b9LAZJvEH1qEnCqdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D22f7/dxd7U8o7+iVW4Lvt2Qh7OYZZnbOzg670xFwferU7haYtv2+wS125Y/HFLey3F4yBFhXt9Z24YVk3DuHeW3X6SnIgb0wcrKq5Cagch6Ebc5vl5lKYRXNQlFnlVm7qgiy4pEspnTxeIb5jhkb4MkLy1RdF9DBxD9es4TxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W2tGqo9R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA4A67E1;
	Tue, 17 Dec 2024 18:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734457996;
	bh=47uARPAw80tvF1+ZK0PdCRdSA/b9LAZJvEH1qEnCqdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W2tGqo9RzMa/Ly9BtwFGrzYB9680RJKuRsfQTBR1BBw9/6KAmqGHbmikCjtxYr7dU
	 3spj0eCSF6D0FeOORcHomXBnqnwGX2sNH6lctmyd3FKE9x24FK5CivxWHOOkcPIKW9
	 w/xY+7mmKF1Xf3cSZKJCoMsytcc4SmO3l0Nh3CRk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Dec 2024 18:53:16 +0100
Subject: [PATCH 3/4] clk: renesas: r8a779g0: Add VSPX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-v4h-vspx-v1-3-de04ea044ed4@ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
In-Reply-To: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=47uARPAw80tvF1+ZK0PdCRdSA/b9LAZJvEH1qEnCqdo=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYbquRJj6uHuzO+mUeAOsF41VGePspI5z/fcJS
 p1Pcepg4CqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2G6rgAKCRByNAaPFqFW
 PCXmEACjS9z61Pa0Rqwy3Nyo6DFYKnVLOkeoIF3nZbFeaOHguroMJ8xIK2QP630lh1p1Mu43jdc
 SgpqYV50t52iBYFicCxTy4ra8v8R9pfH8DxpmZ8nKlxfcJ25gQ/V3lgYm91Fkka4Qer4an7tozk
 +Wie6ekeksmgIRBg+I8rLER8lQtHaEdDlssxlrGTGxWrhhmavwKM7hU543DP57uOpzGx0LcxD8F
 nIQbem8iWN3IjGnNegiPdnRQmzPaJumaKLkZcSmUSWrZRsAlntPIK0AVHgTqJXJShRToxbbsBc0
 ilZSTC2y1JuI7/GHpQNt+zWgHZle7xv/x1XIp2H4IxvWI3VMBfTeRKusmBIcYl2cImcO33sAzGa
 d5I2htJ0q75Xu501X3MFbqNkWj5ZJRptWD3d6qk23WDorxYlUchmC9a6HBCFJ+LGV5bKfyDXfr+
 TsZzx3qcas/ILPIOYYi71uB99waAaNAcXrS0nwDNvsNOZbpWGj36wfgbrd70TYzNCJu1W1ZX4Fk
 higyh808aX5u3rkkek6JnoVUo32OD5y1/0vDegxOn+fD/rhwK/7okXjH749Bo03BrHsDrFwchLt
 PJ31BmIr/qcBqxywd2gqNJq6BF9k1IIJoRluW5Bt5fd4cjsGnlGZfbjSS/GNEE35ZxRIaozup8K
 GPeqj+MCoO3Jedw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the VSPX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index dc9ac2839ad9bb6c222db015de72fe8d9e7fe208..4e88096f8c4583d60debc3989fb22a51b41762a6 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
 	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
+	DEF_MOD("vspx0",	1028,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vspx1",	1029,	R8A779G0_CLK_S0D4_VIO),
 	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D4_VIO),
 	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D4_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),

-- 
2.47.1


