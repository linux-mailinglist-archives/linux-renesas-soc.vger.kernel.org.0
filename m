Return-Path: <linux-renesas-soc+bounces-25889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35848CCC7C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4294830414E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA22354ADB;
	Thu, 18 Dec 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c/3mw5kd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933D352FA1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071319; cv=pass; b=I7bhRHaDOuSwphPwcBLmZ5PHsj+NAchSzdg0RVpTkcXWzrHQK2Bu5Bg+03FeTiC3p7CSsznhiCZmn1m75O8NYudIqW4XO9mJ5K9r415kl+KQ2W+srUudqG8l43ENSXvfy8IReBKCxaDMYghdRQjB5UvP/yX6aHVabrrYdeL7esE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071319; c=relaxed/simple;
	bh=6cFJMMBpfqYHtmXLgEpDrCdBFuoUEsV5n0RZlhvD924=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bB2SuqqYhfSe1PVFu/Ub/tv4oq9II/zwAeZzAJqlQ+phy2suSZmbNDwjna/d6Jcixv9ho1+c9Sdow+lmMs/cNCTXuzCdlsEELowlM20FHbLmQRrcZCSBUwxlEiUQetXXj+2SmPpDU6xVNk9+gQ6d2NJVa6JvQ2V2Ga7osuNPA+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c/3mw5kd; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=718S0BdFz8xiVCzU8aXFCL2DNXNEbKnbIjEDDeQ51yA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071291;
 b=PIgzZa0OeJrXecTNiFcZ1AuHo/obzZ4xCLWPeFYUHurcGk3f2BViCz1XH1C7BYSPuDoOivgd
 ZuZE7uV7o5ubdv6HTjEylYx2EpFqCd1PLBcVfWTzr+gIJCGVbw2veuaLOgHGsWeBbCXHoEWWbrT
 89XxqB+OymKptDfOa9KtJ1b+SWF1/GiohjzAEcTp48qZdfgRSke5zEmpwH+dPSTHLJV5tNVquIe
 O44CYplWZ977C9NcE+MREWSEbq1gCYwpaN7Xt2LDPjOQNPNbhs7wdF4TEJrzTLMyZtFMxVM0/tZ
 SBs42UHi4ySbpRO1n6tPVMqDMa7hSMBfrhOIquI1UBOeQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071291;
 b=subA83OFsDpW4nZHH8Bw/b0TCPRTRsgpD6IkrTDxMg49PmYzK5u1xp0gz0waGi4IeJbq2J/b
 zKcO+BcF7rKOIEIP/ILM8cprUALF57s96fW1rttDr4d5as814vlTUm11h9+j3oYkrH1PRzbgbG+
 Vsrr6eswb2oAwm6GX0P9J5gnWpXM5m/el58uMR/dB/mY2SqjWRznjibzRhUAFGXb499D4zvAXTA
 8uQdWtFKNBpZvLHNKlCZXZP83zd7o7fyevPm/WbjG1AsoEXBCK+QSEwYQSLyGpVtrXknsY2MhDt
 k/h83KUfAsDjjPOhPnsKHFGQaXGAYzBDeViRKHAW36fOA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:31 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DC1C2CC0D53;
	Thu, 18 Dec 2025 16:21:08 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 3/6] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Thu, 18 Dec 2025 16:20:50 +0100
Message-ID: <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDs20KQZz3yY5w
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:af1e11a75574753d5df662a88887dfc6
X-cloud-security:scantime:1.983
DKIM-Signature: a=rsa-sha256;
 bh=718S0BdFz8xiVCzU8aXFCL2DNXNEbKnbIjEDDeQ51yA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071291; v=1;
 b=c/3mw5kdmqjAilg3Kp/niXy0f+jBsLXi/uJuWIsRxiloOSCGRItBpUNVL8Al+aYBXNWo1QZz
 ufB4O0muWTyTBrqnwShNTJ0Y4KYshE6QweZMd95ergbFDhSDcnQC/zkcO9L0V7bx8NlwdTWDAo8
 xMDSavHMLSaTCGvipo99ILuAOuGGDGfpDwWdugQrxSe0XCeo7vpzr7QAHAGQWgjVi+n3sswseur
 FkuOaY9SnJA60jo1rCXGU4CI89X+jqjJKimfwZ6xd8GO2gmE2gpJUXGKlhD1vOvGoppZY9k/U+A
 vHnvqq7sCJnkp+yxrUnVyrSupineWjovhl569Mwr6gZZA==

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0


