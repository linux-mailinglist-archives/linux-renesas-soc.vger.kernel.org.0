Return-Path: <linux-renesas-soc+bounces-11521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153419F60F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A42A169158
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2411199EBB;
	Wed, 18 Dec 2024 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GERVyiSX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAFF199254;
	Wed, 18 Dec 2024 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512767; cv=none; b=iCNp8sIO/ka+xCfMvjfQxpQRGnOOSlkjPnIp8cYUY+kd+jEAPG8nyjWZecwD09X1ISdvSAchdOdWLc6WePx5lU5gy0ZmsnKBfRSaROqh0PiUXTy40kpP54gbxA6A/hKYRgwyg5hLIECEN2mfvBc6I5uYWfRKUQ3vDYEU2XdwgvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512767; c=relaxed/simple;
	bh=aOPB+FrGhFD17xP8GQSDhN5TK2aj72WoS4Yxi/mW2A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEuhnADtFxVit8trtZdIh5wd0UIzznq+CKRDZNgi1Gaf0l307ObOMU4snpuCjN2OntlL1/7qDZy7rysIW5Rhh8f3kWO1kU/KQbvsm0cYp2SE+f6YPX3ZC2hSB0SwebBogSPrmteOvyB+hrgC1tCx03Zn2Yhn+asETukeNkaycNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GERVyiSX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93408D04;
	Wed, 18 Dec 2024 10:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734512722;
	bh=aOPB+FrGhFD17xP8GQSDhN5TK2aj72WoS4Yxi/mW2A8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GERVyiSXfWnK/hVi3c4dCLvv+59S8U/ExblMI6CSO+8oKpzuBtvzV/kQ8s2cANGk4
	 KuaC+VVjR6k6sOadGb5AirZRPKHmToxYwwn0PkDa2PWe+MOhOGZKk4XtYEa9h0oVIW
	 /nPOUDs1fDkjLdlnEJzOAjnvs8eO0hnH26TBig2k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 18 Dec 2024 10:05:36 +0100
Subject: [PATCH v2 3/4] clk: renesas: r8a779g0: Add VSPX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-rcar-v4h-vspx-v2-3-c673647d96e1@ideasonboard.com>
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
 bh=aOPB+FrGhFD17xP8GQSDhN5TK2aj72WoS4Yxi/mW2A8=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYpB00r3wIIpGot5NQ81uWKpekwb8yMKFXdiXL
 B3QmLF0U/6JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2KQdAAKCRByNAaPFqFW
 PP2YEAC4MQcgKPBIcj8XaKmQXMSWdMm18wF2rEyttQvHCaV8QAUQClY2BYisX4ZhxiIdxpP/E4p
 Am8d2xQYCZtHYiQ58pW5b2DGg+ipLXJXgAFPJMJisjDzx3Vd99p334s2lqVK3lkESaX1Oj73LnI
 fRiaAHDGfQxvd/WNp96mZX0SHS4+7CzCWgH3XUK7plJoPqFVnrvTm8Z9PcXLmRomQHHOlkGhM5R
 gZdkTRzWhL0xF7phWOgDAffICBzZS3Nkc52N3OelK88tXqPHslJF/GW6pScZx5fePqjwVIC3IPq
 XwcNhsTbiVxIIyAT+wkBTjuZOeD9IpOsP88K8sW7d6A8vx9Ljceo3mwWIFMBhE1vVErU4wbwTwO
 7QFOhta9LuBO0R9vdsSr2IhWjslNZYoXzlpyRF6GeEwB9zwchMSriZmh5WGQyq6vNsUrDQfwWdR
 YuP1DBv8NOZGWLLNf90xW4n5NUs0mC100R4HRPGaOlvg7o1Z9eACYcI9pRHYqw3t7Kx1Ylgda3y
 kbSewBuyJVEMZfhnO8Q+R2mwT6Mw6H8CjI2Ezfc7Kd1UlqoSJZC/kVOfjdPUrCNu9kYXNWS7U2H
 mIiOT2286QNy6fnNtSFiiHMLeCazzLpcTNczD2a4D9DiRbl1Pojm+pmRAaQyqSTXqehHrN+SNEG
 CLjYVDhVmXQVQVg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the VSPX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


