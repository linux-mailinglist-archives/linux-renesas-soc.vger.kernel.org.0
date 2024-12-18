Return-Path: <linux-renesas-soc+bounces-11520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B979F60EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88013167750
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0741990C5;
	Wed, 18 Dec 2024 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fl2G+Eoo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF15A1925A2;
	Wed, 18 Dec 2024 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512761; cv=none; b=RfdsnF601Tyy6tK1oXboZQ6/KusWGacCjUNVWkY6FvpLqFtk5qOdndavAndPY/dviUYUxvK5nIOwlS8kXlzdxorvACyPob355OqtpUUcH/7ZIYMUvR3Y5nP9+6BL9gN1KCr62suITRDJ/L0RYS3Nh/rVVLOqVEWzQ1CAd+2rEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512761; c=relaxed/simple;
	bh=X7dD+47RW/5fw+4S4JDkRtTjSiwVV7DJ9NYZ/ZcaJUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+jFhBJyZtMS/xFaNrSm2lC6P7oraPSWw8SpICOmrolaNlA9tNFCkmEO1tVQdx6/xTUt8j6reTFb/RaDdhDDc8aSqygPZWviz/4QCsrlc8LUa211c3J3j/BQq5V8URTtqH9UjhAlqObCmQSGfJkPCgjM5qxxXDZ3PWyeYpdIBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fl2G+Eoo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E16DC34D;
	Wed, 18 Dec 2024 10:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734512720;
	bh=X7dD+47RW/5fw+4S4JDkRtTjSiwVV7DJ9NYZ/ZcaJUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fl2G+EooRYoPcITlQVxcUCEHzJXcMuDS9PF2kbpUrrf142z6dEh8XCPVHJjA+S/a4
	 tTPj4fONWOHqGvMyola5XydA9ujmwiD+wrizDIPcEt3dpAT1yz1tpDX+4bbTjoLkFF
	 YdskTh8/BnPow7RMXX3tkh4OLbFGOW3PazX8ifR0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 18 Dec 2024 10:05:34 +0100
Subject: [PATCH v2 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-rcar-v4h-vspx-v2-1-c673647d96e1@ideasonboard.com>
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=X7dD+47RW/5fw+4S4JDkRtTjSiwVV7DJ9NYZ/ZcaJUs=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYpB0lxtCe3lPVpUyUhv9VG7JhjD4FNmnPDEEr
 2wOMr6Q8DCJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2KQdAAKCRByNAaPFqFW
 POdwD/9wYAv4NJmYu3yqpT/mXXIAvzv3ysNB9iQmByisyemK4oPU8cUIvOfduGQcpHH9151De9F
 g+Ep1Lr6SmBoir8qNG2Ht+5w/+Dp844YqeoIwAPJcy4Y13zcl9YzI4OjyXmhfTwyCAJjYaTj39A
 mK9Unod4Yc0o7V4EoIl2Q/jiPxl07ZDJqojR18KaEkX4jJrZs/HId3FitlIcK3M4GHcp3uP0b6C
 v4BTsp5+tuYMDCIgo9B2h/Qx1q7285+eBKE7yOg4WtmONHnGmd/DwBxDSlHiVRYqFJcZbc1Uv8Z
 yHZrqBIwvJGrxexnU8TobKyu0qof7Z6yvdXc1RNUz4phDGSVe4NN4g8UHPwM0DeU6qO0wPKjIii
 VundKHoZH0M78a2BCJm7OO+onIXexOtDYTFwUdfbTOnLB/th39fwR8Z2JGCqoSGAZ/BmYqveDX3
 TFpqHl1ueWpZdClWaiWPLHzGu4zBPx8B2GfIyWZmVAoQEukmL7Kz7qd+ZQZmJvrmXaqkeNJeiIm
 OnBz0d9GKF27kEiya9OjTs7yFwaFrKAnfvw4SxxB/9cESLLUmlFr5fBD3IIUeYbEk44UlspVxi8
 /CaCZi5CVwpyNZMQ8nOj0KGZxykiqN657drW2/MerJm41OPZuOCx59WHcj1qXYMDQtdsVBT06e2
 d+xAlQH7oG2OCnA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 55c8dd032fc325c63727f21dc4d38b8e08ce0ca0..dc9ac2839ad9bb6c222db015de72fe8d9e7fe208 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
 	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
+	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D4_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),

-- 
2.47.1


