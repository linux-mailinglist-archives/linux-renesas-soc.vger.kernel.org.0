Return-Path: <linux-renesas-soc+bounces-12428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76314A1A888
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60170163302
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865E514B06E;
	Thu, 23 Jan 2025 17:06:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B267914AD0E;
	Thu, 23 Jan 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651982; cv=none; b=HuEUvLMdOB5rxUqtjJ0Gicb7WmSUbzdJnTDjRPE506ucKfLpdOdykVmzBya48qi+jxUdTMikb8ln2BVaWLpI6usrSvO1K1DFIxZi2J1TJAvXnNjXdHD9GN9PpB7g4OyRGLjhotyr+FICf35xUzAVnEo4GKLZJQp469sT/0BFB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651982; c=relaxed/simple;
	bh=0j8bVwm+2q9wyAwtn8WlN6DpuyVkXskNnrtKVIv4osg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbd/g7CTUhxAfS8DiAhi11c2o1mCL3tN4zRAm+KdtgXih2eGuPQZPR5gUVzK53pQWCPQphtHKzodt6vHcELZMLDY6WHL9PFv1TK3RCopke9Nhx0IhyXByKseVaLKKbyFe5gdcI6vplwHOBMBq6pEV+M3MQRHRqK5IU4vhZBWTsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: PT51ALj3T7OuBRykxBK5QQ==
X-CSE-MsgGUID: v8nGE/zlTxGEDCgHLp8bpQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jan 2025 02:06:19 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1808F402C333;
	Fri, 24 Jan 2025 02:06:01 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com
Subject: [PATCH v4 9/9] arm64: dts: renesas: r9a09g057: Enable SYS node
Date: Thu, 23 Jan 2025 18:05:08 +0100
Message-ID: <20250123170508.13578-10-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
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
Changes:

v3 -> v4: No changes
v3: New patch

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


