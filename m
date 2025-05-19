Return-Path: <linux-renesas-soc+bounces-17191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBDABBD70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 211A27A24CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA4327780E;
	Mon, 19 May 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CO4I0v3S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011DC1DFFD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656928; cv=none; b=RBxWK5UR8a0Uhpqof9X14mhJRaM+GUt55n/K+1BWJ8//TiHKYTzb6Q9nEEvJkuF9YoL20OPbc6SnPmr6FsCpueehJpfbG4ZX4MSvG8bmgqC5QRjq7+G+l8iAh8JT21z7fnbH0EuSyNLfivo8XMukTXNkFbheYCecGZymSExRZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656928; c=relaxed/simple;
	bh=64jeP0Gi1PI0BAdjU0SxMLQSz6AyN8tWg2xGk+X2TyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaxVzYnvSYHy+V0JHOCar1+fMM4IoVPScLpQRfMz8XRf5RV/s0YDMXjNes8Kqk3ZItQb1uhbI5YlzbyzLVEVibwvSIc6w26ZBOb+xuD4h3ip6SkiBvdeXGwa2Q8hbDcKLsXx0Vn3WdVKRDtHDgYVeJxS+v6LPbTYHwtLRROQHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CO4I0v3S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jHiB1M85VGtsR/nshHD2x3rEN5vUZAWnBNyMS8ssk/k=; b=CO4I0v
	3Sr1NVhsYy+ZtuERwgeF4Uph04r7ihtSHRLsVuSv+HXHx2bwRuaaAQF03otTtChe
	4U3/0orXT7LsGE22NfVvuqyarmeMUFpFzH6+jpjhsgi34b71cocn7Z6UnNWh97Uu
	omEvoIq5nS3Kmd0jwMEuL810b1WcVOWQCCPtOKH93KdWCXMaBuBr77kie5Ud+dnb
	OgyiU5ij+leX+pLnMt9JAm9b+1hstq5n+ZtxZ1r9PbFyLhMZk11uYgE1JVS5/VD6
	oEK5wTTxJT+FsO+dgr8/stE/pu5I9Y14fWurTH5sOKbOaFl57VYzG5GWX9SPUnlx
	trybxFdbkZgNN60A==
Received: (qmail 2475066 invoked from network); 19 May 2025 14:15:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:22 +0200
X-UD-Smtp-Session: l3s3148p1@qBMJFnw1DppZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:01 +0200
Message-ID: <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 8f02de8480b6..197de398dd9b 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -85,7 +85,7 @@ homepage-key {
 		};
 	};
 
-	i2c_max98504: i2c-gpio-0 {
+	i2c_max98504: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 1 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpd0 0 GPIO_ACTIVE_HIGH>;
-- 
2.47.2


