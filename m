Return-Path: <linux-renesas-soc+bounces-23671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D84A6C0F15C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 16:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7EB4334EFFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DC2324B35;
	Mon, 27 Oct 2025 15:47:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D06F324B17;
	Mon, 27 Oct 2025 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580057; cv=none; b=hZl3nOvrquE7fX6bd//yYnwcBriv8y8bAo75JEmRg0HNN/LowTwrfzrbnBzxLzxDy4gajVjBECtqT2LN89xuvJ+PvRdSDQMc/bdR9DKoEBWc6eX53G27IWVr04j0scJkyIflKUz06MxusbV65tzfiGNNXpBi+E6EDb1Tuc8HSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580057; c=relaxed/simple;
	bh=Py9yEuPhe7zykxvVfb42gLF305vLrlPzYhLqvGrnERQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfIX/Iw+YtEum28o46kTItMRSXvxauXgf2hP/cRptpKas54LN2xwj9XrD9BemOAIwtGIFpxsrvBi149TeavUhNJxcSFVNUZD4EDBvrYh8zzuF6gVn1h7c5DNOOTX0moyh7VH/H/cJ7xLsUHnWv2XbQaS9M6UQtwWVIxNzP2lmko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: QIkr8ltqQsG5xo9zCbI5+Q==
X-CSE-MsgGUID: bYdjS9KGTKSMsj5pnoKn1g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Oct 2025 00:47:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 02EA9400A67C;
	Tue, 28 Oct 2025 00:47:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 18/19] arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
Date: Mon, 27 Oct 2025 15:46:05 +0000
Message-ID: <20251027154615.115759-19-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMARC2 board dtsi is common for multiple SoCs. So Move aliases
to board DTS as SoC may have different IPs for a given alias.
eg: RZ/G3S does not have RSCI interface.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..12cd488f5dfa 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -36,6 +36,12 @@ / {
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
 		     "renesas,r9a09g047e57", "renesas,r9a09g047";
 
+	aliases {
+		i2c0 = &i2c0;
+		serial3 = &scif0;
+		mmc1 = &sdhi1;
+	};
+
 	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		compatible = "regulator-gpio";
 		regulator-name = "SD1_PVDD";
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 58561da3007a..a296c2c1c7ab 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -37,12 +37,6 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
-	aliases {
-		i2c0 = &i2c0;
-		serial3 = &scif0;
-		mmc1 = &sdhi1;
-	};
-
 	can_transceiver0: can-phy0 {
 		compatible = "ti,tcan1042";
 		#phy-cells = <0>;
-- 
2.43.0


