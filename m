Return-Path: <linux-renesas-soc+bounces-12427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D4A1A886
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0836016CD54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B5F21638B;
	Thu, 23 Jan 2025 17:06:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0232163B5;
	Thu, 23 Jan 2025 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651973; cv=none; b=Iw/KKJWtb8pxDPwOpQXa8WJeff5mrLug5zvapEoueN2A9WmADTt3QRjo0IsFntJpP0vC41NcBYCYq+98l5E97w+MMfzcasw8lrPfw2+xnloZig/ceaDW3569gF60EZ4aMtXeU+fWEKxOl5DNh8SIEvMBYxiiDYEmKulwAxEfa4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651973; c=relaxed/simple;
	bh=1vV9hasKijC1IwoQEyRb4E7rXvExdPKGHPuPBcEjnvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpqrWvZXFQ+XxSujccK758lDD+FHNI2HuLH+xr0WeRhk7B4TRfa8jGdenPJ79GMOcjM5FL/vObi/Anhx7DE/uFm607jBsxxpiBhtdpA8OkQfm1LXVx3YYtohtIjMUJ6Ys9azUffjFrTVy25VJ1ADDre+8550pOoAVXrqy1yk8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: emxCmzfOSs6q56RrFgL/hA==
X-CSE-MsgGUID: vslF06UzRHSOwcFb84gFSA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jan 2025 02:06:10 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4B929402AA46;
	Fri, 24 Jan 2025 02:05:56 +0900 (JST)
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
Subject: [PATCH v4 8/9] arm64: dts: renesas: r9a09g047: Add sys node
Date: Thu, 23 Jan 2025 18:05:07 +0100
Message-ID: <20250123170508.13578-9-john.madieu.xa@bp.renesas.com>
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

Add system controller node to RZ/G3E (R9A09G047) SoC DTSI, as it is also
required for SoC identification

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
Changes:

v1 -> v2: No changes
v2 -> v3: No changes
v3 -> v4: No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 444fadaf7254..0840450dda47 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -162,6 +162,13 @@ cpg: clock-controller@10420000 {
 			#power-domain-cells = <0>;
 		};
 
+		sys: system-controller@10430000 {
+			compatible = "renesas,r9a09g047-sys";
+			reg = <0 0x10430000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
+			resets = <&cpg 0x30>;
+		};
+
 		ostm0: timer@11800000 {
 			compatible = "renesas,r9a09g047-ostm", "renesas,ostm";
 			reg = <0x0 0x11800000 0x0 0x1000>;
-- 
2.25.1


