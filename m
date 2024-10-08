Return-Path: <linux-renesas-soc+bounces-9603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D07F09954DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 18:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F961F222F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 16:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5BB1E0DAB;
	Tue,  8 Oct 2024 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FABUU35l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED71DED6B;
	Tue,  8 Oct 2024 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406186; cv=none; b=Bg1OybOfWKlUKsaSQ56fzw9d1yRCBw2EhsfiY4lIOS2mpPVpHNX5bTo/yaxpcKN0Yo/DSGNlFg+xeJvzoL7rj/RhYshboAfSl+ZeD8/aWg8pqxmlStqIGaEErrTDNqj8JYp5owSEkctfpyc8g5OU/A0kmFh+LwuEJcKi+CMD0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406186; c=relaxed/simple;
	bh=SdYsBBlzVtPWxLQQOeoLNGvXi8mxinz03kJGmXthS7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmLDFuLxHuqr12q/WKLdFBCecW1XRcLegHiHox0bNnvB1FQGtWfkp7rM9WeuC0T3OWfOt85pUG2ekFYyOsgezyNmtOcrHbs5sGzjH6BOhLIHpPL/jDuifpIC2yir4baJ+8w8CM5utAulOKAQ27a9pPvs8ljaDgxi8IIrozbMG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FABUU35l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso78892145e9.2;
        Tue, 08 Oct 2024 09:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406183; x=1729010983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkzcMsDPInhdOquOwf9plSEFkolG1PbmZhDJwMq+MCQ=;
        b=FABUU35lBtIhRpYqlwFudnMKqR4JK4zk0gFDE4t2PH+TcL7KOnwB1bPI4y3gV08ppe
         lRzxVorzjuVW44KRwNx7j5KxEAbfzPyq/5dQ+jdyZ4Gnc5xOVZjFh5a7dcqPhTarGRI/
         Xnr0096vMjaXP39gGmBfDxWy0Gl/8fSpxXbYIlnscHcEinHVoo6t25yPip2emOw3j0Ci
         RuWLQrO9MXTBom3lsqCWnr3tbimEKuDO/q7csado27+wNrOYUk26hJgWi7Vq5IyX2MHC
         7ELp3AZD3grumSdHn+EcEyjOcN3ICqcKlQ+Ao6llfx8xdeq+5t5Bci2u9kcyCq+IvnBO
         zJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406183; x=1729010983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkzcMsDPInhdOquOwf9plSEFkolG1PbmZhDJwMq+MCQ=;
        b=IgxJ2Wwwgz2tJleujB7mfhQr3VPepmwQ/xs6/FKkqe4tcUWnYu82MIT7tNv1/QhLiI
         8OqvJgtUeYioDIlR+znrcfIV6XH77jXA16H2I4MyO7gEethpPEXUaoeAcgIgQ1s74jv0
         gc8VdkR81dnI3TbV3tFuJoVUVG0IT5rI3O7z5FJuxkp2Gj98qF+UzkMz3o9ahTOdlHbJ
         fsYE/VLBSmFJryvSqZwvL19ARmo2wDZ37usWvqSJ7StmFeuLWH2O+UGN7hDZkQUEqCsO
         GnwJRjNNi3uNw25Y5if16NDNWbY4sWQdSIBpwhyw2rRjbKdEo3R1xx/r3euKS0ddCGF0
         ephg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Gxz0SX9XRihX4aJqWxEvNVsuSvF9Cxt5vDkrJKnls948ZZ6sXcjNFMg+6wvyj+oPnJauEN79dMpwlB4=@vger.kernel.org, AJvYcCU7nc0FzDpbhjoW4gfWMTK5lBmCGISbq+iGY8pNlrUVWIJEDMdfC/x2d0Feekfshw/y82IiXGs3Y2BA6SK3XOaQBVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4rryMrhL/zZ6keinUUCxUIzi3GkuxJoXPumt2/rfTesX8tZA+
	LMzyUehG9zTdR6U+XGIsjXPAL54S1PEnXBy6PDTBxPAMWZTeNSYg
X-Google-Smtp-Source: AGHT+IFTyZrH3dHY8mvvuNjcBojY+diOX2awf9w9x/hrWOQZiA1FMBLE46Vj4RJpyBLwove4w3qJqw==
X-Received: by 2002:a05:600c:4f13:b0:42c:b995:20db with SMTP id 5b1f17b1804b1-42f85a6e12cmr183436855e9.5.1728406182360;
        Tue, 08 Oct 2024 09:49:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a061:f1f8:b40:acac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b44374sm131985415e9.30.2024.10.08.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:49:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Date: Tue,  8 Oct 2024 17:49:35 +0100
Message-ID: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add OPP table for RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Set opp-microvolt to 800000 for frequencies below 1.1GHz
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1ad5a1b6917f..4bbe75b81f54 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
 		clock-frequency = <0>;
 	};
 
+	/*
+	 * The default cluster table is based on the assumption that the PLLCA55 clock
+	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set to
+	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additionally can be
+	 * clocked to 1.8GHz as well). The table below should be overridden in the board
+	 * DTS based on the PLLCA55 clock frequency.
+	 */
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-425000000 {
+			opp-hz = /bits/ 64 <425000000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-212500000 {
+			opp-hz = /bits/ 64 <212500000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -30,6 +63,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@100 {
@@ -38,6 +73,8 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK1>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@200 {
@@ -46,6 +83,8 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK2>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@300 {
@@ -54,6 +93,8 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK3>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		L3_CA55: cache-controller-0 {
-- 
2.43.0


