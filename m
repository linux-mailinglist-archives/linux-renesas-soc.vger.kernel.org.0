Return-Path: <linux-renesas-soc+bounces-12332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C150A19009
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052F916C53D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2CF212D65;
	Wed, 22 Jan 2025 10:40:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D289B212B0A;
	Wed, 22 Jan 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542443; cv=none; b=mTWj46OecSqdr6IbhbQQuRunzMixEn5mzzSvgWqWwoR75KfKAY3G2EZexUPwgLKe4SkGJpH9CYUUF4mDwdGdLrjI/+7xK6S/3WTkWgHyt1pKJi9USqiLNxqv3+18W2NaWR3JuwMRndjH+oAsrsU20yUbNVuS0PpVPbav6rc/XWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542443; c=relaxed/simple;
	bh=MQwDGHpWIv+nxIj/TOsUV1tiERvsaZk9jZwhxmfNGEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nR6zlmOjGrJ6oUMr0UICJHs+UHKR2yZVtWYmM0q0A1smaGE5yt/HpDY4U6H8XRZqISQFUAjmw7z2dVc8sVlrksROYEL62NhtSgPfzcrsNMzRLZsm0VD/Oegb23r8vK24bZhiRbMRoXgF2o98FElHZ5QFKIbNnveNW4XiSTI3elk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: psi8T7OsRFOiNGXzZNuvdA==
X-CSE-MsgGUID: eCUbl7bvSuaTUvRDDQHK4A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Jan 2025 19:40:40 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.193])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C48204005B5F;
	Wed, 22 Jan 2025 19:40:35 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	robh@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Subject: [PATCH v3 9/9] arm64: dts: renesas: r9a09g057: Enable SYS node
Date: Wed, 22 Jan 2025 11:39:11 +0100
Message-ID: <20250122103911.517484-10-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
References: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SoC identification needs the system controller. Enable it.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1c550b22b164..f7a2f8ca864f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -249,7 +249,6 @@ sys: system-controller@10430000 {
 			reg = <0 0x10430000 0 0x10000>;
 			clocks = <&cpg CPG_CORE R9A09G057_SYS_0_PCLK>;
 			resets = <&cpg 0x30>;
-			status = "disabled";
 		};
 
 		ostm0: timer@11800000 {
-- 
2.25.1


