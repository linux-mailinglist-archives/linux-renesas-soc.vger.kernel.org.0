Return-Path: <linux-renesas-soc+bounces-9041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E149985615
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 11:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BEB51C20EA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DE1156661;
	Wed, 25 Sep 2024 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z5gZxPcM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B6136E01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255313; cv=none; b=WOcCtXMs0dW8oW7O8QI3ew1kNF7i0lHFW/gjcM9XR7NTmyj7sCS3Tcj1hJ4iwCNetbiOS4c/sfrSLcH7oZ3yW/qQYe5cA4AVobw1r6snDGoo2OfvF1cAZ7gENUZDIyLkn3f+EkhokN6fTtRr+1NzKq3zNYCM6BHuyMsrobCsQmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255313; c=relaxed/simple;
	bh=O2iU5YFb0EUoLa8iUqnhSQW9C4V3j/ZF5B2SycMLVck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARZNJt+v2w/k8Swj1jwVx51SVTVLCl8gRYjUYVc+B3gINdHqcWyV+1crwgSXIxhQiLAflIbGQMF2Hdk7Dd6BjVYHzqjPntp4UR6lV3tNiRNWUuYFIlC1rEafNk6vnSBZBzk6U5vv8jLD/eLsj/+gHQCInyq9kNmVGmiA3iwSuKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z5gZxPcM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=JAyhatAU00Ze3X
	pmj/bpHbUQtyzAHNpP/b/yg3oQHxo=; b=Z5gZxPcMQ8lHCfDNDRa3ARETHifabp
	x4Lvqn+f70fM5N/ntOunMk72JYNKWbTMXHZ7EIl4HdJ2/qiuAgY4INpnyc6ZWcIu
	ydaB+jZ8rWkdtWRJSlfPuvp6ldz0inGLlWHBrb2wUy9DoPNMUuQ82oR9sKiwbQyc
	xpCDm8ji3Ya4O9vNvF5K8f1UQI3hHZ6qYEHDLNHn2Bu+oU7eH8UezbQkAOpQzati
	f3DO4kW8TEuukFGWp68AM7BLY1J45W4GIQpIp7IWzpIGwUWuMYwoTPkElZbKR0c8
	rLp9qhTUHWkzBQhJYDz7swix09on59kQlZZBnipqr00eedF90tycc8uQ==
Received: (qmail 554663 invoked from network); 25 Sep 2024 11:08:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2024 11:08:29 +0200
X-UD-Smtp-Session: l3s3148p1@CQAb9+0i0hhtKPDh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: genmai: update audio codec bindings
Date: Wed, 25 Sep 2024 11:08:13 +0200
Message-ID: <20240925090812.14497-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Meanwhile, bindings for the audio codec exist. Add dai-cells property
and limit max frequency accordingly:

  codec@0: '#sound-dai-cells' is a required property
  codec@0: spi-max-frequency: 5000000 is greater than the maximum of 526000

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 2f14522d5b50..2d72daa4fac2 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -248,9 +248,10 @@ &spi4 {
 	status = "okay";
 
 	codec: codec@0 {
+		#sound-dai-cells = <0>;
 		compatible = "wlf,wm8978";
 		reg = <0>;
-		spi-max-frequency = <5000000>;
+		spi-max-frequency = <500000>;
 	};
 };
 
-- 
2.45.2


