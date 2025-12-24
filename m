Return-Path: <linux-renesas-soc+bounces-26110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F2CDCF95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B53D304E179
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2653532938E;
	Wed, 24 Dec 2025 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2II4aUA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60B329398
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598743; cv=none; b=tWMDyDS5p7nRU3sz6qxUGezwiunkBoWU6dVEraUmt4GXKeOKwSBwLi1QcKE4uj6QdRhkswbI5LVfrWMulDMpjI52NbkLdDeQrUY131U3sigkfp87oNFjFEtDsfvvHiL4zVei43Qn24FwUwkfk4WmD3Q2C/I8I3mCiZZqzuG7kbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598743; c=relaxed/simple;
	bh=8Uoqcgrwf5qL0Yfgq3crvcywtGYwLf0Ku71TonoXroA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZX8rjzVC+KI4juDX+Lq8b/glXjExb9/cGPRjtGnJJzmo+J8VVekxNYl1Epj4yNhowNDXz3gc8dwiMhJTLHZbpD6vwDTWZu6GNPd+8qwodC86+5YHM6GkSDbLMfw49gjx7ilx7yRZkxNyQaOLx58rmZREr9VKb5VJY4Sotk2Jrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2II4aUA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477563e28a3so38498775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766598739; x=1767203539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8GNYWY73TI1Xhvsf5HSI9OWAeta0wWUObecrUir2UY=;
        b=T2II4aUAyoNjCBmAAy6ZX07OGsIRaZZet+/kL1xt1jjQdp9VMJJirZCeiLWpnEPbf8
         hQfcyUHm/TgFF8K/t1+Hs7RPLPLnSQ9P34OgRLFlMVh/OHbX/n5xO1cjJQ5dfRe7teGJ
         H/KS7cC/Rt2evXdgKUdcgPDmCyM/2HsylUOr3zGKiMoi058Kr6paf9s88Aovtmh7kI8A
         ckDcoaxs5PLk1D1xdypeVZ8rD9pVUy31lCEEBCAW1ZxGgNL9/oHQB+71xjum6RJIMM14
         VcgdmKzb2LrxvE3T2Sk37FxVUYPatjmfLf4ZRUuL3nucoz4HNjUJ4dxbm50wZ7UhbkV0
         Yovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766598739; x=1767203539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8GNYWY73TI1Xhvsf5HSI9OWAeta0wWUObecrUir2UY=;
        b=mjgZBxdDixUbdKymDJeSxOrxDVujCCkOLBe/UN5BZxVRs5i1QacU4XrM4n/17WWv7r
         XWFBAkzs9PSw9HpIfMPH6jY8/UxALtdXSMrJqSrg5jVT5vCOkRVZ6pXGljOb2eIgN+UN
         W3yNyJC2BTNCps6bTk7mMwDzmZm469F6YRC6VFmgnCE58vwS6OGu3LYM83fDkMsdJu8Q
         P4/0P2qExPgu6ls2Vf2XJj7MDomukJkgOyl8CePjfj0Y8w4n+as+aB+t/p61sMfjUj8l
         V3d167n5UZVd1izwOVPCIzIm8imCB0+mjbGAYxbQui0QeEBc2qe1WtcxcOMxFcUHIap+
         BGmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9SBnURT7OcyRXjNFBb8U6dwMs3UCGIParAI6kxxfxVWe2yW2N8HSHr8+gl9CdhMqwLyKisuWx/n2vB71Sk3MmbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/veYvXSPrWJSkxn8fe70oeWyUcxSzJ1LPMw+atzSJvrr1kW0g
	teyychxAispYnt5VOZASK7UbH1I4CnL9C2Wm2ljNNIDDUU4jByd/RyXl
X-Gm-Gg: AY/fxX5giwhiHR8Y8Uae/lXDjg7pHJqX05dbEJmuE2HfosxDN01C5rYxOruysctbz+K
	TPQ7iN2TY8Y+vyaRtD3C17WM9F6wk95W2aIYaDf8FSBNyrg0xnQ8p9KcMAJ1DJODzPUp/XKWuBK
	Lpbn2LXx1IgBHpL9Mrmsew8bEFXkERjaGHknZadKxvG/AczOt/JX8VbcIWvycUx9kTBbG3kmqZH
	7CVFAIVU61OA2w/GnMNoBnjXRqfZ8/YkoLO35TMTusoW9rEYGsbJRgLbRm9QeJtwmMZst035sPC
	9FamWf+XHf0o57ShD7cmbxQtrZDFbCf5qGDSFJ/fkBmnAHteq6+O0DTNPbyTpU9nFtEWNKqhADz
	XeL3+QoCZvBHIRTSIDRSEW4Td/X8ZtxHFzWdNdcXcPMI5v0bfhm48U6C7/BrjzoUwCiZdtGWRY/
	fTA4w4se55D9N7ys//+m0qoMrTPVURs32PeJSC3R/aDItxl2uTd0zA17TZtRb4fYJQKL3RsdJf1
	TvZEJWSLBvLXusf5gUUbMPF
X-Google-Smtp-Source: AGHT+IHGhuu93iB9+Iu+92Z7s8P/1XYLIbGEAv3KqcgKPJ7h0I4QlZ2a0T4wLL1di9N4ZpEcKl/sFQ==
X-Received: by 2002:a05:600c:6610:b0:477:a219:cdc3 with SMTP id 5b1f17b1804b1-47d18bd56b8mr182241985e9.12.1766598739089;
        Wed, 24 Dec 2025 09:52:19 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm140167935e9.7.2025.12.24.09.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:52:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add CANFD node
Date: Wed, 24 Dec 2025 17:51:59 +0000
Message-ID: <20251224175204.3400062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the CANFD controller on the Renesas RZ/T2H Soc.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 63de8271f47c..19ace8d86160 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -237,6 +237,37 @@ rspi3: spi@81007000 {
 			status = "disabled";
 		};
 
+		canfd: can@80040000 {
+			compatible = "renesas,r9a09g077-canfd";
+			reg = <0 0x80040000 0 0x20000>;
+			interrupts = <GIC_SPI 633 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 632 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 628 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 626 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx";
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R9A09G077_CLK_PCLKH>,
+				 <&cpg CPG_CORE R9A09G077_PCLKCAN>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R9A09G077_PCLKCAN>;
+			assigned-clock-rates = <80000000>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+		};
+
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
 			reg = <0 0x80082000 0 0x400>,
-- 
2.52.0


