Return-Path: <linux-renesas-soc+bounces-10990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69B9E6A50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566F116A463
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F28A1FC0ED;
	Fri,  6 Dec 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s3kuonRx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DAA1FAC4B;
	Fri,  6 Dec 2024 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477622; cv=none; b=km+FvQmycS54cNV+T/IdkWKnbyf1G+p7h9VT1R2VbETgADU2Dd3lpqm1UWQF2ygb0VeonRKAqaVGdCk3xk/XPYTWjVjvA9m3INJDRg2nKosNFAduryIfLqkGtnFlKRgiAt+3pFmbbc1SDPNjyLauAQp6vf8siZwiqpUd0yBAaI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477622; c=relaxed/simple;
	bh=Hq6JiYTrr48Zz5qgtO2NNBKqBW0EU5tjSo3HW2upEnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJuTEcqWgd/zsFR1VJWV2PZFMygI+2V+Axav2OY+Or67iBUsk3pU4O5xBzvl9CnUgVgmFHLfvTnknCyOqsMBMvcC/+f9bthR0ux3nCJZh+wkUWMpwU4PZcOpOdpk0RC+IGcHFeW+aZbk2iAfZJ6FG3f7umSDdJIPA/UHmMeSEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s3kuonRx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9264186E;
	Fri,  6 Dec 2024 10:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733477578;
	bh=Hq6JiYTrr48Zz5qgtO2NNBKqBW0EU5tjSo3HW2upEnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s3kuonRxfNfXZ1T/JAnE8trLMDt0yM4F6f7/K0rltyQmKHJiie5wBYYh0H7AoaIr0
	 VlJl2pvNypal0y30yHzTtd0Qce1DDLdHU0F0eqml+tY5GlXlJRl0K36Yn7T2I5sNcl
	 9U9KWejbCP1KdpMYSEm2MdL3NIISphBD8o6oObPU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:38 +0200
Subject: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=kAn1GjZQFCgzt+hyG017KrM5zbGlrdqmvn21tyGA1Go=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTabXNJzmmVCy4o7+a9ah57Wa8VAwdxOpWuU
 ftCKeqqwJGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2gAKCRD6PaqMvJYe
 9a7vD/9q8qE+RUThgR5f8Hqulf9XSpGhn4L440u0wqpbj9zAsUonnFmfHK3jGfHce4l5PuYCxyC
 Je4Sg/6KbaUaSIYAyExhIBc2kPRRu8QKOcRUzpwf5782qPFwMB0VszSgmr5yd1FsHxe1OzDrUyu
 02lXSKS3ODaOXCtLgB0rQ3IegHq9Q+UEBYEk3V7UE4ydElRYOokUFlf8qLh20nrCGjbfazGberF
 UUkg51TZZyUmWb5k5aN7Pm0PjHP8zFTv7PaECvdCW+3/fjz1E3KAQOVYCnmmq2+Pwlpv+QBb9lv
 o87jzVgrDDUp5Fia+T2EM88Dsq+xMtSna/2PyFeFd8+Y/Y8HnKnpDR4zDhKoWwdB572MYMwpPB0
 4WvBEc9nMLYM3r+v1YvNWc2/VxicLIAceVZBDDva29RPGP0TYw/HocpTP9f3MTk0WOS/8D4ejSm
 +zHstHTO2SAlr0sXyP1VcvL56whSWQSGilfln6AECYx5ef0kY3trdfTspvHNYPHbvvNf4Tx7p/M
 SdCRHfEsldkrUXIW9wA1YqKpP7wRigD15aK/WNrRXWCbABCNnao0ZmXaqsOixu7pu6E/8KGgH7g
 aEtM/rnhrsSthv2SMnyCL3MFWPbNJptG1eRj1Qnhq3NqZ9dn7K4N2S0RFFL5pI+aZNtHU/TIsWF
 KcEcu+4PvsQpsXQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add display related clocks for DU, DSI, FCPVD, and VSPD.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index e20c048bfa9b..dc37e987c0e6 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
 	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
+	DEF_MOD("dis0",		411,	R8A779H0_CLK_S0D3),
+	DEF_MOD("dsitxlink0",	415,	R8A779H0_CLK_DSIREF),
+	DEF_MOD("fcpvd0",	508,	R8A779H0_CLK_S0D3),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
@@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("vin15",	811,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("vin16",	812,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("vin17",	813,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vspd0",	830,	R8A779H0_CLK_S0D1_VIO),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("cmt0",		910,	R8A779H0_CLK_R),
 	DEF_MOD("cmt1",		911,	R8A779H0_CLK_R),

-- 
2.43.0


