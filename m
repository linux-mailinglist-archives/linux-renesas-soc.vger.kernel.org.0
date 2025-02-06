Return-Path: <linux-renesas-soc+bounces-12908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F9A2AA30
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCDD67A2986
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58F01624CF;
	Thu,  6 Feb 2025 13:41:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FA41EA7C2;
	Thu,  6 Feb 2025 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849279; cv=none; b=pXqhvDFxbk5fUh8a6HDkZ77ETBgXXhWJSdTRI5Te/gV7A0RwgzeT02zRJwncwNbeInYYgmqJARNWggglu+7uc++j2xTCwEXeWPPPdE2kbUqnebQrzaBbgrW48EhfM+9QHqkvRfthjKhsijEYe39O2bWjSNQBenoexSD29HZgDiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849279; c=relaxed/simple;
	bh=8/Me2jyoOmL+lQ0+uhKz8sREYGOZnEtjhxKavj08+jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSvT8BAU7Dhr4ry+B3Ycl8rpER5FqNN80rgkc/kYTrH8jNxZHhBXkqg+dmgRu6EzBfEa3rMtOGiI7+aebHtiV/HccWu9spE4mEAuzqFtjst0KCOrPug0mJJ7ydtMirnuxt4a1PtYNpebvqqRIMyLL+h2GVik+JOO6/Itwlid8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vCsnvaXzS1ivGy5h6lR0yw==
X-CSE-MsgGUID: GDi92Ep9TmK7VOUObc6HpQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2025 22:41:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C23814019C60;
	Thu,  6 Feb 2025 22:41:08 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 5/8] arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal regulator
Date: Thu,  6 Feb 2025 13:40:29 +0000
Message-ID: <20250206134047.67866-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for enabling SDHI internal regulator, by overriding the
status on the board DTS, when needed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 * Updated commit description
 * Renamed internal regulator labels vqmmc_sdhi{0..2}->sdhi{0..2}_vqmmc.
 * Dropped renaming the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpio.
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index f7a2f8ca864f..bdaab9ae10b8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -602,6 +602,13 @@ sdhi0: mmc@15c00000  {
 			resets = <&cpg 0xa7>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			sdhi0_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
 		};
 
 		sdhi1: mmc@15c10000 {
@@ -615,6 +622,13 @@ sdhi1: mmc@15c10000 {
 			resets = <&cpg 0xa8>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
 		};
 
 		sdhi2: mmc@15c20000 {
@@ -628,6 +642,13 @@ sdhi2: mmc@15c20000 {
 			resets = <&cpg 0xa9>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.43.0


