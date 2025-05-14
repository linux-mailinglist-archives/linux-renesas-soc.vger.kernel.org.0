Return-Path: <linux-renesas-soc+bounces-17089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A78AB689C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A39E1BA0C34
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06845275858;
	Wed, 14 May 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezBmbFMT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AD2749DC;
	Wed, 14 May 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217746; cv=none; b=qHUO4CeTRlulnocKRXcXCzwzKbonm7GuKj1TViQdzFlzgNW3N2o4G8a83crgJmdUN3FoCmVLFQR/08ATsWwvFFxyGLTa+yJXUN43Na5yFcUp7W5Jn+/zuRzfQcbo8OjNP6TwZZoRFgxcYIDolYiYJyipZR2ndqx599wOdqVFrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217746; c=relaxed/simple;
	bh=a2wS02hOZkcp5ofSnbNYdWvDIDf8DDE2aXmH5jq8/XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLpET/9dTUggngfeGhlHetRPJUKwkHXkL3Rq3aZGXQ4tu2Hm3POyMQCpjj6HpDUvCcgyjfEMTDNSElKfvels7JPwR99DqtssVkv9xjeLUOoOch1JX8Ta5UoPMzac96vaHV/1+IsLeTyuNjUYeFJ22A2U5C+xzA1juIFCaJ3PwZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezBmbFMT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so67355745e9.1;
        Wed, 14 May 2025 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217743; x=1747822543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffoyyZVKt6AMbdhtQmuQ/wrz0qeqV6pG0N14DB0IQ40=;
        b=ezBmbFMTjqscdLnL8gdloay3EZ+N6fgnWCJyVW5Q0507rXs/ZE/BSEjaY+urGcM0vw
         1qY7z5kOKZdeP+VJ98BnCDDE2ZAHqBO5Iq4FwOajtww4B8XjLDnX6L55ojOSSbsplGyC
         dINWwYiUzh5N4iAnUFRfIJQ0Ew5Hq4m/ooo3KbUQraGEXqIkRoABwkwUMqV5OCVkAg79
         ajBB02f9Vh2w+TVID3YGb5itmPr/upc6ARIf4kPJPgdv4XNrj+PZ321Qb+iDegdLl41e
         yfbv7zaEyX0VN0K+uFqAT5cHumwSNQvLdsjaBRR82kTUF+fdyyn3hWAKSjcWOTSZz9y+
         hcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217743; x=1747822543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffoyyZVKt6AMbdhtQmuQ/wrz0qeqV6pG0N14DB0IQ40=;
        b=RfuXx527l6TV0DCvg5N2P1T3eVeFiUobRRNDFb5t/C8kEBPQIUMIF92rWTvPMjuOEv
         6VGRSqBA94hreyv/b3TlRGlKjshnvvZ1ytl6NJlqZ7fe8WDpCojTNLyxX2W7GDA7QRjt
         hOSWFVb/ZLdN3xs54u7Scq1MrSU+NiMCxDhFOutbc6TlOw7+mrjvfVAieKgXpyqlIAqo
         VPgjTGh4YE71gujgtFW/E18GOES8fnYqaLXumsgxTQP/N4Zs/mwDEUM+E8b5rQmC4FJy
         9Ua/Fmyw8gTHikS2sJM1gHXT1Ir6Iw7pKpCxmVZWwO1jgIlJ9r0/6AEgzrT2vOaE6I3C
         B6RA==
X-Forwarded-Encrypted: i=1; AJvYcCUoEdjvYm7xoz+8uu8XRhgzzCkuAuyfCcGzYc6AfWA9cs4gBuuEC6z31LJV7KEz314xR22MvxDGHa0H0hQ=@vger.kernel.org, AJvYcCWm9sGVpiy/QVkbTOylGMzYmoHGzX/pf91Ok8wvEOVFKt8qai4wLiEcQUEWyyI3GSd0mCpErihQerSO2kCRu4TvRUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fwBEQuSu71TPBOSiSP3aHER1vyXQO+Gw8qbjH4X16ek5u76e
	/J38II4Y9VnPwBxuZQ5VUhI9zmqVJbyaR9P4C8lhxDSWf4EGDcbH
X-Gm-Gg: ASbGncshSFdS0VVgUT5LcAZXagEI361LBkcMWpQgsnawoppbYcZCM+HvuuR7ScnVIJQ
	PhbMt5vXsmN0S9+WQIVfyY+S1J8ifZdSHscaMmN0B7FgBIpgJxTp32W651xR/SzDq2kkqtFKkvv
	NHtsZiFh+1gk4x0OTSXwYS+FErJLXkUvAr3yetYMdGoAkvnZT+oxP1SWMFFzupBB7+n9WiCv54r
	5IYcAUVfZ+OcmYOyf+ML+KlsObFTou1qiRPZnhfsc0V7+13Apc2LArd1A24EupwqYanaYDxHcY+
	+VSN9eRO0uDsJ8XSN4Ff2QUULqZKZEtsV6sRkQ5DmwnjuePPtd9fsAMp5gOeGsDTYj2nKxeuxcJ
	R
X-Google-Smtp-Source: AGHT+IHZmtSpDCAXPRNDHJbYM86QpruaQzBcNjfgWBbxjLKv4ojbKUCfDVdb5Y98bAzok3f0lLjztQ==
X-Received: by 2002:a05:600c:4e87:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442f20baf21mr20885505e9.7.1747217742686;
        Wed, 14 May 2025 03:15:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:42 -0700 (PDT)
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
Subject: [PATCH 07/10] arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
Date: Wed, 14 May 2025 11:15:25 +0100
Message-ID: <20250514101528.41663-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add WDT0-WDT3 nodes to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 0e168731f7df..93bcd5f203ef 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -257,6 +257,46 @@ ostm7: timer@12c03000 {
 			status = "disabled";
 		};
 
+		wdt0: watchdog@11c00400 {
+			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x11c00400 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x75>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@14400000 {
+			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x14400000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4d>, <&cpg CPG_MOD 0x4e>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x76>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@13000000 {
+			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x13000000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x50>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x77>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@13000400 {
+			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x13000400 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x52>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x78>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g056",
 				     "renesas,scif-r9a09g057";
-- 
2.49.0


