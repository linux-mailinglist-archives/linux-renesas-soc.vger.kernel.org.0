Return-Path: <linux-renesas-soc+bounces-18292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CC5AD8EA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09293A4224
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5642E88BC;
	Fri, 13 Jun 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNMJybEg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588102E8881;
	Fri, 13 Jun 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823006; cv=none; b=CJidw0DVaxzYBNLBm2qHoI0+HkFGIIRdJGcydTgy6SbugYfE9EkPyezT/Lvwt67VztV2d0uaFPkNphfTwov5fVvQ44TP+4/O05fioKz5L4fQKJOo/K5slcpUxFHS0GAEoJZsYe+0Lt3W5ogG7fqcq9oft/Up61xftGkyTSWP6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823006; c=relaxed/simple;
	bh=FbSG7oqEixz+Lt7JXxGPKfUSWkfOVll573DXpU2SYOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqXcnRJVFGHTIbVsDTqluRXvqI3LusuH7kla5WaE8G54e/hbZFtwV38GEgZK7/BYKQTTu78f12HHOMuryWU15EI2frSN7dLSSTN+MiEuxmpzx+n+ofCUAHA0lCKKoiEsKRgvZn18i6nLdWn0Td3MedSZQBKWQn4/rxl2Ncs1jOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNMJybEg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so25282005e9.1;
        Fri, 13 Jun 2025 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749823003; x=1750427803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDZVCBMqk2by3w5W29vq8r2Gs2ZZ6Ke4X3ZM1bUSmlM=;
        b=MNMJybEggQ+dQ2MCTCTe4cf56Ut7kq04cB9HfnMdzDrgHEigbgc2O8I54RhHxSBTk0
         JMXgJ0QwtC5RvB07hSaid2NDxZxANSUfLDCDacArs71fqGuO8FW3N3zdeFMkH1xN2Oj9
         5KpOLGqeh3dzBaOEuYHkeK9iGf0juojCo9aO2dDl8wBqIV0SHo24LsepyeZowNq9YVMi
         We3Vq5JkCbaAHihcYPxDO5PkuAIbKN4RwU3LMaTE76u43vWn1VFWdY+3ATCFIvCe6oGJ
         viy0I5t6mqDpMUNRRS4UNRZofllqZD4TkFLlicR2Ej734CFaH6ZmO1WZfPTvwkRYsHwt
         +b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823003; x=1750427803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDZVCBMqk2by3w5W29vq8r2Gs2ZZ6Ke4X3ZM1bUSmlM=;
        b=biRcDm+sGRbkzHj4n6fo0fcHCCpsR3gPtcZNGYZrRcoT6CymGHCQiXI5yVIraRUsBA
         dZ73iSRKjc0Z0Q3wMADTJ3LS75h9nhiZ4lIo4m4CM9ahrEHVEflj0WeXZLUVPJuhkHq7
         JcsMdx5ArCwOdcZwr9KK7FbhYWGRcTC/b6Eecolou96x5WG9sPcdQsfl5HgiNZ1nQJCR
         oo31V+oQj9ae47/FND71SmkGq5536k+1648Znravfb+s1cGeD9Qs/x6H+bpBNzEDOjkE
         /+7jD/inpXZ5OroE0XKRQvMEBkIo6qygWuWF+k79BOfsiHi6/8pWkeIOuV0Fb3M80hvV
         in6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwlqo8o9HUdLS0aFbRVNDl1On1VHCqaL3dLUUysCwCePjGEYEcDq63Rc0x551OvcE9HNPaRrM7wS1L@vger.kernel.org, AJvYcCXE3ZM/H8VLnIRpNtsqpUfC5SUKlPb0RS/ciBjTHk4yEymcdAQ5927z4w2xiT5ypezPAz1hCQH0E4S/WL2b@vger.kernel.org
X-Gm-Message-State: AOJu0YziRvZzkr0wlgSNQP3hZnJWvOjEblv3exRISruTUMCmN0STA0tR
	28CSAxiKvwqZQjWsM7Nor9z0IG2/o2GfmVYfr7y8/7QOlf6gohTvj7H01zveIGZ3EBk=
X-Gm-Gg: ASbGnctd91++uaIDrqdqQQy30i+k5bmz47QuLZHkeQCYX99PcLJP9YmHt0zSK7MpXWO
	/RUnjypswHdXqIZ7kMhl3b1OdsIaJq8tXNuoWMv2WUF67PiJ0ZfMpYpWeqUOaS5pkI2FH8I4FGu
	o4Vvl715A3sV+8vE1dqfZa5e3tEkhZrcJZKQfvvuTq2AmNAHwH/0R6LqpXyMSHV7oXgmrV+Lbb2
	2+kB54FpXO04liwkwaRClV89jGp2ZpbQx+igu5VdWpjf+j36Q4YZcCSFVQqXDv7Sc4CGr0T05Tv
	EBH7jNJUPIwCCpFNY6JtDEfGJW7t50Yws7d3D47mqc7iUYc2AlvbyAMsHWl2aRSeWAjak4RVUYB
	IMZu4QAFU7A==
X-Google-Smtp-Source: AGHT+IEfPeYDkrNCoR4s7sbKcac+o5tWKlMy9gin1B3YMssvw6p+gwF3iY1/9+Q+zXKCsDJ2bPfV9Q==
X-Received: by 2002:a05:600c:1d8c:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-45334ad4ea5mr30581495e9.22.1749823002525;
        Fri, 13 Jun 2025 06:56:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089a7sm2404489f8f.49.2025.06.13.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:56:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g077: Sort extal_clk node by name
Date: Fri, 13 Jun 2025 14:56:14 +0100
Message-ID: <20250613135614.154100-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the `extal_clk` node in the RZ/T2H SoC DTSI to maintain
consistent sorting by node name.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 7a79db19aac6..1508f581cb66 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -13,13 +13,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	extal_clk: extal {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by the board */
-		clock-frequency = <0>;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -64,6 +57,13 @@ cpu3: cpu@300 {
 		};
 	};
 
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
-- 
2.49.0


