Return-Path: <linux-renesas-soc+bounces-19224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C20AF9500
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CEF36E023C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D12192598;
	Fri,  4 Jul 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGU+WUiO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07519156237;
	Fri,  4 Jul 2025 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638114; cv=none; b=NKvLDqiDcfvEFKMzsMp19H8RoGfwXF28t+StuAqo21SkNPrC6+aID/Qel+oxBL/uuLtTQcOm/bIm248ouQwK8o4bJJcy5k+z/C3RKNy41dZ3RZHRCCJnfiy8Ngma83srjIciCPSYoNIq++QJdZLqumMEfxxgpSVSgdEKLzax26w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638114; c=relaxed/simple;
	bh=Hi+Cf5FEH1kGi4WX5EgYVIzw39dLXbMmsOK2A/0tSwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Do4lhm5JpkceGUS+AdHdfneJVMY7eOPkUnQhN9fqNGf76MxIID7Yb6U3QXzzSThL3FKZVE7Lji6mtgYqu20FEM5Ji62RNZZV0oWP8SrXXC4m+qV6jIv83giN6kwx7g/jpOrLhfrVV+QlTLFlyRpasdNWkGhQGESk7xLES5yyiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGU+WUiO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a5257748e1so773193f8f.2;
        Fri, 04 Jul 2025 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751638111; x=1752242911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1D/t+PgijLP9GkIRveqyY7xW4IKJKrgjGI0MBJFGlo=;
        b=KGU+WUiO2gc6+YtMqBQyrPe6f6tt5gcJFEotoacJ3RgYP94R4+SgDFB+XJmnHg0Kz8
         938Xf+8TDhh58EE3+56OIxnsC6IkY+BxdoozdW2O1mYQiXtOPPgy4jvx+9JdhbyQh1Id
         jTbkrDXSxNy/K7JsKmiGxzDPd5irYkrrwhM+7hZrFho8WAb/p1NFfHHElJaEpCxq9qHY
         ecHGJpWs6Y3xOh9QGP59Ay+/1L+n7DvjFH3X1XRPwl7wTUpxZcTYNbDAk8GQ6OUD/Hyf
         kvuJpEZGEuVgjIHE2+c/TD48iKnuSMCLITHXpmwRduCZNYiL90BDBeUC2RUMwKa9ghXt
         osHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638111; x=1752242911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1D/t+PgijLP9GkIRveqyY7xW4IKJKrgjGI0MBJFGlo=;
        b=WlhrmkCgu8eyv6yif0RQ+TJCufYSPZ2oIOZxUjI5N0mE9gYx/O/C42VDywy8HJBeyo
         aB0HoN61IU2f4ZyR1GQsNkjgr7GH7GUNoHEpnLrwPxBppaLyKLARQF68FkSnkJZRVVFA
         orDVOCGDDkxSMeg0fTI8aJaMQc9OinoDQ70CMIj7xHOw4al8zLWiNL+XjvK1tl5EqqED
         +YeeFUxuy9neIYlwwP9O6PAg1oLRaaPA7vyEwI41nJ6uOhvSwwORF6dJj0E2I2YObjKU
         iDi2pfGsMmtXCchjNILuSf+AUFqaCtmDYV+P//3Ty7eF+3dprhd8QOftHNygkaULPJ7X
         x6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU99Z5j1Uav7a1Mwd+aZWU5w1LwMznFmwut97MScSofK4Up+r4FQjXa4M8dmDtXLzgAasdLAyHGF3bbW41Q@vger.kernel.org, AJvYcCX80gzUbwa6HyJSiOcPryoEAbdoUUepWFGfG1X8IaGaBCBN3JcTZvtfuY0CCmYO6EsUuPVXpQ50G0g5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4DonMwrct9hY84IQk8NlUQhTYUDu6g/9JK9D3VZEnYy1ltgv
	BuM97hqDbYOsHq+M3U4cxg7Dsc+OaOObXrXxSvkJx+1dfSZm9BF0P6qb
X-Gm-Gg: ASbGncvLWLRT2w0+YyVdMN35WW7JgGarM3sKDb9bVHUiy7agx2vN8967ndUUDeImnFj
	hGM5bT0ZrLZHeQ0HeZ8KKmx5+w/BMwgvttFspQ0joZekIJqfGwc1YrguwyMQyIO4E1SMOjsXq7+
	1Ff8tcsoODfNR1bKIf0E2HyJvMXH2+DFBnBqr/27zYoQGY4RJjDuz9AR6i9cWb8CNpaaC6odTtS
	bZx3FGhs2bIGSEFlpq8kCPg6ewe+6Jcth5LXqO5gyf916sucqJL8oynhERkKCPcqXGhSI9tzf5n
	CbesE+mY7DFbbZVG4PVo2FGFrA9Fs+mlOXWSiwuB+Lu6x+nIi0Tu5RqoV7BWATIF/Y6UH8PKmeE
	BxxUHsbhsY6bjVSFm4uir37t3MRqqqnc=
X-Google-Smtp-Source: AGHT+IFvT2MS9ybzQZ4LSii4ZPeJuA+dYs9au+uVp6/X10q35BklrTuPArCK1NleRcpL+s7hVSFYJA==
X-Received: by 2002:a05:6000:2509:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3b4970118aemr2071082f8f.2.1751638111069;
        Fri, 04 Jul 2025 07:08:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e31c:ff37:8f66:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm2535946f8f.83.2025.07.04.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:08:30 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: renesas: r9a09g057: Add XSPI node
Date: Fri,  4 Jul 2025 15:08:21 +0100
Message-ID: <20250704140823.163572-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add XSPI node to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 45aedd62a259..044f2a22f161 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -280,6 +280,27 @@ sys: system-controller@10430000 {
 			resets = <&cpg 0x30>;
 		};
 
+		xspi: spi@11030000 {
+			compatible = "renesas,r9a09g057-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x11030000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 0x9f>,
+				 <&cpg CPG_MOD 0xa0>,
+				 <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>,
+				 <&cpg CPG_MOD 0xa1>;
+			clock-names = "ahb", "axi", "spi", "spix2";
+			resets = <&cpg 0xa3>, <&cpg 0xa4>;
+			reset-names = "hresetn", "aresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@11400000 {
 			compatible = "renesas,r9a09g057-dmac";
 			reg = <0 0x11400000 0 0x10000>;
-- 
2.49.0


