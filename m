Return-Path: <linux-renesas-soc+bounces-26831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD3D239F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 10:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B940930EFFB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 09:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE42535CBD3;
	Thu, 15 Jan 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="USgq+H6b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3F38BF83;
	Thu, 15 Jan 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469161; cv=none; b=X3OPwTuj+BAKrlHg9A9eUTvbv2DoqgO1GebiBDJg09KR0LVtgQlhJifZ8YH2zWUs7dqlc1fZROb7jrs58O42Xp8eHABKnyPjWBDcGdBqwZrdHG9wUD/9PhQfoQ+odCmcMw/qtlUrOEzSt89opl6ENaKxbKDqVKqj4WvIAVfR2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469161; c=relaxed/simple;
	bh=zLPC+2TkJTFt27w//gRxbESvPdPXo4SLYhYRO+IRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pB2B4vpZ5H7bRPiFUQhpanUCx2u92Fcw8OASKyH3zj4B/af737q+PrrXtLp9wQHks5aIH/JUFdYTcUuGGJ9eAQJzs5c1tJbqWxeQ+b/Qpgd7HLXo5LFxy6BsjYYm/VSAaCt8UOQiXyOe/HkMmJYrBNVfhiyeXTIaAYy0jSYPlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=USgq+H6b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31A4C4E420F8;
	Thu, 15 Jan 2026 09:25:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07307606B6;
	Thu, 15 Jan 2026 09:25:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AA7710B684F6;
	Thu, 15 Jan 2026 10:25:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768469158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cFZyearDwfGg052H4Xsc1MdeOqI5t0yhI+26mZIpcUc=;
	b=USgq+H6bezJJvaGnpRvxviSTVz7f0zqozBk0BVIrNOYq5sAq/9RNSTKsiPsfDDC4IcTbgC
	WrvC92Bxp6ROFwuCMTVQUeSa7fHf/Nzl5vIED28SDFhN3uOkjTBV/+BBE15DMtZb+2Xx9T
	IAo0Q6Ml/pA506sAJy+XKM8AktQCKvN7UIceiPYUc/34a4zTcURxmn+ymVPQ9b62lHnVxq
	HhoZ0YaWakopuh9Nn6wp6weRe6tnqz1FeJBKeLh5y3zxde6zZxfvr+awivdlnlzNXhqD7o
	thY0AewXXuR58ijMjmO2gDN2PrM40O8zCWW1Fu5DpaWIox4QKfqwF+SWAdK0gQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 15 Jan 2026 10:25:04 +0100
Subject: [PATCH v2 13/13] ARM: dts: r9a06g032: Describe the QSPI controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-schneider-6-19-rc1-qspi-v2-13-7e6a06e1e17b@bootlin.com>
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
In-Reply-To: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add a node describing the QSPI controller.
There are 2 clocks feeding this controller:
- one for the reference clock
- one that feeds both the ahb and the apb interfaces
As the binding expect either the ref clock, or all three (ref, ahb and
apb) clocks, it makes sense to provide the same clock twice.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 8debb77803bb..802db8d74178 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -66,6 +66,20 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		qspi0: spi@40005000 {
+			compatible = "renesas,r9a06g032-qspi", "renesas,rzn1-qspi", "cdns,qspi-nor";
+			reg = <0x40005000 0x1000>, <0x10000000 0x10000000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_QSPI0>, <&sysctrl R9A06G032_HCLK_QSPI0>,
+				 <&sysctrl R9A06G032_HCLK_QSPI0>;
+			clock-names = "ref", "ahb", "apb";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0>;
+			status = "disabled";
+		};
+
 		rtc0: rtc@40006000 {
 			compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
 			reg = <0x40006000 0x1000>;

-- 
2.51.1


