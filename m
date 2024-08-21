Return-Path: <linux-renesas-soc+bounces-7973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A4959838
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6CD61C20A2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769BC1DEF22;
	Wed, 21 Aug 2024 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnUD8tNG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E871DE629;
	Wed, 21 Aug 2024 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230619; cv=none; b=g7bPNNxbc8BgflNMNLJZ5qDA+B12ihX5tyZuxJVYTLkFy+QT8EYvCeHqaN6pb5syvfg7QUoceDNKOB2v5r2UmvE9XBAVFP7v7vXbI8kLXWbU4wd9Q0DC2VSbusthKY35fgQN4wBRGrPRxi2xg9ArUPBxqEdo19c02mWk+UTyBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230619; c=relaxed/simple;
	bh=zBz1Ca2OfdZ/atEQRoE3X+gNVRKY7/ETNVfG6V53oGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gj2mChCO2rc5RvYstu4ZdNBo4j9OT19t+HvGdztIdin9RbYKJO1iZhO5UQiIbeC/g1ZSoC8yJ/4l+Rw6e0Kpp4WCsDwWz8F4qHc/qx8GHzHoWIIE/DH/TKTBLLTP3C8T72GccSIeVv1mOH9q4kq2IQ7NJDf0D6DU4pphI0NOeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnUD8tNG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so747603966b.3;
        Wed, 21 Aug 2024 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230616; x=1724835416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8z6tym+hPH4qLzjE6Dm1s7CNpjT7x1McUWMk4+h9Ts=;
        b=WnUD8tNGQfrZv85Gks12aacphpmFl/WcHUu/tf4eMICLLzmdnwMn/6vbVf9pisHMtI
         j+XdJ9JFAVGeQipHANy2uWoDiFxLTX8xyxomPA9K45ZXapNwe+G53eVoe1GXNHVzmQYp
         gDyj/82cBqsL/tRFkZmkxIYLdL0qaYIwP0IC7N47XkXYuXpofxwdYQRUAgtlHRa+lV+3
         wP/RFuNV1Ee3vm0sq+uEzVW0C+XCS1slK9deQeG+yj03hMp6QQouk1tqqef86LEu5DKp
         g5674yuITNkWjH03uwQF4pnA+X0UUf1hR0op6rgJC5KEFB7AbE2zSxngJ5XzJWa0keTL
         iTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230616; x=1724835416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8z6tym+hPH4qLzjE6Dm1s7CNpjT7x1McUWMk4+h9Ts=;
        b=sR+IJVHUbDGr+lBX1tb4vJbBc1Nj7IbjK2i8+0enGO5LTrllVgQwCrax8dPm2beZqg
         2frNQSuKZbdpvF9hYdL94OflaHp+ocIVk8nLJxCixvjXvf1tOXGbAwzvk5Rtyp6TD257
         Wk65B2TGynWwVEaaFTfc8l3GG0NARCI/tiMKqWrPkfKi1ls1yEtBvQ6epoRkPbreNoHs
         1jXVCFWUo0aLRFAmZ/4Sl4v3WrzUr/605/z3qWX3RxfC9T50R3fTlPwEB6tqhYZrMn49
         I3OxYVdxpxJ2rjERj6zit6K/7FNm45XyuW1vnhHblQAV9+5695+MfZAa4fHAk6ipG9Ux
         H4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUp3eoOKIjzXznf2qShSoT/g/JeaiP3OGAMrYEiL2K1l8CyjKAe/fxMt7r6unpSzFnx50opTOhW7ItM@vger.kernel.org, AJvYcCWmKu2fyAmR7KfquXNGRbJuzGyhUFXUBBqV/q9SyB9W0kJakVrG3T8DV/0ihyU6fUIpqbygbLP1LJG05vBu@vger.kernel.org
X-Gm-Message-State: AOJu0YxucSolRneTiLcV9Fg3irfenqDkUeq9ywj7AsxTLnJpDxfqsQ4y
	t9cG9u2Bw/EiLRk9Qb+GhbCohSMXLdiymVSdXblbipGrLyVsHugae2Xkwq36
X-Google-Smtp-Source: AGHT+IFtqueWOpbllIEYf/BWsUie44Hmo2Els+1jIWfAwIW9kWpabkTb6MvVgRt9nDiqqJxTJuW3qA==
X-Received: by 2002:a17:907:1b29:b0:a86:74fd:f4bc with SMTP id a640c23a62f3a-a8674fdf56emr107310266b.44.1724230615888;
        Wed, 21 Aug 2024 01:56:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:55 -0700 (PDT)
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
Subject: [PATCH v3 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
Date: Wed, 21 Aug 2024 09:56:42 +0100
Message-Id: <20240821085644.240009-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Grouped WDT nodes

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 9103335ac583..fb911780c4b4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -201,6 +201,50 @@ ostm3: timer@14001000 {
 			status = "disabled";
 		};
 
+		wdt0: watchdog@11c00400 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x11c00400 0 0x400>;
+			clocks = <&cpg CPG_MOD 75>,
+				 <&cpg CPG_MOD 76>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 117>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@13000000 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x13000000 0 0x400>;
+			clocks = <&cpg CPG_MOD 79>,
+				 <&cpg CPG_MOD 80>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 119>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@13000400 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x13000400 0 0x400>;
+			clocks = <&cpg CPG_MOD 81>,
+				 <&cpg CPG_MOD 82>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 120>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@14400000 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x14400000 0 0x400>;
+			clocks = <&cpg CPG_MOD 77>,
+				 <&cpg CPG_MOD 78>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 118>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c8: i2c@11c01000 {
 			compatible = "renesas,riic-r9a09g057";
 			reg = <0 0x11c01000 0 0x400>;
-- 
2.34.1


