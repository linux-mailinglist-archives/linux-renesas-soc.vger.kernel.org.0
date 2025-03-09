Return-Path: <linux-renesas-soc+bounces-14182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E244AA58750
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 19:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AA76188D5D4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 18:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8101DF256;
	Sun,  9 Mar 2025 18:43:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41E70814;
	Sun,  9 Mar 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741545816; cv=none; b=RBYCTSrAbPWigGB8lJqW83BwnDfk5l0COvXbVoYOwyXSA0KytjleHqqRiEL8GOWuuzV1OUv5niWGBWiIFQCs1rz0hqjwHV22ss8Vqkf9JGmzjkHOzVV+NqLeXCErCzz7TCYHZrCMQbnB6I2Bb1tm6SBmOhfIkyt/wP34viz61/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741545816; c=relaxed/simple;
	bh=JvkWL+ifRgQfsyz7MX4EgKZvK3d87ck/H9PLXWbmWVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDllfIh173argM/pMfUOAQIa+qZDZ1aau0yV2fNvQn4X034DapwUzdrcWo6MI4mEY3dvJzmY9gmor94ABnrtCZ7nWPb1dlpT+DvhweTkIIhjcEuIzqBoLKqTZq1hWfCxFebzlkTajXG3/NEphBrBNN4dUy/2FG6xlhx/RQgb8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VXJINvacTNeLN94WsHJc6Q==
X-CSE-MsgGUID: ByyE96w5TpyzS6Tp83m1BQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2025 03:43:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CD490406049A;
	Mon, 10 Mar 2025 03:43:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a
Date: Sun,  9 Mar 2025 18:43:24 +0000
Message-ID: <20250309184326.75452-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove undocumented compatible micron,mt25qu512a.

This fixes the dtbs warning: failed to match any schema with compatible:
['micron,mt25qu512a', 'jedec,spi-nor']

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi  | 2 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 21cf198b3c17..d511e152d7c6 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -327,7 +327,7 @@ &sbc {
 	status = "okay";
 
 	flash@0 {
-		compatible = "micron,mt25qu512a", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 9aa729fbdce0..3e8909a872e3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -246,7 +246,7 @@ &sbc {
 	status = "okay";
 
 	flash@0 {
-		compatible = "micron,mt25qu512a", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
-- 
2.43.0


