Return-Path: <linux-renesas-soc+bounces-16980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD69AB39A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2F951896528
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EACB1DBB03;
	Mon, 12 May 2025 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVcbS+6a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD7219E4;
	Mon, 12 May 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057713; cv=none; b=R7nPNwtjpL8y/jk2QxUc5m1A6BcREiYeSaEZVD52iJtMV9h8OTFY6oOO6inAYslB2D5ywLWJWPN0017V10xujZcaRg11679u6+wGmA0zJg00m9GQPd3gOLtImP0pmJGvc5b/RWMnU3NAtFC4rcP4sbpAIGOzv2rLdCowoCtBjE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057713; c=relaxed/simple;
	bh=ZtcN5AbkC6JRxscSzpTZ6yhbH1um53//UF1LbMyQjx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5wA7IQiXy9J6+dNfYOU1qlTFVVGVC3Oj/JN/6k4VJWTt9AWilsrhVfAExdxCNXGBqlM5jtQ+tMJy77P6f/o0oH1fT1EkJJFyz8KNN+4hNOClT3/obUx0sfaiVbeu9Hfm/QxCUplprqARnfzousgSGKGBSsGv71TDovNWNXfyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVcbS+6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA2BC4CEEF;
	Mon, 12 May 2025 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747057711;
	bh=ZtcN5AbkC6JRxscSzpTZ6yhbH1um53//UF1LbMyQjx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVcbS+6a89aPGN7YF1tPHEst6vPTmCaJEw3geIxrbuxAZY7qMMT6GEQHe2sm98oCn
	 CmAdmkp5b5Y6ykcZrLjp6rKhEXOofLIuIs+L1HBAK9n5qmvok9JYtK4uucb3luySvX
	 xenRAyO7edwT+3OD6NOxtRm1iyhdvKeUsBGr2NAgqOEGE5CNROG+5FpxA1L/E9xc4M
	 hjUy5cP4/jXoVcCFcoYKSZnI6y3E9SpGJ0Zz5S5X2AuTbQ8CQ7pVtzsTMyg0H4dXc/
	 c/YM3/oV4skQ38V57vibpr2kW3XX/6trfXQAEBdPQGrNhKu1fXSvZ8Elv5Y0dOjM76
	 OhM+/+O1Kiw7g==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
Date: Mon, 12 May 2025 14:48:15 +0100
Message-ID: <20250512-sphere-plenty-8ce4cd772745@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512-daily-saga-36a3a017dd42@spud>
References: <20250512-daily-saga-36a3a017dd42@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ybCPqZEqw4uWvO05OQd8ua1QcdWR7/7pRvsx7RcK7bg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmKf2QnyJscNLaJb6tofyZ/7prgnseHPl9o4bW49FpbY Tn72WrpjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkWBDDX5FTBssymqYJrnuS 997tyvr+/fHndz+JcrBd4LfqYsKPLA6GfzorrtV+q2jR4S5c5nZoPueNJxoan99dPskQufvrvkn 2l1kB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

When the binding was originally written, it was assumed that all
ax45mp-caches had the same properties etc. This has turned out to be
incorrect, as the QiLai SoC has a different number of cache-sets.

Add a specific compatible for the RZ/Five for property enforcement and
in case there turns out to be additional differences between these
implementations of the cache controller.

Acked-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index e0ddf8f602c79..a8bcb26f42700 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
 	};
 
 	l2cache: cache-controller@13400000 {
-		compatible = "andestech,ax45mp-cache", "cache";
+		compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+			     "cache";
 		reg = <0x0 0x13400000 0x0 0x100000>;
 		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
 		cache-size = <0x40000>;
-- 
2.45.2


