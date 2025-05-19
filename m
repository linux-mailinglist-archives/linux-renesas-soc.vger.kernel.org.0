Return-Path: <linux-renesas-soc+bounces-17230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E61F7ABCA7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 23:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDD517A668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 21:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AF521CA0A;
	Mon, 19 May 2025 21:57:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8FC7261D;
	Mon, 19 May 2025 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691877; cv=none; b=qtWv3KUY/rQidc855tiu39HkundutCb9EnHZ2x6lHAENX/OmkmBM87VVtiIj9KKwFWKLb5zdn1PppOtV1+ccaFQ4vQuwev7VDSvqTdnxZUPPotAvs4Ao7fY7U5+dqTjzq1LLMHtazywivtunImUZEHT0WJpiQGjjFFEdIqGWB3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691877; c=relaxed/simple;
	bh=m8CE8N6oI6NWsKZgknOESLQI7ov+Ct4tvmLF6uGAfnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox56kU7zwInNcGnFLQ0iobSL+rat7Rst/3XHsKdMS142l1PYE43bF7Qau7ar46keMh0Jyb+y1BlX04PIw2T0c8P03g8Th4XbRqeeFe6BrnfIt2QksU6LzxuKfTixYoIbi0oXOmituLRcaUxwqcEFAv3ots/3oOiU1p85ADcAsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: /RHSf5wyRsGfIuIJHdKDyA==
X-CSE-MsgGUID: MBN+ssKiTwOndwOBU6Qf5Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 May 2025 06:57:54 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.3])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E654D40B3E54;
	Tue, 20 May 2025 06:57:51 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: Add pinctrl for renesas RZ/T2H SoC
Date: Mon, 19 May 2025 23:57:33 +0200
Message-ID: <20250519215734.577053-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl node for r9a09g077

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 48b889da9095..5648071660ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -101,6 +101,15 @@ cpg: clock-controller@80280000 {
 			#power-domain-cells = <0>;
 		};
 
+		pinctrl: pinctrl@812c0000 {
+			compatible = "renesas,pfc-r9a09g077";
+			reg = <0 0x802c0000 0 0x2000>,
+			      <0 0x812c0000 0 0x2000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 287>;
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.43.0


