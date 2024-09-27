Return-Path: <linux-renesas-soc+bounces-9108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F189881E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 11:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2503B1C22A71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 09:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F2F1BAEDF;
	Fri, 27 Sep 2024 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NGG73H//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E4A1A0BE6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430873; cv=none; b=OCIdBOY9bNVak+DCsWaWq7Vcoxa/nj7BAJ7bsS1zZW6PlUfr4RQEwGa5RA1jv4oV/WeXc6rjI3ZLVa0Z4cdpYRPj6dM5G1oCJtid+k8AJp9RfAN2L0evVmBD+lxJLCjYEyy3H1D7nfP5lNbDH/fwKWxuoy15cpTXJz9SzhKzC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430873; c=relaxed/simple;
	bh=qOsW+M6WHLwEWoa6diEYfAatcAA+dgoNzIhki6A/92s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpzQrTNIswLBhL2q6CsXQCbv4tvUoZ8P1H4abDdxF3dDnTSrGogTUobokzZFRgG3DY0lONdpZKFzY1UrbNN0A3NdRkEO3DRk04UN5tmMgjPIlRgrZ0dIbIASzNVDWc15BS0UkopZMVSGVc++SWR/oUHaRfYmlJiudLfReNseEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NGG73H//; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=YKXRR8EDDlFMZpF/VZY3ivYWqMV5EWd27mMJ5f033Ig=; b=NGG73H
	//Q3OQC/EgW9bvF1LHhs7HKMCUrW4qiNLdTCkxHIgXtxyu1wRBir2siMxF6iDdrd
	lPHQC595QWLrjxzA38y4ElWiA2YPhX723oi6rnm3ChmfIkViBgC+sDFKqr24lbq9
	k/RbzAo3AiRPWHNGX8T+VyuNCbotem6s8nqRUi4FWmxs0rj/Lj8o9HKzUc5bZDxA
	zmmt3rWN1tRX9mCCdmxD577v24o84YUnv0n6kRgo5GB9IUZ4EzBOqBc3QYlOxjXI
	tuzW/Drc0SD8O175d+GXO1mWr4UIcBTweNoM656O8zFrY/hXpZOTguFs/x05iULh
	p6GwZjScgXd8AyOw==
Received: (qmail 1283420 invoked from network); 27 Sep 2024 11:54:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 11:54:27 +0200
X-UD-Smtp-Session: l3s3148p1@V/st1xYjQnttKPLv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: renesas: marzen: use interrupts-extended for gpio-keys
Date: Fri, 27 Sep 2024 11:54:15 +0200
Message-ID: <20240927095414.10241-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the inherited interrupt-parent is discouraged. Use
interrupts-extended to fully describe the interrupt.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
index 9b13e8d1538b..b1715bf04d84 100644
--- a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
@@ -58,17 +58,15 @@ keypad-0 {
 		pinctrl-0 = <&keypad0_pins>;
 		pinctrl-names = "default";
 
-		interrupt-parent = <&gpio0>;
-
 		key-1 {
-			interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
+			interrupts-extended = <&gpio0 17 IRQ_TYPE_EDGE_FALLING>;
 			linux,code = <KEY_1>;
 			label = "SW1-1";
 			wakeup-source;
 			debounce-interval = <20>;
 		};
 		key-2 {
-			interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+			interrupts-extended = <&gpio0 18 IRQ_TYPE_EDGE_FALLING>;
 			linux,code = <KEY_2>;
 			label = "SW1-2";
 			wakeup-source;
-- 
2.45.2


