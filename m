Return-Path: <linux-renesas-soc+bounces-11614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04D9F8EB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C61A816063D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2E81B0F0B;
	Fri, 20 Dec 2024 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bfaAK+GA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680CB1ACEC2;
	Fri, 20 Dec 2024 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686108; cv=none; b=h/WANvUH+hZd3lqu0WjrBdI7p/6LXMJ1ZNEvcWrhcD8lt0SK+5s6OI5gOW3uZdxLGC3htvPxlwsZJJHcbDEhgKItL7kMqlgQW4ZjjzKLrEl0ZKh+IqCsOfS31VJQSMUlk+ePcjG3r/IVm4ZkFtLuJdojVSTFg5VgEA45GpQNS7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686108; c=relaxed/simple;
	bh=lK5u7GoO16DfjBBchUoOHS4tH8bwdq1LmoJ2QCarCOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhPUyZIRVsLxrtJDSQdHK0QOtl69h6eLr3wz8cIKGOPoazMsS+pSy2r1Ha9l3qV+Wr17waNHZN+Gxc3IvdN6a7cWe5HoNZ1KnKr1uWsbcMX6lj1OB5eQ7Nfrdzn4kCgim7oz1ABjfpFPqnweGbdjtmuQTh2aUxMKJOQo8cyaKus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bfaAK+GA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DE15B2B;
	Fri, 20 Dec 2024 10:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734686064;
	bh=lK5u7GoO16DfjBBchUoOHS4tH8bwdq1LmoJ2QCarCOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bfaAK+GAR30Z+T1kRrnKq/gM7WgaErZ5D9AfjU+10VmSKv7kT0Mtw4Dj8G/QFT2rT
	 QC4LnSHDk7qLMxEp2TFxR20EW+EP4xRx958mUvQDqfQQaPA/WSQu4kLRoJMhh20kDF
	 2Fr+2j6d8nNbz0Za1Q9Q9/XlZz5HN5T4sq0Y63P4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 20 Dec 2024 10:14:38 +0100
Subject: [PATCH v4 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-rcar-v4h-vspx-v4-1-7dc1812585ad@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=lK5u7GoO16DfjBBchUoOHS4tH8bwdq1LmoJ2QCarCOs=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZTWVgq14vGDYnLykEx4Ht+k6Zi9tpf/w6J0I6
 neMq2l83fmJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2U1lQAKCRByNAaPFqFW
 PDlOD/9q9uXg2SXfa2SyBn/5GmeQppgZTeqDGMtXQkKstVCl/cpUKP+a/b33W526y72cm04jZDB
 chBtIVMvv1PFeSGpmBWKNrnBNeLQ0W4MDfuvXsDsZaabDaeGT/3p2m6QwcNAH7CoK/n9jff7R4U
 2mZxzxwtCJPYBjKMjjB2pvMGeB8Ccbg+OJa1AJTmzdcxvBKOxsgX6Rv7xn6NoNLto7E8xWgVTMp
 6Kd1swbqEXbaCeTzhF2gnSA/IFYICiNoomshG3fltgAVEpyFhS5FYGg0R6y4e2bvfp3RjiO5UMM
 je1BvLinAq61HZd17cmg+orzxd30156b9/1K47+oDfLnyPU6jv51lrhr+ukgoQ/XBQXY4M3qJDB
 k5LePMPQkcT5Qzr44hDbzYAgA6I+1T7S1d+5AjaqCgvXMInSrGZPa+5Yp7oh1j3Sb/wTL5aSd85
 dP7KzUQDg6Gmrf3HdY1ViTuOUf4QFBtT/IKV3JcnD9p3PXPWsh4MAjyA3MCfh8XDQF9Gg57/z0Q
 zUJYYgnB52Z6LhKgyg4jw7mydfU4eerQIoYAdZGtqbCM57cDcHpl97M8krTDWoHkDXaGH4pySay
 Ana/gcn2fx26tLfC4n2dfy6fAAbSvN/DGkRX0ZJkfVhADEXCMxML85NeFZPVQisCmb+ZYYoer15
 2P42wOCIG05ULfg==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

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


