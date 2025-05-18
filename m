Return-Path: <linux-renesas-soc+bounces-17181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35527ABB213
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 00:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEE391896142
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 May 2025 22:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0F3207A0C;
	Sun, 18 May 2025 22:08:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E519205E16;
	Sun, 18 May 2025 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606114; cv=none; b=tVwja7zpDnc9jpcUKs3i5iYbxHwdj88U2aUHY3j6uehnDORED3j03I0amT948hFeBz4wy+qESxSumLTWlupOARrfOddRv8OjWSxFBjn0e4B0YRdFYxGHCVm1QbzgDaOSGs3k349W5mTmT1CeGsVHO2AzFsmcTjI/8WR+K+Fm4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606114; c=relaxed/simple;
	bh=yzBlRd1OlDFlk125y6ektn+xRypy74jKbtR29XA3BkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R38VGZ0H/DLu0ipxQXR0Wg5xV+/CGruuECJzNjS6K/R44Vz/F050foKbdzFoSRv7D/WuDDzksXsv/KJGinf2+/6A3hH9thpI491x2UL83djY2rvYboraJWiRs+3Xez8uqbFFL3PBBPlXcl2RrfX5sKQu91T4iOjg2qwiImQRd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 9xbhkz/DRDGOpoUUqVURnQ==
X-CSE-MsgGUID: yL/NLA/wTHKJWWJapptS3Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2025 07:08:25 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.57])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E17ED40B55CF;
	Mon, 19 May 2025 07:08:21 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2 clock frequency
Date: Mon, 19 May 2025 00:08:12 +0200
Message-ID: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lower the I2C2 bus clock frequency on the RZ/G3E SMARC SoM from 1MHz to 400KHz
to improve compatibility with a wider range of I2C peripherals. The previous
1MHz setting was too aggressive for some devices on the bus, which experienced
timing issues at such a frequency.

Fixes: f7a98e256ee3 ("arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 43d79158d81a..ecea29a76b14 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -85,7 +85,7 @@ &gpu {
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
-	clock-frequency = <1000000>;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	raa215300: pmic@12 {
-- 
2.43.0


