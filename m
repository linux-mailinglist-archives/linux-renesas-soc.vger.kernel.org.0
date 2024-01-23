Return-Path: <linux-renesas-soc+bounces-1701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B1F838E58
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34DD9288B88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 12:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4F65DF29;
	Tue, 23 Jan 2024 12:17:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417BA5DF2A;
	Tue, 23 Jan 2024 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706012269; cv=none; b=RZ2/SeoVPfjuqeILBkkF43UU+YN4eMDNkKkgO78x23UgDU6Bk6Xi9vRpEkglkpUwrhhNIY0Zzcglx30SWIlKl/UxGJMxgBPajgBrx/AxgjZLpRTYsWnui6BB6VDSKIS+wPgiFQZ9zHoUxRyZT7v5BfO1ISU3JrMx1HJp19Ti3Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706012269; c=relaxed/simple;
	bh=G5GqXKp+9TFNgdi48M4ndap69XgMBU2hLN9VGBKdv0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNOrEDp7EiyQCT5icO6K5v0Pj9h/ARSPXj5GFamTxZiRJ034i9aO8M+vvNINAVswVdhvXle+8VHu1nHAY14VEgZOF0QquAOSMmFDqKYPOR9ZbzQ/PvtavSVfnoJNIS304IyRhUqf9wHMEYj6tkkl6/93orqWf4aC0KspjsbozSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="191434807"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2024 21:17:45 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C583E420E34F;
	Tue, 23 Jan 2024 21:17:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Date: Tue, 23 Jan 2024 12:17:20 +0000
Message-Id: <20240123121720.294753-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce i2c freq from 400->100 kHz on RZ/G2UL SMARC EVK as the captured
image is not proper with the sensor configuration over I2C.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
index b41bb4b31a26..bb769c0f3ca5 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
@@ -19,3 +19,7 @@ &ov5645 {
 	enable-gpios = <&pinctrl RZG2L_GPIO(4, 4) GPIO_ACTIVE_HIGH>;
 	reset-gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
 };
+
+&i2c0 {
+	clock-frequency = <100000>;
+};
-- 
2.25.1


