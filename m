Return-Path: <linux-renesas-soc+bounces-12673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E831DA20C64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C1B3A12B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94274F9F8;
	Tue, 28 Jan 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EsBDeLi/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA7E1AA7BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076184; cv=none; b=EcODIh7Kem6NZbiPNGFs6x9B1QPvbz09jH7/gI1nvYtXyUQGNvYWEzNbf55zqVjRBZ3E1JN2JhmZlCqAfVXEKsRCEWIIKaKd61rpwyRIyI6Og5CODrDquql/mBN2rF4i2tK9Be3UT9clqyCx0s9PdNIrmSYH1tN2essXgwXnK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076184; c=relaxed/simple;
	bh=21SeOvY6ByRxcSIZlyqX+loE2MHZLG32rVl6AvrXtEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZTDhQlYEBsJM3F02WqeM+JjDibAgL5sZiuwdjUx7peEEqCDBSnaNDUu4UgSkSmP6gWFaaWu4TB2dDkV6rp4FNdRqCmmLoaYCQgIeYr5OzWNXtYyW8Yy37Iy20kRyPlunFVbK4vyk8GZ/yvLePv+9xWvASGsLcp3wRs9z2iwA7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EsBDeLi/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385df53e559so4180082f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738076180; x=1738680980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z9cpUaPuDjruyZksgeQTZRAe8TrBK168phW1N9vCcE=;
        b=EsBDeLi/DblKPXHCd05B5FAY6IPTWeB/L6nNE9PYJJWoBFFjGOG9NbYQ9t+3QD3xYR
         9QDd/G/xcLrv7yustgHb31KbbzEKYIlX7y6VUeXpLt/fGjx4eIrfXLxfM3Vmq1Ic+ovZ
         JcPE0UAs7G5ItXMDQ2u2SZMMwmhYswEEuiMYArWZKXIYrYNljwDkffnSi2SRq3ddC/sh
         YPf65iQ+EU8jWVWIywlR+1mR1zv8+64R6xGt3UCPtsBelYuZtgqiN5u0rVsusdi3wro/
         wOZimZJWt26xFOTiTx/s+ForcBx8EB4sOJZOVSoG0e3rEGq2oziflwQo7ZdPPQPS5juE
         cCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738076180; x=1738680980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Z9cpUaPuDjruyZksgeQTZRAe8TrBK168phW1N9vCcE=;
        b=EHx3MflekWPfRiaWFtZGuChvof7vfPar7HfVbuxKu2vb/9FpTLyA+7lU9igwFGV8Qy
         oodi/eWkjgyiqPfDSnD8+5xd+9kgQcToO4WVq1qg0XYgpBtQiEiWq+J1g0NnrrrgvkxC
         6kHkktQVfBcFI/cp8PHKebD2vYXvug0fBhmEwOEGhzAeY6fTVE6bocC++KE/C/ZXK3Vu
         zJcj6VVVmEsxzKut5kSr8tihsuqJEGu2AlxEoLEEJ6ZuvEp058Wy7796bE3+H8LHUV8i
         hBDOh63euuCyAlzaINYYi60OlV37IuJgDv6ouD8LvNFX7B5UwX3zqJqY9Hd37UI3RdNQ
         wq+g==
X-Gm-Message-State: AOJu0Yx28ALPhkx17M4FmZeBT5f8qcQfgOXYh5Y23m7qSDC21sgrK5Rw
	04SMM9Y/3MM1fNxJcPQwZGnNpF2JOPVFRRF4JcZWH0TSRRo1fiB6GwVqMCND3HY=
X-Gm-Gg: ASbGnctdXV8ywjKsT8PgBcFeR6BOP7eXcBE69t1//AVMXxRv4hTAN1uRP9LiACMLyiy
	FUtBm/iokxqOYdG4atQ+ceFpBvAv9CPod3Tf5NF5DW3iT765MqqZs1O47YQto3OjI74iKPSrIAz
	6ZZQpmpsbsm+ByUKZglnxSDjRZKjl+f4g/U32GhZWjxo8dwpxF8aKvRGyiyIcoYW/zUbhkwhEzo
	7UhlsPLGmj5Vy4RehuAtmw6b4uBNp6opyh33iKmuRs5Hy8fnVKZ4QgdP0Ptn5r89kTO1nkGxSjy
	tR2M+kV5s3y4aaGJB0wVn2zm0EhmfK2A8KKAIuNPCZLJ
X-Google-Smtp-Source: AGHT+IFYMJChOkt/kFCW+/q8vsYKRCAw6Yd1NDX9sbpzO9pAWrOvoTf8g8sQJF9vogfk3sA3X96PWA==
X-Received: by 2002:a05:6000:2c5:b0:37d:4647:154e with SMTP id ffacd0b85a97d-38bf5655bd3mr37377205f8f.9.1738076179649;
        Tue, 28 Jan 2025 06:56:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f0fdsm175317175e9.5.2025.01.28.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 06:56:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a08g045: Add OPP table
Date: Tue, 28 Jan 2025 16:56:16 +0200
Message-ID: <20250128145616.2691841-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add OPP table for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

This depends on https://lore.kernel.org/all/20250115142059.1833063-1-claudiu.beznea.uj@bp.renesas.com

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index a9b98db9ef95..50cdad52ca75 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -28,6 +28,33 @@ audio_clk2: audio2-clk {
 		clock-frequency = <0>;
 	};
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-137500000 {
+			opp-hz = /bits/ 64 <137500000>;
+			opp-microvolt = <940000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-275000000 {
+			opp-hz = /bits/ 64 <275000000>;
+			opp-microvolt = <940000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			opp-microvolt = <940000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <940000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -40,6 +67,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G045_CLK_I>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		L3_CA55: cache-controller-0 {
-- 
2.43.0


