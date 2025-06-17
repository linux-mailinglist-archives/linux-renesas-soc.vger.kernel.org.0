Return-Path: <linux-renesas-soc+bounces-18475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C0ADDA7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 19:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D66593ADF4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1EB285078;
	Tue, 17 Jun 2025 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciM3abL0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332E23B624;
	Tue, 17 Jun 2025 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180805; cv=none; b=s3Rt5D+CcIB5n1ISL+PB3dpK49MsF472gE1rG+nuGNXI4yB/pqPa6Y8Fa9/EGd5L/HQ/BeJUBtr8rV4Q462Rb94rC4g3wFHlZaOGwFuL9+FbBJ0x16zUP6JoyEEkdduTm9mlACOg6C8LwhbK1TOMlP4+CuAQn0BUGRzCbCGYCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180805; c=relaxed/simple;
	bh=6dJhHq6EpHtVk5lK8JsuZlAL/T24xRjQFNGN0sTidq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rkrt68kMkrmFT3m65riqKlfSdfyXAuutqocTY6hApSBVe3IVg6Bc37E5YjO12SsT95RM1JUKtRX/I319/CMDN8khYG3ZxMbK1TEY3NoCgMa0KwpA2JeYV1W/dvYNPEfXriWO2AImcZFMsRqdglaY6A2QSDMAA2zSYzZXcHnN4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciM3abL0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450dd065828so49220965e9.2;
        Tue, 17 Jun 2025 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180801; x=1750785601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgAN4cQiPJHcDOFjHWm6t68g/swixiqnHMFxbtaT3jk=;
        b=ciM3abL0ZjYFmxZwGNRXZUo42iDOt8r7+n0Uc6YORTmbiJCmMkgpotcwUADSX87/iR
         3p84UGZexS5QdlmMCA3wQVtycHsuWCBmFuG1Op+JBgL1h5WQsUelth4JnNvDINTolz1Y
         DS/fYoD+RHsQ/V6RizIFGHwOM4wsz7MHetXEVdwa8IxXbnug/N0WBZBOHO7oMNAKyVYA
         qEMDHg1g/JF+QTSATZFt4F52GyVdeUcbyY2U97ZGh8UVlrqxGm960L3oH2x245VMVUFL
         yYmauSpcF/Kuy/BG42FaCh+TuOSP5PbHteO7xCG0pv+ZpB758pPgeIGXBVmG6yCQw9NI
         RlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180801; x=1750785601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgAN4cQiPJHcDOFjHWm6t68g/swixiqnHMFxbtaT3jk=;
        b=wnpg4RCc5HltSg8MJXVy/oBfF521yUpz6EZwFYObQTReE59SaQhgrkZCl5lNHMWtCs
         tYBXhCB1h+y86U3rPBI4Z0nnyYRE4hAedNIxzRvTNlaLgTqCkXpJN+TzuJfgC3HRO7hy
         +bwBNsce1DOAWDoID43nup+VpN87nFyD2qHqnb9aDuQU0OlWtd96GeHP6gf3TfOiv09g
         kd7SkkLbezo45/aWENAqfA/AAF5zditQF3pZnEnNVz9IpyCA3+sb62K5++XdfAEe9nco
         1/HXW77fB1JCsqFb3Gz1AbvUtTctDIbgEutgXqTEBaq2CcQV8UiGrUlzrItqXS9zT3sr
         GTRA==
X-Forwarded-Encrypted: i=1; AJvYcCUSS1Z6CGgrDNMzVf79uwFyosJqugYtaKj4KN6ryD79/ZlsTbDdZi+To8gw+kryFjM60gl1ChaK+kM4@vger.kernel.org, AJvYcCXmsJza4htVw/A17lXYyQm35WjGnTFmGNr+SisEZhhSMlT2Qov70xSnQwnSN79Dv3DQlXG+gY63i16FcvX3@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvvbDSUAVObX6CJClXkRI78FrIW4BCEE7PhGtcXFYsPZhMYiq
	gaa5DEUm0xiMtvEU81WTvmQtiZQeIfGznpHjPGrWJuFVMN7mDpEZxyLOGJqjwHvJK2Y=
X-Gm-Gg: ASbGnct7JOr4HQa33NlVB9TZF8UTy/gha7ES4UHG6zzURofi5TXlmd/jwMSCLtoGnVG
	ZL/R3SAlDUQu24SzPfryrXNnDOTJK6RAFe/zZo2aUYoU/WxO5n4YAoCeCe7inyoy3/RvOIbEK2O
	XH9l6jljGiR9esT7ZiHG7U/Ps4YDl23V+LAKROUNQ0dxMF0pOjBgz0mKcMQ9O2OtcHrgfA+JDKq
	gB+iU+BrOYPmh0yzRcwjatTBhTU+STWQDYlF1w9Cj5kgINOtfQDR/UBwCEyelzq9ghzc9dBKIck
	2xTA9h5idi7btKbKmXIgJYEi4WoJrGxmrSESJra1AksWCBnrksOW4/i7kfA+VA2BruXZPX5cWtv
	eVOGkxZvz8bw=
X-Google-Smtp-Source: AGHT+IGFpyVrS2d/t+L9U6x+1G/Cz9RmDCaQiuoaSFwKOnP3ua8TqXf4RUqH+v0HYynNiAYVL7Gqvw==
X-Received: by 2002:a05:600c:630f:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4533ca8b32fmr173939895e9.10.1750180801427;
        Tue, 17 Jun 2025 10:20:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm180875415e9.35.2025.06.17.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:20:00 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: renesas: Refactor RZ/T2H EVK device tree
Date: Tue, 17 Jun 2025 18:19:55 +0100
Message-ID: <20250617171957.162145-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

The RZ/T2H EVK and RZ/N2H EVK are very similar boards. As there is so
much overlap between these parts, common device tree entries are moved
to the new file rzt2h-evk-common.dtsi.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed the file to `rzt2h-n2h-evk-common.dtsi` to better reflect its
  purpose.
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 17 +------------
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 752d4c9f2cae..486584fefead 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -8,24 +8,9 @@
 /dts-v1/;
 
 #include "r9a09g077m44.dtsi"
+#include "rzt2h-n2h-evk-common.dtsi"
 
 / {
 	model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
 	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
-
-	aliases {
-		serial0 = &sci0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
-&extal_clk {
-	clock-frequency = <25000000>;
-};
-
-&sci0 {
-	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
new file mode 100644
index 000000000000..5f17996bcd6b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Common Device Tree Source for the RZ/T2H and RZ/N2H EVK boards.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/ {
+	aliases {
+		serial0 = &sci0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <25000000>;
+};
+
+&sci0 {
+	status = "okay";
+};
-- 
2.49.0


