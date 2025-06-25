Return-Path: <linux-renesas-soc+bounces-18740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E947CAE8822
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5A77A726E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9891329B214;
	Wed, 25 Jun 2025 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgsAtQcj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C002877DC;
	Wed, 25 Jun 2025 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865459; cv=none; b=cSG0BBnwm4tg5RlQ28WkNHTkiGUofSc5b3wwSPl7Rn5XA9XdmSbocuNrXYqPc2af1TAdnhRVLRMtAXGi4V3g6Qe1ZqijoRSTwpopPnmFTHExXNeAgKFi2n0MgL69/Trx84sxBaCNM2R84NEJ/xDEu+ujGwoGHDOGV6u5hOPQaLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865459; c=relaxed/simple;
	bh=rizocmLER39eURyfAxVYgpiAsw0a5ifMNhECbO2R+Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaGyru54Y6WmmPQrb74lgnD8cUYcqfQmhTEpKCELDSpUSGH78OlS6FcCPdPSuPKiBahV/P+VsWyhoYT0o3wApV6Wg6zqLzfYKhoAO/HUg0l7dH0Cwo3kX12PwQLu2pJkO+d5LbyRpSeKgzIH6hUbFCWBxoKzyzBnS1ne5oLvJ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgsAtQcj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso5285816f8f.1;
        Wed, 25 Jun 2025 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865456; x=1751470256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81o61h5aCeKQKoCPs2qokl/cxL61HaFkofoNg8SCAGg=;
        b=bgsAtQcjC9f9q15nYYNRdq+8tHIy6S+aFlSswJkLO5bHqkNTmbxlXkROlKHVS6r00l
         +qYXtsPhZAbNmEcXyfOlfZCjeV6rjTpJh0q3WZtzNlv8cK1G3xRG0yPoupE/TrdltcUR
         8FJ+jEKG2etAsfWvx93tkW9uChx3zTQR1/C+Jo685VjaS9yLsxhHe1ah0lwFrDr+1B1E
         tg2zwIJGNeNc3zMonGcY7pbRTexiJBkpcPlOJ4abFtiynPLbKdZ+fN8VKI3JPjfenNau
         moIE+ZspJgUW/TNEwjoN57uSNsim4HwdZ5nT6NrKGyYfgCyAeMbP4HDpPTks8wWxqrO4
         UzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865456; x=1751470256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81o61h5aCeKQKoCPs2qokl/cxL61HaFkofoNg8SCAGg=;
        b=Fc17VqBoJCZmYx+0XHD4p3tFH1ifsc+0t87bB0PJBEUoiNyDAIm3jdtJL7MD73Gfbl
         3FtjtvgBCaLMbO1xoMlWCorHiiara1xAGELtUrXUPN3yqI5+PJcA+KV8A+eb/8bTQAF2
         xbSPHZ9q0fo/FHCNVaW5YIOUyb90mt6ytHCdYvzxI+PgQ8mBMA8DijlfOhLsejBfY7Hr
         0TNn1kkVY7wwk6EivFzJlorM4W78pkhewIET1vAn5VTiipXfUefJeDvzo/myudM5Cc/G
         o2nq38+BK55AM1kdUDWmpZBiDg8rT7ms5z5/858hJ0nBw1KiamjNw2pVOhb+YNJs8mMH
         qlog==
X-Forwarded-Encrypted: i=1; AJvYcCU+lPpcmVnuqsPMgFGkMXKUxdwFjOGXNzmaudZGqjK3nFvqurVlw5qKtLea5/iNF4UQ0hDu18TSxVa9@vger.kernel.org, AJvYcCVsJTkRldweEQQFdHEn5fj5Qv33vOfAmZEDIeagWNAZJXrc7hvYcQpmWAVoncyJ+8mo3abmV0xxNM7/O5Em@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFNooSCr3r6FfhBprVsTSUDA+JpqWXLBzwHgx3KMqCf+GKU6y
	hCoSVRlhOa8ffhTpCk1/HYKaRBXUyLDFX6yAUnWofRO/ZAX/1WvOe9cB
X-Gm-Gg: ASbGnct3XxYu6kaAli1luDAFiD7OqjwMaJwJCOl96EeNXNyZCVGWxZC7XfgW7UwVM9i
	EAindhtEo8ktu+VXICjQh/lfbrmEtpsA//iwIIwKOsSjky5MGE7VRNvjFVDD/ZG5Q8Tgo2ikfRq
	aePiJaovTzLeuILC/Hq1hSVya7HbtgjxEGTzFrJhlN9QvqhD/svoRJpTsOvziW2efsdjwYUTfAp
	RIxnZYlt7J47LuxBUBMfdukgWl/xHFfdmwS7hXFzvdai5ru4Tj2kKj84BfNPr8fkywW/hNSccVf
	WKTW04rQHygJ96nsfVWlcQtFOe2p5p0LHd0GA5/2yMGFQoqZhG4zylSwcsGozd5NX+xN/yj56Fu
	9I4CR6clhj+lOge7vHpdrR7avLrbkQ4Y=
X-Google-Smtp-Source: AGHT+IHMIWkFbO49hGA+C5/5kwwo054wHHtMELD6sZTlWGetMp+ZId6IuTCAdjG8ej7PP1XeXYFR+A==
X-Received: by 2002:a05:6000:2b04:b0:3a5:783f:5296 with SMTP id ffacd0b85a97d-3a6ed652b0bmr2399627f8f.56.1750865455981;
        Wed, 25 Jun 2025 08:30:55 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:30:53 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add I2C controller nodes
Date: Wed, 25 Jun 2025 16:30:37 +0100
Message-ID: <20250625153042.159690-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/T2H ("R9A09G077") SoC includes three I2C (RIIC) channels.
Adds the device tree nodes for all three I2C controllers to RZ/T2H
SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 42c3b86196d6..eec6fec19944 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -90,6 +90,51 @@ sci0: serial@80005000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@80088000 {
+			compatible = "renesas,riic-r9a09g077";
+			reg = <0 0x80088000 0 0x400>;
+			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 100>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@80088004 {
+			compatible = "renesas,riic-r9a09g077";
+			reg = <0 0x80088400 0 0x400>;
+			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 101>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@81008000 {
+			compatible = "renesas,riic-r9a09g077";
+			reg = <0 0x81008000 0 0x400>;
+			interrupts = <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 501>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x1000>,
-- 
2.49.0


